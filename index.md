## Welcome to Alpine User Registration

You can <a href="register.cfm">register for an account</a>, <a href="profile.cfm">view a profile</a>, or <a href="report.cfm">view all users</a>

### Register for an Account
This is the basic code for the User Registration form.

```markdown
<cfscript>
if(isDefined("form.submit")){
  objUser = createObject('component','user.cfc');
  newUser = objUser.create(firstName=form.firstName, lastName=form.lastName, emailAddress=form.emailAddress);
}
</cfscript>

# User Registration Form
<form action="registration.cfm">
  First Name: <input type="text" name="firstName" />
  Last Name: <input type="text" name="lastName" />
  Email Address: <input type="text" name="emailAddress" />
  <input type="submit" name="submit" />
</form>

```

### Profile Page
This is the code for a Profile page with the userID passed in by url (normally I would do session, but for the sake of this example I chose to use URL for demonstration purposes only.
```markdown
<cfscript>
objUser = createObject('component','user.cfc');
getUser = objUser.read(userID=url.userID);
</cfscript>

<cfoutput query="getUser">
  First Name: #getUser.firstName# <br>
  Last Name: #getUser.lastName# <br>
  Email: #getUser.emailAddress#
</cfoutput>
```

### Admin - User Report
This is the code that will be accessed when an Administrator has logged in and has the proper permissions to view the list of users.

```markdown
<cfscript>
objUser = createObject('component','user.cfc');
getUsers = objUser.read();
</cfscript>

<table>
<tr>
  <td>First Name</td>
  <td>Last Name</td>
  <td>Email Address</td>
</tr>
  
<cfoutput query="getUsers">
  <tr>
    <td>#getUsers.firstName#</td>
    <td>#getUsers.lastName#</td>
    <td>#getUsers.emailAddress#</td>
  </tr>
</cfoutput>
</table>
```
