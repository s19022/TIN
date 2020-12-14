const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');

router.use(bodyParser.json());
router.use(bodyParser.urlencoded({     // to support URL-encoded bodies
    extended: true
}));



router.post('/', (req, res) => {
    console.log(req.body);
    // res.send(req.body);
    res.render('taskD.ejs', {data : (req.body)});
});

module.exports = router;

