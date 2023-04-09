Feature: To use JWT to from other feature

Scenario: To use the JWT token
* def token = call read('../jwtHelper.feature'){username : 'Jhon Wick', password :'Guns and Bikes'}
Given url 'http://localhost:9191/auth/webapi/all'
When headers {Accept : 'application/json', Content-Type : 'application/json',Authorization :'#("Bearer "+token.authToken )'}
And method get
Then status 200

Scenario: To use the without JWT token
Given url 'http://localhost:9191/auth/webapi/all'
When headers {Accept : 'application/json', Content-Type : 'application/json'}
And method get
Then status 401