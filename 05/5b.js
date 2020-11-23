function Student(firstName, lastName, id, grades){
	this.firstName = firstName;
	this.lastName = lastName;
	this.id = id;
	this.grades = grades;

	this.print = function(){
		let averageGrade = 0;

		for(let i = 0; i < grades.length; i++){
			averageGrade += grades[i];
		}
		averageGrade /= grades.length;

		console.log("Student with name: " + firstName + ", surname: " + lastName
				 + " has average point of " + averageGrade);
	};

}

let s = new Student("j", "g", 2, [1,2,3]);

s.print();