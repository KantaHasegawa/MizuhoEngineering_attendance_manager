let name_form = document.getElementById("user_name");
let email_form = document.getElementById("user_email");
let password_form = document.getElementById("user_password");
let password_confirmation_form = document.getElementById("user_password_confirmation");
let submit_button = document.getElementById("submit_button")
name_form.onchange = function () {
  if (name_form.value == "" || email_form.value == "") {
    submit_button.disabled = true;
  } else if (password_form.value != password_confirmation_form.value) {
    submit_button.disabled = true;
  } else if (password_form.value.length < 6) {
    submit_button.disabled = true;
  } else {
    submit_button.disabled = false;
  }
};

email_form.onchange = function () {
  if (name_form.value == "" || email_form.value == "") {
    submit_button.disabled = true;
  } else if (password_form.value != password_confirmation_form.value) {
    submit_button.disabled = true;
  } else if (password_form.value.length < 6) {
    submit_button.disabled = true;
  } else {
    submit_button.disabled = false;
  }
};

password_form.onchange = function () {
  if (name_form.value == "" || email_form.value == "") {
    submit_button.disabled = true;
  } else if (password_form.value != password_confirmation_form.value) {
    submit_button.disabled = true;
  } else if (password_form.value.length < 6) {
    submit_button.disabled = true;
  } else {
    submit_button.disabled = false;
  }
};

password_confirmation_form.onchange = function () {
  if (name_form.value == "" || email_form.value == "") {
    submit_button.disabled = true;
  } else if (password_form.value != password_confirmation_form.value) {
    submit_button.disabled = true;
  } else if (password_form.value.length < 6) {
    submit_button.disabled = true;
  } else {
    submit_button.disabled = false;
  }
};
