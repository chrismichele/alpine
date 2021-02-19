## Welcome to Alpine User Registration

You can <a href="register.cfm">register for an account</a>, <a href="profile.cfm">view a profile</a>, or <a href="report.cfm">view all users</a>

## Create User Table
```markdown
CREATE DATABASE alpine;

USE alpine;

CREATE TABLE users (
    userID int,
    lastName varchar(255),
    firstName varchar(255),
    emailAddress varchar(255)
);
```

## user.cfc
```markdown
<cfcomponent displayname="User Component" output="false">

  <cffunction name="create" access="private" returntype="boolean">
    <cfargument name="firstName" type="string" required="true" />
    <cfargument name="lastName" type="string" required="true" />
    <cfargument name="emailAddress" type="string" required="true" />
      
    <cfquery name="insertUser" datasource="alpine">
    INSERT INTO user (firstName, lastName, emailAddress)
    VALUES (<cfqueryparam value="#arguments.firstName#" cfsqltype="CF_SQL_VARCHAR" />,
      <cfqueryparam value="#arguments.lastName#" cfsqltype="CF_SQL_VARCHAR" />,
      <cfqueryparam value="#arguments.lastName#" cfsqltype="CF_SQL_VARCHAR" />)
    </cfquery>
  </cffunction>
    
  <cffunction name="read" access="private" returntype="boolean">
    <cfargument name="userID" type="numeric" required="false" default="0" />
    
    <cfquery name="getUser" datasource="alpine">
    SELECT  firstName, lastName, emailAddress
    FROM    user
    <cfif arguments.userID gt 0>
        WHERE   userID = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer" />
    </cfif>
    </cfquery>
  </cffunction>

  
</cfcomponent>
```

### Register for an Account
This is the basic code for the User Registration form.

```markdown
<cfscript>
include 'header.cfm';
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
