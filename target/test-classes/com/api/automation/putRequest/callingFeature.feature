Feature: To call feature file

  Background: Initializing base url
    Given url "http://localhost:9191"

  Scenario: Reuse feature file without accessing variable
    * def postRequest = call read("../jobEntry.feature")
    And print postRequest.jobId
    Given path "/normal/webapi/update"
    When request
      """
       {
          "jobId": '#(postRequest.jobId)',
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
    * def projectArray = karate.jsonPath(response,'$.[?(@.jobId == '+ postRequest.jobId +')].project')
    And print projectArray
    Then match projectArray[0] == '#[2]'

 
 
 Scenario: Reuse feature file passing variable
   * def getJobId = function(){return Math.floor((100) * Math.random());}
    * def jobId = getJobId()
    * def postRequest = call read("../jobEntry2.feature"){_url :"http://localhost:9191",_path : "/normal/webapi/add",_jobId : '#(jobId)'}
    And print postRequest.jobId
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
    * def projectArray = karate.jsonPath(response,'$.[?(@.jobId == '+ jobId +')].project')
    And print projectArray
    Then match projectArray[0] == '#[2]'

 