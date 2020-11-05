function findLargestNumber(array){
	let max = array[0];
	let position = 0;
	for(let i = 0; i < array.length; i++){
		if (array[i] > max) {
			max = array[i];
			position = i;
		}
	}
	return position;
}

function findLowestNumber(array){
	let min = array[0];
	let position = 0;
	for(let i = 0; i < array.length; i++){
		if (array[i] < min) {
			min = array[i];
			position = i;
		}
	}
	return position;

}

function findSecondLargest(array){
	let max =  findLargestNumber(array);
	array.splice(max, 1);
	let secondMax = findLargestNumber(array);
	return array[secondMax];	
}


function findSecondLowest(array){
	let min =  findLowestNumber(array);
	array.splice(min, 1);
	let secondMin = findLowestNumber(array);
	return array[secondMin];	
}
console.log("The second biggest number for [1,2,3,4,5,6,7,8,9,0] is "
	 + findSecondLargest([1,2,3,4,5,6,7,8,9,0]));

console.log("The second lowest number for [1,2,3,4,5,6,7,8,9,0] is "
	 + findSecondLowest([1,2,3,4,5,6,7,8,9,0]));