const express = require('express');
const bodyParser = require('body-parser');
const router = express.Router();

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
}));



router.post('/', (req, res) => {
    console.log(req.body)
    // res.send(req.body);

    res.render('taskC.ejs', {firstName : req.body.firstName, lastName : req.body.lastName, age : req.body.age});
});

module.exports = router;

