Feature: To use json path expression


Background: set up base path
    Given url "http://localhost:9191"

  Scenario: To get all data from application in JSON format
    Given path "/normal/webapi/all"
    When method get
    Then status 200
    * def JobId = 1
    * def JobTitle = karate.jsonPath(response,"$.[?(@.jobId == "+ JobId + ")].jobTitle")
    * def jobDescription = karate.jsonPath(response,"$.[?(@.jobId == " + JobId + ")].jobDescription")
    * def experience = karate.jsonPath(response,"$.[?(@.jobId == " + JobId + ")].experience")
    Then print "JobTitle  ==>  " + JobTitle
    And print "jobDescription  ==>  " + jobDescription
    And print "experience  ==>  " + experience
    