Feature: To create job entry in application
 Use POST/Webapi/normal/add to create job entry in application
 
 Background: Initializing base url
   Given url "http://localhost:9191"
   
   Scenario: To create job entry in json format
    Given path "/normal/webapi/add"
    And request {  "jobId": 9,"jobTitle": "Software Engg","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle","API Testing"]}]  }
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    Then match response.jobId == 9
    And match response.jobTitle == "Software Engg"
   


   Scenario: To create job entry in json format using json file
    Given path "/normal/webapi/add"
    * def body = read("data/requestData.json")
    And request body
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    Then match response.jobId == 1
   
   Scenario: To create job entry in json format using xml file
    Given path "/normal/webapi/add"
    * def body = read("data/requestData.xml")
    And request body
    And headers {Accept : 'application/json', Content-Type : 'application/xml'}
    When method post
    And status 201
    Then match response.jobId == 9
 