Feature: validaion using file/reading external file

  Background: 
    Given url "http://localhost:9191"

  Scenario: validating json file using variable
    Given path "/normal/webapi/all"
    And header accept = 'application/json'
    When method get
    * def actualResponse = read("../response.json")
    Then match response == actualResponse
