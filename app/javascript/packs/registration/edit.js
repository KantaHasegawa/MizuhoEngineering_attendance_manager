let name_form = document.getElementById("user_name");
let email_form = document.getElementById("user_email");
let password_form = document.getElementById("user_password");
let password_confirmation_form = document.getElementById("user_password_confirmation");
let submit_button = document.getElementById("submit_button")
let email_error_message = document.getElementById("email_error_message")
name_form.addEventListener("change", validation);
email_form.addEventListener("change", validation);
password_form.addEventListener("change", validation);
password_confirmation_form.addEventListener("change", validation);

email_array = [];
gon.emails.forEach((item) => {
  email_array.push(item["email"]);
});

function is_email_unique() {
  const even = (element) => email_form.value === element;
  const result = email_array.some(even);
  if (result == true) {
    email_error_message.hidden = false;
  } else {
    email_error_message.hidden = true;
  }
  return result;
}

function validation () {
  if (
    is_email_unique() ||
    name_form.value == "" ||
    email_form.value == "" ||
    password_form.value != password_confirmation_form.value ||
    password_form.value.length < 6
  ) {
    submit_button.disabled = true;
  } else {
    submit_button.disabled = false;
  }
};
