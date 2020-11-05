function sortByAlphabeticalOrder(string){
	if (string === undefined) return string;
	let output = "";
	for(let letter = 97; letter <= 122; letter++){
		for(let i = 0; i < string.length; i++){
			if(String.fromCharCode(letter) === string[i] 
				|| String.fromCharCode(letter).toUpperCase() === string[i]) {
				output += string[i];
				continue;	
			}
		}
	}
	return output;
}

console.log(sortByAlphabeticalOrder("WebMasTer"));