<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>
<style>

.member-register * {
  box-sizing: border-box;
}

/* Add padding to containers */
.member-register {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
.member-register input[type=text],.member-register input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

.member-register input[type=text]:focus,.member-register  input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
.member-register hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.member-register .registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.member-register .registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
.member-register a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.member-register .signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>

<form action="/action_page.php">
  <div class="member-register">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
    <hr>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
</form>

<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>