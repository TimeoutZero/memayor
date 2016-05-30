var express = require('express'),
    dao     = require('./dao.js');

var router = express.Router();

router.route('/')
    .get((req, res) => {
        executer(dao.findAll(), res);
    });
    

function executer(promise, res) {
	promise
		.then((proposals) => {
			res.send(proposals)
		}).catch((err) => {
			res.status(500).json(err);
		})
		.done();
}