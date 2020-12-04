const fs = require('fs');
const http = require('http');
const url = require('url');


http.createServer(function (req, res) {
	const queryObject = url.parse(req.url,true).query;
	console.log(queryObject);

	const directoryName = queryObject.directoryName;

	console.log(directoryName);

	fs.watch(directoryName, (event, filename) => {
	  if (filename) {
		console.log(`${filename} file ${event}`);
	  }
	});

	res.writeHead(200, {'Content-Type': 'text/html'});
  
	res.end("Watcing directory " + require('path').resolve(directoryName));
 
	 
}).listen(8090);

