Feature: Token Generator

Scenario: Generete valid token with supervisor
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
When status 200
Then print response
* def genToken = response.token


