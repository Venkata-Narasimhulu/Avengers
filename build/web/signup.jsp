<%-- 
    Document   : signup
    Created on : 09-Jan-2024, 12:03:25 am
    Author     : Girivardhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Arial', sans-serif;
      background-image: url('1.png');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .signup-form {
      width: 60%;
      max-width: 500px;
      background-color: rgba(255, 255, 255, 0.4);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .signup-form h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      font-weight: bold;
    }

    .form-control {
      border-radius: 5px;
    }

    .btn-signup {
      background-color: #007bff;
      color: #fff;
    }

    .error-message {
      color: red;
      font-size: 12px;
      margin-top: 5px;
    }
  </style>
</head>
<body>

<div class="signup-form">
  <h2>Sign Up</h2>
  <form  action="SignupServlet1" method="post">


    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter your name" name="name" required>
      <div class="error-message" id="nameError"></div>
    </div>

    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter your email" name="email" required>
      <div class="error-message" id="emailError"></div>
    </div>

    <div class="form-group">
      <label for="password">Set Password:</label>
      <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password" required>
      <div class="error-message" id="passwordError"></div>
    </div>

    <div class="form-group">
      <label for="confirmPassword">Confirm Password:</label>
      <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm your password" required>
      <div class="error-message" id="confirmPasswordError"></div>
    </div>

    <div class="form-group">
      <label for="mobile">Mobile Number:</label>
      <input type="tel" class="form-control" id="mobile" placeholder="Enter your mobile number" pattern="[0-9]{10}" name="mobile" title="Should contain exactly 10 digits" required>
      <div class="error-message" id="mobileError"></div>
    </div>

    <button type="submit" class="btn btn-signup btn-block" onclick="validateForm()">Sign Up</button>
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
  function validateForm() {
    var name = document.getElementById('name').value;
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var mobile = document.getElementById('mobile').value;

    // Validate name (only alphabets)
    if (!/^[A-Za-z ]+$/.test(name)) {
      document.getElementById('nameError').innerText = 'Name should contain only alphabets.';
      return false;
    } else {
      document.getElementById('nameError').innerText = '';
    }

    // Validate email format
    if (!isValidEmail(email)) {
      document.getElementById('emailError').innerText = 'Invalid email format.';
      return false;
    } else {
      document.getElementById('emailError').innerText = '';
    }

    // Validate password (at least 8 characters)
    if (password.length < 8) {
      document.getElementById('passwordError').innerText = 'Password should contain at least 8 characters.';
      return false;
    } else {
      document.getElementById('passwordError').innerText = '';
    }

    // Validate confirm password (matches set password)
    if (password !== confirmPassword) {
      document.getElementById('confirmPasswordError').innerText = 'Passwords do not match.';
      return false;
    } else {
      document.getElementById('confirmPasswordError').innerText = '';
    }

    // Validate mobile number (exactly 10 digits)
    if (!/^[0-9]{10}$/.test(mobile)) {
      document.getElementById('mobileError').innerText = 'Mobile number should contain exactly 10 digits.';
      return false;
    } else {
      document.getElementById('mobileError').innerText = '';
    }

    // All validations passed, redirect to login.html
    window.location.href = 'login.html';

    // Prevent form submission (optional, as the redirection will happen before submission)
    return false;
  }

  function isValidEmail(email) {
    // Regular expression for basic email validation
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }
</script>

</body>
</html>


