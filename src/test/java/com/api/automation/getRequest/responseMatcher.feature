Feature: To test get end point of the application
  To validate get end point response

  Background: set up base path
    Given url "http://localhost:9191"

  Scenario: To get all data from application in JSON format
    Given path "/normal/webapi/all"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response

  Scenario: To get all data from application in xml format
    Given path "/normal/webapi/all"
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response

  Scenario: To get all data from application in JSON format
    Given path "/normal/webapi/all"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response ==
      """
      [
      {
      "jobId": 1,
      "jobTitle": "Software Engg",
      "jobDescription": "To develop andriod application",
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
            "Gradle"
          ]
        }
      ]
      }
      ]
      """

  Scenario: To get all data from application in xml format
    Given path "/normal/webapi/all"
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response ==
      """
      <List>
      <item>
      <jobId>1</jobId>
      <jobTitle>Software Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
        <experience>Google</experience>
        <experience>Apple</experience>
        <experience>Mobile Iron</experience>
      </experience>
      <project>
        <project>
          <projectName>Movie App</projectName>
          <technology>
            <technology>Kotlin</technology>
            <technology>SQL Lite</technology>
            <technology>Gradle</technology>
          </technology>
        </project>
      </project>
      </item>
      </List>

      """

  Scenario: To get all data from application in JSON format
    Given path "/normal/webapi/all"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response ==
      """
      [
      {
      "jobId": 1,
      "jobTitle": "Software Engg",
      "jobDescription": "To develop andriod application",
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
            "Gradle"
          ]
        }
      ]
      }
      ]
      """

  Scenario: To get all data from application in JSON format with validation
    Given path "/normal/webapi/all"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response contains deep {"jobDescription": "To develop andriod application"}
    
    Scenario: To get all data from application in JSON format with validation
    Given path "/normal/webapi/all"
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response contains deep {"project": [{"projectName": "Movie App"}]}
    And match header Content-Type == "application/json"
