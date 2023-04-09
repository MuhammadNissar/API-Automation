Feature: To use the basic Auth in karete framework

Background:
Given url "http://localhost:9191"


Scenario: To use basic auth
Given path "/secure/webapi/all"
And headers {Accept :'application/json', Authorization : "Basic YWRtaW46d2VsY29tZQ=="}
When method get
Then status 200
And match response == '#notnull'

Scenario: To use with out basic auth
Given path "/secure/webapi/all"
And headers {Accept :'application/json'}
When method get
Then status 401

Scenario: To use basic auth
Given path "/secure/webapi/all"
And headers {Accept :'application/json', Authorization : "Basic YWRtaLP46d2VsY29tZQ=="}
When method get
Then status 401

Scenario: To use js file with  auth
Given path "/secure/webapi/all"
* def auth = call read('/../../crdFun.js'){username:'admin',password:'welcome'}
And print auth
And headers {Accept :'application/json', Authorization :'#(auth)'}
When method get
And print auth
Then status 200
And match response == '#notnull'

