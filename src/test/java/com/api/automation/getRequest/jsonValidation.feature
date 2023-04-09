Feature: To test get end point of the application
  To validate json file

  Background: set up base path
    Given url "http://localhost:9191"

  Scenario: To get all data from application in JSON format with validation
    Given path "/normal/webapi/all"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == "Apple"
    And match response.[0].project[0].technology[1] == "SQL Lite"
    #we can validate size of array
    And match response.[0].experience == "#[3]"
    And match response.[0].project[0].technology == "#[3]"
    #To avoid index mismatching we can use wild card char with contains key word
    And match response.[*].experience[*] contains ['Apple']
    And match response.[*].project[*].technology[*] contains ['SQL Lite']

  Scenario: To get all data from application in JSON format with validation and fuzzy validation
    Given path "/normal/webapi/all"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response.[0].jobId == "#number"
    And match response.[0].experience[1] == "#string"
    And match response.[0].project[0].technology == "#array"
    #we can validate size of array
    And match response.[0].experience == "#notnull"
    And match response.[0].project[0].technology == "#present"
    #complex fuzzy validation
    And match response.[0].jobId == '#? _ == 1'
    And match response.[0].jobTitle == '#string? _.length() >= 1'
    And match response.[0].experience == '#[] #string? _.length()>=2'
    
