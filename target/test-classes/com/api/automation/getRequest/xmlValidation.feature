Feature: To test get end point of the application
  To validate xml file

  Background: set up base path
    Given url "http://localhost:9191"

  Scenario: To get all data from application in JSON format with validation
    Given path "/normal/webapi/all"
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And  print response
    And match response/List/item/jobId =='1'
    #we can skip response key word also
    And match /List/item/jobId == '1'
    And match /List/item/jobTitle == 'Software Engg'
    And match /List/item/experience/experience[2] == 'Apple'
    #we can use traverse also in XLM validation similer to Json [indexing changes to json]
    And match response.List.item.experience.experience[0] == 'Google'
    
  Scenario: To get all data from application in JSON format with validation and fuzzy validation
    Given path "/normal/webapi/all"
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And  print response
    And match response/List/item/jobId =='#string'
    #we can skip response key word also
    And match /List/item/jobId == '#string'
    And match /List/item/jobTitle == '#string'
    And match /List/item/experience/experience[2] == '#notnull'
    #we can use traverse also in XLM validation similer to Json [indexing changes to json]
    And match response.List.item.experience.experience[0] == '#present'
    #complex validation with fuzzy 
    And match /List/item/jobTitle == '#string? _.length()>0'
  
    
    
    
  
    