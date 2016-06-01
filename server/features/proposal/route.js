var express  = require('express'),
	dao 	 = require('./dao.js');
	
var router = express.Router();

router.route('/:id/proposal')
	.get((req, res) => {
		let cityId = req.params.id;
		executer(dao.findAllByCityId(cityId), res);
	})
	.post((req, res) => {
		
		var proposal = {
			title 		: req.body.title,
			description : req.body.description,
			categories 	: req.body.categories,
			cityId		: req.params.id	
		};
		
		executer(dao.save(proposal), res);
	});

router.route('/:id/proposal/:proposalId')
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