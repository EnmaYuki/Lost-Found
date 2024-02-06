<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="User Page.css">
</head>
<body>

<header><h1>Your Profile</h1></header>

<div>
    <form action="">
    <center>
    <label for="iconInput">
    <img id="userIcon" src="./image/default icon.png">
    <br><button onclick="changeIcon()">Upload Icon</button></br>
    <input type="file" id="iconInput" accept="image/*" style="display: none" onchange="handleIconChange(event)">
    </label>
    <h3>User Name: 123</h3>
    <h3>Mobile: 12345678</h3>
    <h3>Change Nick name: <input id="NicknameInput"><button onclick="saveNickName()">Save</button></h3>
    <h3>Change Password: <input id="passwordInput"><button onclick="savePassword()">Save</button></h3>
    <h3>Change Email: <input type="email" id="emailInput"><button onclick="saveEmail()">Save</button></h3>
    </center>
    </form>
</div>

<script>
function changeIcon(){
    document.getElementById("iconInput").click();
}

function handleIconChange(event){
    var file = event.target.files[0];
    var reader = new FileReader();

    reader.onload = function(e) {
        var image = new Image();
        image.src = e.target.result;
        
        image.onload = function() {
        var canvas = document.createElement("canvas");
        var context = canvas.getContext("2d");
        var width = 200;
        var height = 174;
        canvas.width = width;
        canvas.height = height;
        context.drawImage(image, 0, 0, width, height);
        document.getElementById("userIcon").src = canvas.toDataURL();
    };
};
    reader.readAsDataURL(file);
}


function saveNickName(){
    var NickInput = document.getElementById("NicknameInput").value.trim();
    if(NickInput === ""){
        alert("Update Failed: Nick name cannot be empty");
    }
    else{
        alert("Update Successfully: Nick name changed to " + NickInput);
    }
}

function savePassword(){
    var passwordInput = document.getElementById("passwordInput").value;
    var regex = /^(?=.*[A-Z])(?=.*\d).{8,}$/;

    if (regex.test(passwordInput)){
        alert("Update Successfully! Password is valid!");
    }
    else if(passwordInput === ""){
        alert("Update Failed! User name cannot be empty");
    }
    else {
        alert("Invalid password! Password must contain at least one uppercase letter and one digit.It must be at least 8 characters long.");
    }
}

function saveEmail(){
    var emailInput = document.getElementById("emailInput").value.trim();

    /*if (emailInput === ""){
        alert("Invalid email! Email cannot be empty.");
    }
    else if (!emailInput.includes("@")){
        alert("Invalid email! Email must contain the @ symbol.");
    }
    else {
        alert("Update Successfully!Email is valid!");
    }*/console.log(emailInput);
}
</script>
    
</body>
</html>