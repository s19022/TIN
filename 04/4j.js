function binarySearch(number, array){
	if (number === undefined || array === undefined) return -1;

	let leftPosition = 0;
	let rightPosition = array.length - 1;

	while(leftPosition <= rightPosition){
		let currentPosition = leftPosition + Math.floor((rightPosition - leftPosition) / 2);
		
		if(array[currentPosition] === number) return currentPosition;
		
		if(number > array[currentPosition]) leftPosition = currentPosition + 1;
		else rightPosition = currentPosition - 1;
	}
	return -1;
}