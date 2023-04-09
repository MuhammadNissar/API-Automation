@smoke
Feature: To create job entry in application with embaded expression
 
#sysntax for embaded is #(function()) 
#syntax for javaScriptExecuter * def functionName = function() {}
 Background: Initializing base url
   Given url "http://localhost:9191"
   
   
   @smoke
   Scenario: To create job entry in json format
    Given path "/normal/webapi/add"
    * def getJobId = function(){return 20}
    And request {  "jobId": '#(getJobId())',"jobTitle": "Software Engg","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle","API Testing"]}]  }
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    Then match response.jobId == getJobId()
    #And match response.jobTitle == "Software Engg"
   