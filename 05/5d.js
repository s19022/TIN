function Student(firstName, lastName, id, grades){
	this.firstName = firstName;
	this.lastName = lastName;
	this.id = id;
	this.grades = grades;

	Object.defineProperties(this, {
		"average": {

			"get": function() {
				let averageGrade = 0;
				for(let i = 0; i < this.grades.length; i++){
					averageGrade += this.grades[i];
				}
			
				averageGrade /= this.grades.length;

				return averageGrade;	
			}
		},
		"fullName" : {
			"get" : function(){
				return this.firstName + " " + this.lastName;
			},
			"set" : function(fullName){
				this.firstName = fullName[0];
				this.lastName = fullName[1];
			}
		}
	});

	this.print = function(){
		console.log("Student with name: " + firstName + ", surname: " + lastName
				 + " has average point of " + this.average);
	}; 
}

let s = new Student("j", "g", 2, [1,2,3]);

s.print();