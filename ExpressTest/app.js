const express = require('express');
const path = require('path');
const port = 8000;

const app = express();


const taskA = require('./routes/taskA');
const taskB = require('./routes/taskB');
const taskC = require('./routes/taskC');
const taskD = require('./routes/taskD');


app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');

app.use('/hello', taskA);
app.use('/form', taskB);
app.use('/formdata', taskC);
app.use('/jsondata', taskD);

app.listen(port, () => console.log(`listening on port ${port}`));


