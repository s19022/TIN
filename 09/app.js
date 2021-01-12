const express = require('express');

const app = express();
const jsonParser = express.json();

function addHandler(request, response, next){
    if (request.body.operation !== "add") {
        next();
        return;
    }
    let operand1 = parseFloat(request.body.operand1);
    let operand2 = parseFloat(request.body.operand2);

    let data = {
        serverAnswer : (operand1 + operand2)
    };

    console.log(data);
    response.json(data);
}

function subtractHandler(request, response, next){
    if (request.body.operation !== "subtract") {
        next();
        return;
    }
    let operand1 = parseFloat(request.body.operand1);
    let operand2 = parseFloat(request.body.operand2);

    let data = {
        serverAnswer : (operand1 - operand2)
    };

    console.log(data);
    response.json(data);
}

function multiplyHandler(request, response, next){
    if (request.body.operation !== "multiply") {
        next();
        return;
    }
    let operand1 = parseFloat(request.body.operand1);
    let operand2 = parseFloat(request.body.operand2);

    let data = {
        serverAnswer : (operand1 * operand2)
    };

    console.log(data);
    response.json(data);
}


function divideHandler(request, response, next){
    if (request.body.operation !== "divide") {
        next();
        return;
    }
    let operand1 = parseFloat(request.body.operand1);
    let operand2 = parseFloat(request.body.operand2);

    let serverAnswer;
    if (operand2 === 0){
        serverAnswer = "cannot divide by 0";
    }else{
        serverAnswer = operand1/operand2;
    }

    let data = {
        serverAnswer : serverAnswer
    };

    console.log(data);
    response.json(data);
}

app.post('/calculate', jsonParser,
    (request, response, next) => {
        if (!request.body || (request.body.operand1 === '' || request.body.operand2 === '')) {
            response.sendStatus(400);
            return;
        }
        next();
    },
    addHandler,
    subtractHandler,
    multiplyHandler,
    divideHandler,
    (request, response) => {

          let data = {
            serverAnswer : "operation '" + request.body.operation + "' is not supported"
          };
          console.log(data);
          response.json(data);
    }
);

app.get('/', function (request, response) {
    response.sendFile(__dirname + '/userSide/index.html');
});

app.listen(8000);