Feature: To create JWT token 


Scenario: To create JWT token for get information from application
Given url "http://localhost:9191"
And path "/users/sign-up"
When headers {Accept : 'application/json', Content-Type : 'application/json'}
And request {username: '#(username)',password:'#(password)'}
And method post
Then status 200
# get token
Given url 'http://localhost:9191/users/authenticate'
When headers {Accept : 'application/json', Content-Type : 'application/json'}
And request {username: '#(username)',password:'#(password)'}
And method post
Then status 200
* def authToken = response.token

