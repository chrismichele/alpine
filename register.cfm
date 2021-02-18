<cfscript>
include 'includes/header.cfm';
if(isDefined("form.submit")){
  newUser = objUser.create(
    firstName=form.firstName, 
    lastName=form.lastName, 
    emailAddress=form.emailAddress
  );
}
</cfscript>

<div class="alert alert-info">Welcome to User Account Registration. Please enter your contact information below and then click the 'CREATE USER' button.</div>

<form action="registration.cfm">
<div class="container">
    <div class="form-group">
        <label for="firstName" class="control-label">First Name</label>
        <input type="text" name="firstName" class="form-control" />
    </div>
    <div class="form-group">
        <label for="lastName" class="control-label">Last Name</label>
        <input type="text" name="lastName" class="form-control" />
    </div>
    <div class="form-group">
        <label for="emailAddres" class="control-label">Email Address</label>
        <input type="text" name="emailAddress" class="form-control" />
    </div>
    <button class="btn btn-primary" name="submit">CREATE USER</button>
</div>
</form>