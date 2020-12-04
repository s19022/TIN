const http = require('http');
const url = require('url');

http.createServer(function (req, res) {
	const queryObject = url.parse(req.url,true).query;
	console.log(queryObject);
	let number1;
	let number2;
	let result;
	try{
		number1 = parseParameter(queryObject.param1);
		number2 = parseParameter(queryObject.param2);
		
		result = calculateResult(req.url, number1, number2);
	}catch(e){
		res.writeHead(400, {'Content-Type': 'text/html'});
		res.end(e);
		return;
	}
  	res.writeHead(200, {'Content-Type': 'text/html'});
  	let responseText = "<!DOCTYPE html>" + 
			"<html>" + 
				"<head>" +
					"<title>task7a</title>" + 
				"</head>" + 
				"<body>" +
				"	<p>Request parametr 1: " + number1 + ", parametr 2 :" + number2 + "</p>" + 
				"	<p>Result : " + result + "</p>" + 
				"</body>" + 
			"</html>";
  	res.end(responseText);
  	//res.end(result + "");
}).listen(8080);

function parseParameter(param){	
	if (param === undefined || param === '') throw ("param is empty");	
	let number = Number(param);
	if (Number.isNaN(number)) throw ("param can't be parsed to number");
	return number;
}

function calculateResult(requestUrl, number1, number2){
	if (requestUrl.includes('add')) return number1 + number2;
	if (requestUrl.includes('sub')) return number1 - number2;
	if (requestUrl.includes('mul')) return number1 * number2;
	if (requestUrl.includes('div')){
		if (number2 === 0) throw "/ by zero";
		return number1 / number2;
	}
	throw "Operator is not supported";
}
