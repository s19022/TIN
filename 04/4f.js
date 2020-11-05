function checkIfPrime(number){
	if (number === 1) return "1 is neither prime nor composite.";
	for (i = 2; i <= number / 2; i++) {
		if (number % i == 0) return number + " is not prime";
    }
    return number  + " is prime";
}

console.log(checkIfPrime(29));