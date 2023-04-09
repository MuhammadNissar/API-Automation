Feature: To create one common feature file for reuse

  Scenario: To create job entry
    Given url _url
    Given path _path
    And request {  "jobId": '#(_jobId)',"jobTitle": "Software Engg--9","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle","API Testing"]}]  }
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle
