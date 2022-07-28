Feature: Create Account

Background: generate token for all scenario

Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
* def gentoken = response.token


Scenario: Create new Account happy path
Given path "/api/accounts/add-primary-account"
And request {"email": "3Hennadii.Zykov@gmail.com","firstName": "Hennadii","lastName": "Zykov","title": "Mr.","gender": "MALE","maritalStatus": "SINGLE","employmentStatus": "QA tester","dateOfBirth": "1983-02-27"}
And header Authorization = "Bearer " + gentoken
When method post
Then status 201
And print response




# 2) Test API endpoint "/api/account/add-account-car" to add car to existing account
# Then status code shoud be 201 - Create,  validate response 

# 3) Test API endpoint "/api/account/add-account-phone" to add phone number to existing account
# Then status code should be 201 - Create , validate response

#	4) Test API endpoint "/api/account/add-account-address" to add address to existing account
# Then status code shoud be 201 - Create, validate response
#
#
