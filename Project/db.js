const mysql  = require('mysql');
const config = require('./config');



let getConnection = function (){
    return mysql.createConnection(config.db);
}
let addNewUser = function (login, passwordHash, firstName, lastName, callback){
    let connection = getConnection();
    connection.query('call addNewUser(?,?,?,?)', [
        login,
        passwordHash,
        firstName,
        lastName
    ], function(err, rows, fields) {
        if (err) {
            callback(err);
            return;
        }
        callback();
    });
}



let createToken = function (login, passwordHash, callback){
    let connection = getConnection();
    connection.query('select createToken(?, ?) as token', [
        login,
        passwordHash
    ], function(err, rows, fields) {
        if (err) {
            callback('', err);
            return;
        }
        callback(rows[0].token);
    });
}

let reassignToken = function (oldToken, callback){
    let connection = getConnection();
    connection.query('call reassignToken(?)', [
        oldToken
    ], function(err, rows, fields) {
        if (err) {
            callback(err);
            return;
        }
        callback();
    });
}

let createNewOrder = function (token, callback){
    let connection = getConnection();
    connection.query('select createNewOrder(?) as orderNumber', [
        token
    ], function(err, rows, fields) {
        if (err) {
            callback(0, err);
            return;
        }
        callback(rows[0].orderNumber);
    });
}

function addItem(connection, token, orderNumber, itemName, quantity){
    connection.query('call addItemToOrder(?,?,?,?)', [
        token,
        orderNumber,
        itemName,
        quantity
    ], function (){

    });

}

let addItemsToOrder = function (token, newOrder, callback){
    const connection = getConnection();
    createNewOrder(token, function (orderNumber, err){
        if (err){
            callback(err);
            return;
        }
        for (let item of newOrder) {
            addItem(connection, token, orderNumber, item.itemName, item.quantity);
        }
        callback();
    });
}

let isTokenValid = function (token, callback){
    let connection = getConnection();
    connection.query('select isTokenValid(?) as result', [
        token
    ], function(err, rows, fields) {
        if (err) {
            // console.log(err);
            callback(false);
            return;
        }
        let result = (rows[0].result === 1);
        callback(result);
    });
}

let getSystemUserRole = function (token, callback) {
    let connection = getConnection();
    connection.query('select getSystemUserRole(?) as result', [
        token
    ], function (err, rows, fields) {
        if (err) {
            callback('', err);
            return;
        }
        let result = (rows[0].result);
        callback(result);
    });
}

let addNewItem = function (token, itemName, itemPrice,callback) {
    let connection = getConnection();
    connection.query('call addNewItem(?,?,?)', [
        token,
        itemName,
        itemPrice
    ], function (err, rows, fields) {
        if (err) {
            callback(err);
            return;
        }
        callback();
    });
}

let updateItem = function (token, itemName, itemPrice,callback) {
    let connection = getConnection();
    connection.query('call updateItem(?,?,?)', [
        token,
        itemName,
        itemPrice
    ], function (err, rows, fields) {
        if (err) {
            callback(err);
            return;
        }
        callback();
    });
}


let deleteItem = function (token, itemName, callback) {
    let connection = getConnection();
    connection.query('call deleteItem(?,?)', [
        token,
        itemName
    ], function (err, rows, fields) {
        if (err) {
            callback(err);
            return;
        }
        callback();
    });
}



let getOrdersByUser = function (token, callback){
    let connection = getConnection();
    connection.query('call getAllOrdersByUser(?)', [
        token
    ], function (err, rows, fields) {
       callback(err, rows);
    });

}

let getAllProducts = function (callback){
    let connection = getConnection();
    connection.query('select itemName, (cast(price as decimal) / 100) as price from item', function (err, rows,fields){
        callback(err, rows, fields);
    });
}

module.exports.getAllProducts = getAllProducts;
module.exports.addNewUser = addNewUser;
module.exports.addNewItem = addNewItem;
module.exports.updateItem = updateItem;
module.exports.deleteItem = deleteItem;
module.exports.getSystemUserRole = getSystemUserRole;
module.exports.isTokenValid = isTokenValid;
module.exports.createToken = createToken;
module.exports.reassignToken = reassignToken;
module.exports.getOrdersByUser = getOrdersByUser;
module.exports.createNewOrder = createNewOrder;
module.exports.addItemsToOrder = addItemsToOrder;
