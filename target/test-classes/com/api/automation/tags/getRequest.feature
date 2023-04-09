@regrassion
Feature: To test get end point of the application
  To test different get end point with different data formate supported by the application

  Background: set up base path
    Given url "http://localhost:9191"

  Scenario: To get all data from application in JSON format
    Given path "/normal/webapi/all"
    When method get
    Then status 200

  Scenario: To get all data from application using path variable
    Given path "/normal/webapi/all"
    When method get
    Then status 200

  Scenario: To get all data from application in JSON format
    Given path "/normal/webapi/all"
    And header Accept = 'application/json'
    When method get
    Then status 200

  Scenario: To get all data from application in xml format
    Given path "/normal/webapi/all"
    And header Accept = 'application/xml'
    When method get
    Then status 200
