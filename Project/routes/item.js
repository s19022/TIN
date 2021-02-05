const express = require('express');
const router = express.Router();
const addNewItem = require('../db').addNewItem;
const updateItem = require('../db').updateItem;
const dbDeleteItem = require('../db').deleteItem;
const reassignToken = require('../db').reassignToken;

router.post('/add', add, updateToken, handleError);
router.post('/update', update, updateToken, handleError);
router.post('/delete', deleteItem, updateToken, handleError);


function add(request, response, next){
    let token = request.cookies.token;
    let itemName = request.body.itemName;
    let itemPrice = request.body.itemPrice;

    addNewItem(token, itemName, itemPrice, function (err){
        if (err){
            console.log(err);
            next(err);
        }else{
            response.sendStatus(200);
            next()
        }
    });
}

function update(request, response, next){
    let token = request.cookies.token;
    let itemName = request.body.itemName;
    let itemPrice = request.body.itemPrice;

    updateItem(token, itemName, itemPrice, function (err){
        if (err){
            console.log(err);
            next(err);
        }else{
            response.sendStatus(200);
            next();
        }
    });
}


function deleteItem(request, response, next){
    let token = request.cookies.token;
    let itemName = request.body.itemName;

   dbDeleteItem(token, itemName, function (err){
        if (err){
            console.log(err);
            next(err);
        }else{
            response.sendStatus(200);
            next();
        }
    });
}

function updateToken(request, response, next){
    let token = request.cookies.token;
    reassignToken(token, function (err){
       if (err) {
           next(err);
       }
    });
}

function handleError(err, request, response, next){
    console.log(err);
    // for adding new item
    if (err.sqlMessage === 'Item with this name already exists'){
        response.sendStatus(400);
        return
    }
    //for updating or deleting existing item
    if (err.sqlMessage === 'Item with this name does not exist'){
        response.sendStatus(400);
        return
    }
    response.sendStatus(403);
}
module.exports = router;
