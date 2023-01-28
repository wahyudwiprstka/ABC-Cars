function validateForm() {
    var firstname = document.forms["myForm"]["firstname"].value;
    var lastname = document.forms["myForm"]["lastname"].value;
    var address = document.forms["myForm"]["address"].value;
    var contact = document.forms["myForm"]["contact"].value;
    var username = document.forms["myForm"]["username"].value;
    var password = document.forms["myForm"]["password"].value;
    var confirmPassword = document.forms["myForm"]["confirm-password"].value;

    
    if (firstname == "") {
      alert("First name must be filled out");
      return false;
    }
    if (lastname == "") {
      alert("Last name must be filled out");
      return false;
    }
    if (address == "") {
      alert("Address must be filled out");
      return false;
    }
    if (contact == "") {
      alert("Contact must be filled out");
      return false;
    }
    if (contact.length < 8) {
        alert("Contact must be filled greater than 8 characters");
        return false;
    }
    if (!/^\d+$/.test(contact)) {
        alert("Contact must be filled with numbers only");
        return false;
    }
    if (username == "") {
      alert("Username must be filled out");
      return false;
    }
    if (password == "") {
      alert("Password must be filled out");
      return false;
    }
    if (password.length < 6) {
        alert("Password must be greater than 6 characters");
        return false;
    }
    if (confirmPassword != password) {
        alert("Both password must be the same");
        return false;
    }
  }