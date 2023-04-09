Feature: To use delete request on application

Background:
Given url "http://localhost:9191"

  Scenario: To use delete request
    * def getJobId = function(){return Math.floor((100) * Math.random());}
    * def jobId = getJobId()
    * def postRequest = call read('../jobEntry2.feature'){_url : "http://localhost:9191", _path :"/normal/webapi/add", _jobId :'#(jobId)'}
    And path "/normal/webapi/remove/"+ jobId
    And header Accept = 'application/json'
    When method delete
    Then status 200
    Given url "http://localhost:9191"
    And path "/normal/webapi/find"
    And params {id : '#(jobId)',jobTitle :'Software Engg--9'}
    And header Accept = 'application/json'
    When method get
    Then status 404

  Scenario: To use response of one to another
  
  #postrequest
    * def getJobId = function(){return Math.floor((100) * Math.random());}
    * def createJobId = getJobId()
    * def postRequest = call read('../jobEntry2.feature'){_url : "http://localhost:9191", _path :"/normal/webapi/add", _jobId :'#(createJobId)'}
    * def jobId = postRequest.jobId
    * def jobTitle = postRequest.jobTitle
    
    #pathrequest
    Given path "/normal/webapi/update/details"
    * def jobDefs = 'To develop andriod application and web application'
    And params {id : '#(jobId)',jobTitle :'Software Engg--9',jobDescription: '#(jobDefs)'}
    And header Accept = 'application/json'
    And request {}
    When method patch
    Then status 200
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle
    
    #get request
    And path "/normal/webapi/find"
    And params {id : '#(jobId)',jobTitle :'#(jobTitle)'}
    And header Accept = 'application/json'
    When method get
    Then status 200
    And response.jobDescription == jobDefs
