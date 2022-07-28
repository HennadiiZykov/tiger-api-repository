@Smoke
Feature: Security test. Token Generation test

@Smoke @Security
Scenario: Generate token with valid username and password

Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response

#2) Test API Endpoint "/api/token" with Invalid UserName and valid password.
# Status code should be 404 not found. and print the reponse.

@Negative
Scenario: Generate token with invalid username and password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "invalid_username","password": "tek_supervisor"}
When method post
Then status 404
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "USER_NOT_FOUND"

@Negative
Scenario: Generate token with valid username and invalid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "api/token"
And request {"username": "supervisor","password": "invalid_Password"}
When method post
Then status 400
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "Password Not Matched"















