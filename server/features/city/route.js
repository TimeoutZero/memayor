var express = require('express'),
    dao     = require('./dao.js'),
    request = require('request');

var router = express.Router();

router.route('/search')
    .get((req, res) => {
        executer(dao.search(req.query.name), res);
    });

router.route('/:id')
    .get((req, res) => {
        
        dao.findById(req.params.id)
            .then((city) => {
                request.get(`https://pt.wikipedia.org/w/api.php?action=query&prop=extracts&titles=${city.name}&format=json&exintro=1`, (error, response, body) => {
                    
                    if (error) {
                        reject(error);
                    } else {
                        body = JSON.parse(body);
                        
                        var pages   = body.query.pages
                        var content = pages[Object.keys(body.query.pages)[0]].extract;
                       
                        city._doc.description = content.length >= 350 ?  content.substr(0, 350) + "..." : content;;
                        res.send(city)
                    }
                })
            })
            .catch((err) => {
                res.status(500).json(err);
            })
            .done();
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