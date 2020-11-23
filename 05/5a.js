
let person = {
	firstName : "John",
	lastName : "Doe",
	age : 36,

	printFirstName : function (){
		console.log(firstName);
	},

	printLastName : function(){
		console.log(lastName);
	},

	printAge : function(){
		console.log(age);
	}
}

function print(obj){
	for (let prop in obj) {
 		console.log(prop + "(" + obj[prop] + ") : " + (typeof prop));
	}
}

print(person);