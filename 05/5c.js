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

let studentProto = new Student("j", "g", 2, [1,2,3]);

function createStudent(firstName, lastName, id, grades){
	let newStudent = Object.create(studentProto);

	newStudent.firstName = firstName;
	newStudent.lastName = lastName;
	newStudent.id = id;
	newStudent.grades = grades;

	return newStudent;
}

console.log(createStudent("Ars", "Maderia", 3, [4,4,5]));




