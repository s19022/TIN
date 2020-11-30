function validate(){
    return (
    validateEmail() &
    valitadeAge());
}

function validateEmail(){
    let regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
    let email = document.getElementById('emailField').value;
    if(regex.test(email)){ 
        markAsPassed('emailField');
        return true;
    }
    markAsFailed('emailField');
    return false; 

}

function valitadeAge(){
    let age = document.getElementById('ageField').value;
    if (Number.isNaN(Number(age)) || Number(age) <= 0){
        markAsFailed('ageField');
        return false;
    }
    markAsPassed('ageField');
    return true;
}

function markAsPassed(id){
    document.getElementById(id).style.backgroundColor = "green";
} 

function markAsFailed(id){
    document.getElementById(id).style.backgroundColor = "red";
}
