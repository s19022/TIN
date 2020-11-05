let rec = function calculateFactorialRecursive(number) {
	if (number === 1) return 1;
	return number * rec(number - 1);
}

function calculateFactorialIterative(number){
	let res = 1;
	for (let i = number; i > 0; i--) {
		res *= i;
	}
	return res;
}


console.log(rec(5));

console.log(calculateFactorialIterative(5));