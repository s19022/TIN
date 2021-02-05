const express = require('express');
const router = express.Router();
const getOrdersByUser = require('../db').getOrdersByUser;
const reassignToken = require('../db').reassignToken;
const createNewOrder = require('../db').createNewOrder;
const addItemsToOrder = require('../db').addItemsToOrder;

router.get('/', getOrders, prolongToken, handleError);
router.post('/', addOrder, prolongToken, handleError);


function getOrders(request, response, next){
    let token = request.cookies.token;
    getOrdersByUser(token, function (err,rows){
        if (err){
            next(err);
        }else{
            let data = {"orders" : rows[0]};
            next();
            response.json(data);
        }
    });
}

function addOrder(request, response, next){
    let token = request.cookies.token;
    let newOrder = request.body.newOrder;
    addItemsToOrder(token, newOrder, function (err){
       if (err){
           console.log('got error');
           next(err);
           return;
       }
        response.sendStatus(200);
    });
}

function prolongToken(request, response, next){
    let token = request.cookies.token;
    reassignToken(token, function (err) {
        if (err) {
            next(err);
        }
    });
}

function handleError(err, request, response, next){
    if (err.sqlMessage === 'Given token is invalid'){
        response.status(401);
        response.end();
        return;
    }
    if (err){
        response.sendStatus(403);
    }
}
module.exports = router;