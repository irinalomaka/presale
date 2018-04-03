const minPassLenght = 6;
const maxPassLenght = 12;

const regEmail = "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$";
const regPassword = ".{6,}";

function loginUser() {
	var emailInput = document.loginForm.loginEmail;
	var passwordInput = document.loginForm.loginPassword;
	var email = emailInput.value;
	var password = passwordInput.value;

	var isEmailValid  = isValidEmailInput(emailInput);
	var isPasswordValid = isValidPasswordInput(passwordInput);

	if (isEmailValid && isPasswordValid) {
		writeUserToDB(email, password);
		window.location = "../html/own_cab.html";
	}
}

function registerUserStep1(){
	var emailInput = document.registrationForm.registerEmail;
	var passwordInput = document.registrationForm.registerPassword;
	var confirmPasswordInput = document.registrationForm.confirmPassword;

	var isEmailValid  = isValidEmailInput(emailInput);
	var isPasswordsEqual = isValidConfirmPassword(passwordInput,confirmPasswordInput);

	if (isEmailValid && isPasswordsEqual) {
		alert("YYYYYPeeeee");
	}
}

function isValidPasswordInput(textInput) {
	if (!textInput.value.match(regPassword)) {
		textInput.style.background = '#ffe6e6';
		return false;
	}else{
		textInput.style.background = 'white';
		return true;
	}
}

function isValidConfirmPassword(passwordInput, confirmPasswordInput) {
	if (!isValidPasswordInput(passwordInput) || !isValidPasswordInput(confirmPasswordInput) || passwordInput.value != confirmPasswordInput.value) {
		passwordInput.style.background = '#ffe6e6';
		confirmPasswordInput.style.background = '#ffe6e6';
		return false;
	}else{
		passwordInput.style.background = 'white';
		confirmPasswordInput.style.background = 'white';
		return true;
	}
}

function isValidEmailInput(textInput) {
	if (isEmpty(textInput.value) || !textInput.value.match(regEmail)) {
		textInput.style.background = '#ffe6e6';
		return false;
	}else{
		textInput.style.background = 'white';
		return true;
	}
}

function isEmpty(str) {
    return (str.trim().length == 0);
}

function writeUserToDB(_email, _password) {
  firebase.database().ref('users/').push({
    email: _email,
    password : _password
  });
}



