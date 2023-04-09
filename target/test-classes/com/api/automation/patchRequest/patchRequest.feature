Feature: To use path request in karate framework using params

  Scenario: To use patch request
    * def getJobId = function(){return Math.floor((100) * Math.random());}
    * def jobId = getJobId()
    * def postRequest = call read('../jobEntry2.feature'){_url : "http://localhost:9191", _path :"/normal/webapi/add", _jobId :'#(jobId)'}
    Given url "http://localhost:9191"
    And path "/normal/webapi/update/details"
    * def jabDefs = "To develop andriod application and web application"
    When params {id: '#(jobId)',jobTitle : 'Software Engg--9',jobDescription :'#(jabDefs)'}
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    And request {}
    Then method patch
    And status 200
    And match response.jobDescription == jabDefs