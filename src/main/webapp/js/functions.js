function validatePassword(){
    var password = document.getElementById("password").value;
    var passwordCheck = document.getElementById("confirm_password").value;
    if (password != passwordCheck)
    {
        alert("Passwords do not match");
        return false;
    }
}