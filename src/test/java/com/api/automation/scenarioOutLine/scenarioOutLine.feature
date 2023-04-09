Feature: To use scenari Outline



  Scenario Outline: to Use scenario outline <method>
    Given print '<BaseUrl>'
    When print '<path>'
    Then print  '<status>'
    And print   '<method>'

    Examples: 
      | BaseUrl               | path               | status | method |
      | http://localhost:9191 | /normal/webapi/all |    200 | get    |
      | http://localhost:9191 | /normal/webapi/all |    201 | post   |
      | http://localhost:9191 | /normal/webapi/all |    201 | put    |

  Scenario Outline: to Use scenario outline <jobId>
   Given url "http://localhost:9191"
   And  path "/normal/webapi/add"
   And request {  "jobId": '#(jobId)',"jobTitle": '#(jobTitle)',"jobDescription": '#(jobDescription)',"experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle","API Testing"]}]  }
   And headers {Accept : 'application/json', Content-Type : 'application/json'}
   When method post
   And status <status>

    Examples: 
      | jobId | jobTitle      | jobDescription                | status |
      | 939   | Software Engg  |To develop andriod application| 201    |
      | Id    | Software Engg |To develop andriod application | 400    |
      | false | Software Engg |To develop andriod application | 400    |

      
     Scenario Outline: to Use scenario outline 
   Given url "http://localhost:9191"
   And  path "/normal/webapi/add"
   And request {  "jobId": '#(jobId)',"jobTitle": '#(jobTitle)',"jobDescription": '#(jobDescription)',"experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName": "Movie App","technology": ["Kotlin","SQL Lite","Gradle","API Testing"]}]  }
   And headers {Accept : 'application/json', Content-Type : 'application/json'}
   When method post
   And print response
    Examples: 
      #|testData|
      |read("testData.csv") |