class Student{
	constructor(firstName, lastName, id, grades){
		this.firstName = firstName;
		this.lastName = lastName;
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

	get fullName(){
		return this.firstName + " " + this.lastName;		
	}

	set fullName(fullName){
		this.firstName = fullName[0];
		this.lastName = fullName[1];
	}

	print(){
		console.log("Student with name: " + this.firstName + ", surname: " + this.lastName
				 + " has average point of " + this.average);
	}
}

let s = new Student("j", "g", 2, [1,2,3]);

s.print();