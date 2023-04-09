Feature: To test get end point of the application
  To validate json file

  Background: set up base path
    Given url "http://localhost:9191"
  @regrassion
  Scenario: To get all data from application in JSON format with validation
    Given path "/normal/webapi/all"
    And header Accept = 'application/json'
    When method get
    Then status 200
    * def projectSchema = { "projectName": '#string', 'technology': '#[] #string' }
    * def mainSchema = { "jobId": '#number',"jobTitle": '#string',"jobDescription": '#string',"experience": '#[] #string',"project": '#[] ##(projectSchema)'}
    And print response
    And print "running complex schema"
    Then match response ==
    """
    '#[] ##(mainSchema)'
    """