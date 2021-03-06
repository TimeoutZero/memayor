let winston = require('winston');
winston.level = process.env.LOG_LEVEL;

let logger = new winston.Logger({
	transports: [
		new winston.transports.File({
			level: 'info',
			filename: './memayor.log',
			handleExceptions: true,
			json: true,
			maxsize: 5242880, //5MB
			maxFiles: 5,
			colorize: false
		}),
		new winston.transports.Console({
			level: 'debug',
			handleExceptions: true,
			json: false,
			colorize: true
		})
	],
	exitOnError: false
});

logger.stream = {
	write: (message, encoding) => {
		logger.info(message);
	}
};


module.exports = logger;