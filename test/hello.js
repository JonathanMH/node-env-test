const test = require('tape');
const hello = require('../src/hello.js')

test('hello', function (t) {
	t.plan(2);
	const actual = hello('Sargeras');
	const expected = 'Hello Sargeras.';
	t.equal(typeof actual, 'string');
	t.equal(actual, expected);
});
