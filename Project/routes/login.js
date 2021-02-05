const express = require('express');
const router = express.Router();
const path = require('path');
// const checkLogin = require('../db').checkLogin;
const createToken = require('../db').createToken;

router.get('/', function (request, response) {
    response.sendFile(path.resolve('views/login.html'));
});

router.post('/',checkLogin, handleError);

function checkLogin(req, res, next){
    if (!req.body) {
        res.sendStatus(400);
        return;
    }
    const login = req.body.login;
    const password = req.body.password;

    if (login == null || password == null){
        res.sendStatus(400);
        return;
    }

    createToken(login, password, function (token, err){

        if (err) {
            next(err);
            return;
        }

        console.log('redirecting...');
        let options = {
            maxAge: 1000 * 60 * 15 * 4, // would expire after an hour
        }
        res.cookie("token", token, options);
        res.redirect( '/homePage');
    });
}

function handleError(err, req, res, next){
    res.sendStatus(400);
}

module.exports = router;
module.exports.checkLogin = checkLogin;

