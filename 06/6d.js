const firstName = document.getElementById('firstNameField');
const lastName = document.getElementById('lastNameField');
const age = document.getElementById('ageField');
const email = document.getElementById('emailField');

const table = document.getElementById('myTable').getElementsByTagName('tbody')[0];

function addRow(){
	let tr = document.createElement("tr");
	let td1 = document.createElement("td");
	let td2 = document.createElement("td");	
	let td3 = document.createElement("td");	
	let td4 = document.createElement("td");	

	td1.innerHTML = firstName.value;
	td2.innerHTML = lastName.value;
	td3.innerHTML = age.value;
	td4.innerHTML = email.value

	tr.append(td1, td2, td3, td4);
	table.append(tr);

	firstName.value = "";
	lastName.value = "";
	age.value = "";
	email.value = "";
}
