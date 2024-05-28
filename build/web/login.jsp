<%-- 
    Document   : login
    Created on : 09-Jan-2024, 9:46:02 am
    Author     : Girivardhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    body {
      background-image: url('loginn.png'); /* Path to your background image */
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      color: #fff; /* Set text color to be visible on the background */
      margin: 0; /* Remove default body margin */
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      font-family: 'Arial', sans-serif; /* Change the font family as needed */
    }

    .container {
      max-width: 400px;
      background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
      padding: 20px;
      border-radius: 10px;
      text-align: center; /* Center the content inside the container */
      position: relative; /* Set the position of the container to relative */
    }

    .logo {
      width: 200px; /* Set the width of the larger logo */
      position: absolute; /* Set the position of the logo to absolute */
      top: -100px; /* Adjust the top position to move it outside the container */
      left: 50%; /* Center the logo horizontally */
      transform: translateX(-50%); /* Center the logo horizontally */
    }

    .form-group {
      position: relative;
    }

    #showPassword {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #fff; /* Set the color of the "Show Password" label */
    }

    .error-message {
      color: #ff5555; /* Set the color for error messages */
      margin-top: 5px;
    }

    .btn {
      position: relative;
      padding: 5px 10px;
      cursor: pointer;
      font-size: 18px;
      background: #7ed957;
      border-top-right-radius: 10px;
      border-bottom-left-radius: 10px;
      transition: all 1s;
    }

    .btn:after,
    .btn:before {
      content: " ";
      width: 5px;
      height: 5px;
      position: absolute;
      border: 0px solid #fff;
      transition: all 1s;
    }

    .btn:after {
      top: -1px;
      left: -1px;
      border-top: 2px solid black;
      border-left: 2px solid black;
    }

    .btn:before {
      bottom: -1px;
      right: -1px;
      border-bottom: 2px solid black;
      border-right: 2px solid black;
    }

    .btn:hover {
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
    }

    .btn:hover:before,
    .btn:hover:after {
      width: 100%;
      height: 100%;
    }

    .data-container {
      background: #EAEAEA;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    #source-link {
      top: 60px;
    }

    #source-link>i {
      color: rgb(94, 106, 210);
    }

    #yt-link {
      top: 10px;
    }

    #yt-link>i {
      color: rgb(219, 31, 106);
    }

    .meta-link {
      align-items: center;
      backdrop-filter: blur(3px);
      background-color: rgba(255, 255, 255, 0.05);
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 6px;
      box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
      cursor: pointer;
      display: inline-flex;
      gap: 5px;
      left: 10px;
      padding: 10px 20px;
      position: fixed;
      text-decoration: none;
      transition: background-color 600ms, border-color 600ms;
      z-index: 10000;
    }

    .meta-link:hover {
      background-color: rgba(255, 255, 255, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .meta-link>i,
    .meta-link>span {
      height: 20px;
      line-height: 20px;
    }

    .meta-link>span {
      color: black;
      font-family: "Rubik", sans-serif;
      transition: color 600ms;
    }
  </style>
</head>
<body>

<div class="container">
  <img src="logo.png" alt="Logo" class="logo">
  <h2 class="text-center mb-4">Login</h2>
  <form id="loginForm" action="LoginServlet" method="post">
    <div class="form-group">
      <label for="username" style="color: #fff;">Username:</label>
      <input type="text" class="form-control" id="username" placeholder="Enter your username" name="username" required>
      <div class="error-message" id="usernameError"></div>
    </div>
    <div class="form-group">
      <label for="password" style="color: #fff;">Password:</label>
      <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password" required>
      <div class="error-message" id="passwordError"></div>
      <input type="checkbox" id="showPassword"> <label for="showPassword" id="showPasswordLabel">Show Password</label>
    </div>
    <button type="submit" class="btn btn-primary btn-block" >Login</button>
    <a href="signup.jsp" class="btn btn-secondary btn-block">Sign Up</a>
  
    <button type="button" class="btn btn-link btn-block" onclick="forgotPassword()">Forgot Password?</button>
  </form>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

  function forgotPassword() {
    // Redirect to the forgot_password.html page
    window.location.href = "forgot_password.html";
  }
</script>

</body>
</html>

