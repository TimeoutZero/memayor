var express  = require('express'),
	dao 	 = require('./dao.js');
	
var router = express.Router();

router.route('/')
	.get((req, res) => {
		executer(dao.findAll(), res);
	})
	.post((req, res) => {
		
		var proposal = {
			title 		: req.body.title,
			description : req.body.description,
			categories 	: req.body.categories,
			city		: req.body.city	
		};
		
		executer(dao.save(proposal), res);
	});

router.route('/:id')
	.get((req, res) => {
		executer(dao.findById(req.params.id), res);
	})
	.put((req, res) => {
		
	})
	.delete((req, res) => {
		console.log(`[DELETE] Proposal id=${req.params.id}`);
		executer(dao.remove(req.params.id), res);
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