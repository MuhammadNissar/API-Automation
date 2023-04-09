Feature: To update job entry in application
 Use PUT request for update 
 
 Background: Initializing base url
   Given url "http://localhost:9191"
   
   Scenario: To create job entry in json format
    Given path "/normal/webapi/add"
    * def getJobId = function(){return Math.floor((100) * Math.random());}
    * def jobId = getJobId()
    And request {  "jobId": '#(jobId)',"jobTitle": "Software Engg","jobDescription": "To develop andriod application","experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle","API Testing"]}]  }
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method post
    And status 201
    Given path "/normal/webapi/update"
    When request 
    """
     {
        "jobId": '#(jobId)',
        "jobTitle": "Software Engg --2",
        "jobDescription": "To develop andriod application and web application",
        "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
        ],
        "project": [
            {
                "projectName": "Movie App",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Gradle",
                    "API Testing"
                ]
            },
            {
                "projectName": "Movie App -2",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Gradle",
                    "API Testing"
                ]
            }
        ]
    }
    """
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    When method put
    And status 200
    * def projectArray = karate.jsonPath(response,'$.[?(@.jobId == ' + jobId + ')].project')
    And print projectArray
    Then match projectArray[0] == '#[2]'
   