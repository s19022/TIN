function calculateFibonacci(index){
	if(index <= 1) return index;
	return calculateFibonacci(index - 1) + calculateFibonacci(index - 2);
}

console.log(calculateFibonacci(5));