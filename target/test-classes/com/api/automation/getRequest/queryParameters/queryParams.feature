Feature: To use query parameters using karate frameWork

  Scenario: To use query parameter
    * def getJobId = function(){return Math.floor((100) * Math.random());}
    * def jobId = getJobId()
    * def postRequest = call read('../../jobEntry2.feature'){_url : "http://localhost:9191", _path :"/normal/webapi/add", _jobId :'#(jobId)'}
    Given url "http://localhost:9191"
    And path "/normal/webapi/find"
    When params {id: '#(jobId)',jobTitle : 'Software Engg--9'}
    And headers {Accept : 'application/json', Content-Type : 'application/json'}
    Then method get
    And status 200
    And match response.jobId == jobId
