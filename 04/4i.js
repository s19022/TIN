function amountToCoins(amount, coins) {
	let values = new Array(coins.length);
	for(let i = 0; i < coins.length; i++){
		values[i] = Math.floor(amount / coins[i]);
		amount %= coins[i];
	}
	return values;
}

function test(){
	let amount = 146;
	let coins = [25, 10, 5, 2, 1];
	let values = amountToCoins(amount, coins);
	let res = amount + " : "
	for(let i = 0; i < coins.length; i++){
		res += (coins[i] + "x" + values[i] + ", ");
	}
	res.substring(0,  res.length - 2);
	return res;
}

console.log(test());