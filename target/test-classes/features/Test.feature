Feature:  Security Test. verify Tiken test.

Scenario: Test token verify with valid username and invalid token 

Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
When status 200
* def gentoken = response.token 
Given path "/api/token/verify"
And param username = "InvalidUserName" 
And param token = gentoken
When method get
When status 400
* def ErrorMessage = response.errorMessage
And assert ErrorMessage == "Wrong Username send along with Token"
Then print response 