var http = require('http');

const PORT = process.env.PORT;
const ANIMAL = process.env.ANIMAL;

http.createServer((_, res) => {
	res.writeHead(200, { 'Content-Type': 'text/plain; charset=UTF-8' });
	res.end(`${ANIMAL}`);
}).listen(3000 || PORT);
