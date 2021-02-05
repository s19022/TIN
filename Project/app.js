const express = require('express');
const port = 8000;

const app = express();
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');

const register = require('./routes/register');
const login = require('./routes/login');
const homePage = require('./routes/homePage');
const item = require('./routes/item');
const orders = require('./routes/orders');


app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
}));

app.use(cookieParser('secret key'));

app.use('/register', register);
app.use('/login', login);
app.use('/homePage', homePage);
app.use('/item', item);
app.use('/orders', orders);


app.listen(port, () => console.log(`listening on port ${port}`));


