Feature: To create one common feature file for reuse

  Scenario: To create job entry
    Given url "http://localhost:9191"
    Given path "/normal/webapi/add"
    * def getJobId = function(){return Math.floor((100) * Math.random());}
    * def jobId = getJobId()
    And request {  "jobId": '#(jobId)',"jobTitle": "Software Engg","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle","API Testing"]}]  }
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
