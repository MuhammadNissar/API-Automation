 Feature: to upload file using karate frame work

 
 Background: Initializing base url
   Given url "http://localhost:9191"
   
   Scenario: To  Upload file
    Given path "/normal/webapi/upload"
    # syntax for file upload multipart file file = {file loaction,filename,content type}
    And multipart file file = {read: "fileToUpload.txt",filename: 'fileToUpload.txt',Content-Type: 'multipart/form-data'}
    When method post
    And status 200
    Then print response
    
    Scenario: To  Upload file
    Given path "/normal/webapi/upload"
    * def fileLocation = '../data/requestData.json'
    # syntax for file upload multipart file file = {file loaction,filename,content type}
    And multipart file file = { read: '#(fileLocation)',filename: 'requestData.json',Content-Type: 'multipart/form-data'}
    When method post
    And status 200
    Then print response