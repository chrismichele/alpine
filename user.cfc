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