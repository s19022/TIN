const express = require('express');
const router = express.Router();
const isTokenValid = require('../db').isTokenValid;
const getSystemUserRole = require('../db').getSystemUserRole;
const getAllProducts = require('../db').getAllProducts;

let userStatus;
let productList;
function errorHandler(err, req, res, next) {
    res.render('error.ejs', { error : err});
}

function guestHandler(request, response, next){
    if (request.cookies.token != null) {
        next();
        return;
    }
    getProductsList(function (productList){
        if (!productList) {
            next("err");
            return;
        }
        response.render('homePage.ejs', {status : 'guest', products : productList});
    });
}


function validateToken(request, response, next){
    isTokenValid(request.cookies.token, function(isValid){
        if (isValid){
            next();
            return;
        }

        getProductsList(function (productList){
            if (!productList) {
                next("err");
                return;
            }
            response.render('homePage.ejs', {status : 'expiredToken', products : productList});
        });
    });
}

function loggedUserHandler(request, response, next){
    let token = request.cookies.token;
    getSystemUserRole(token, function(userRole, err){
        if (err){
            console.log(err);
            next(err);
            return;
        }

        getProductsList(function (productList){
            if (!productList) {
                next("err");
                return;
            }
            response.render('homePage.ejs', {status : userRole, products : productList});
        });
    });
}

function getProductsList(callback){
    getAllProducts(function (err, rows){
        if (err){
            callback();
            return;
        }
        callback(rows);
    })
}

router.get('/', guestHandler, validateToken, loggedUserHandler, errorHandler);
module.exports = router;