function checkIfPalindrome(string){
	if(string === undefined) return false;
	if(string === "") return false; // it's not specified
	for (let i = 0; i < string.length/2; i++) {
		if(string[i] !== string[string.length - 1 - i]) return false;
	}
	return true;
}