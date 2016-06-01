var express = require('express'),
    dao     = require('./dao.js');

var router = express.Router();

router.route('/search')
    .get((req, res) => {
        executer(dao.search(req.query.name), res);
    });

router.route('/:id')
    .get((req, res) => {
        executer(dao.findById(req.params.id), res);
    });

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

module.exports = router;