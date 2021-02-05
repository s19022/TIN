const express = require('express');
const router = express.Router();
const path = require('path');
const addNewUser = require('../db').addNewUser;
const checkLogin = require('./login').checkLogin;

router.get('/', function (request, response) {
    response.sendFile(path.resolve('views/register.html'));
});

router.post('/',handleAddUser, addToken, handleError);

function handleAddUser(req, res, next){
    if (!req.body) {
        res.sendStatus(400);
        return;
    }
    const login = req.body.login;
    const password = req.body.password;
    let firstName = req.body.firstName;
    let lastName = req.body.lastName;


    if (login == null || password == null){
        res.sendStatus(400);
        return;
    }

    if (firstName === undefined) firstName = null;
    if (lastName === undefined) lastName = null;

    addNewUser(login, password, firstName, lastName, function (serverErr){
        if (serverErr){
            next(serverErr);
            return;
       }
       next();
    });
}

function addToken(req, res, next){
    checkLogin(req,res,next);
}

function handleError(err, req, res, next){
    res.sendStatus(400);
}

module.exports = router;


