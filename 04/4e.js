function findLongestWord(string){

	if(string === undefined) return string;

	let spliterator = " ";

	let arrayOfWords = string.split(spliterator);

	let max = arrayOfWords[0].length;
	let position = 0;
	
	for(let i = 1; i < arrayOfWords.length; i++){
		if(arrayOfWords[i].length > max){
			max = arrayOfWords[i].length;
			position = i;
		}
	}
	return arrayOfWords[position];
}

console.log(findLongestWord("dd d ddd dddddd f fff ffffff"));