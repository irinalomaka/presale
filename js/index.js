const minPassLenght = 6;
const maxPassLenght = 12;

const regEmail = "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$";
const regPassword = ".{6,}";

function loginUser() {
	var emailInput = document.loginForm.loginEmail;
	var passwordInput = document.loginForm.loginPassword;
	var email = passwordInput.value;
	var password = document.loginForm.loginPassword.value;

	var isEmailValid  = isValidEmailInput(emailInput);
	var isPasswordValid = isValidPasswordInput(passwordInput);

	if (isEmailValid && isPasswordValid) {
		window.location = "../html/own_cab.html";
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


