class Person{
	constructor(firstName, lastName){
		this.firstName = firstName;
		this.lastName = lastName;
	}

	get fullName(){
		return this.firstName + " " + this.lastName;		
	}

	set fullName(fullName){
		this.firstName = fullName[0];
		this.lastName = fullName[1];
	}

	print(){
		console.log(this.toString());
	}

	toString(){
		return "First name : " + this.firstName + ", surname: " + this.lastName;
	}
}



/**************************/

class Student extends Person{
	constructor(firstName, lastName, id, grades){
		super(firstName, lastName);
		this.id = id;
		this.grades = grades;
	}

	get average(){
		let averageGrade = 0;
		for(let i = 0; i < this.grades.length; i++){
			averageGrade += this.grades[i];
		}
	
		averageGrade /= this.grades.length;

		return averageGrade;
	}

	toString(){
		return super.toString() + " is a student with average point of " + this.average;
	}	

	print(){
		console.log(this.toString());
	}



}

let p = new Person("John", "Doe");

p.print();

let s = new Student("j", "g", 2, [1,2,3]);

s.print();