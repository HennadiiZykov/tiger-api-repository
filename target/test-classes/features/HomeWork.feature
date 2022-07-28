# 2) Test API endpoint "/api/account/add-account-car" to add car to existing account
# Then status code shoud be 201 - Create,  validate response

# 3) Test API endpoint "/api/account/add-account-phone" to add phone number to existing account
# Then status code should be 201 - Create , validate response

#	4) Test API endpoint "/api/account/add-account-address" to add address to existing account
# Then status code shoud be 201 - Create, validate response
#
#id 86

Feature: Add Car, Phone, Address to Primary peson

Background: Generate Token for all scenario
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
* def genToken = response.token

Scenario: Create new Account happy path
Given path "/api/accounts/add-primary-account"
And request {"email": "3Hennadii.Zykov@gmail.com","firstName": "Hennadii","lastName": "Zykov","title": "Mr.","gender": "MALE","maritalStatus": "SINGLE","employmentStatus": "QA tester","dateOfBirth": "1983-02-27"}
And header Authorization = "Bearer " + gentoken
When method post
Then status 201
And print response

Scenario: Add account car 
Given path "/api/accounts/add-account-car"
And param primaryPersonId
And request {"make": "Toyota","model": "Rav4","year": "2006","licensePlate": "1234"}
And header Authorization = "Bearer " + genToken
When method post
Then status 201
And print response

Scenario: Add account phone
Given path "/api/accounts/add-account-phone"
And param primaryPersonId
And request {"phoneNumber": "3476316262","phoneExtension": "","phoneTime": "Morning","phoneType": "CellPhone"}
And header Authorization = "Bearer " + genToken
When method post
Then status 201
And print response

Scenario: Add Address 
Given path "/api/accounts/add-account-address" 
And param primaryPersonId
And request {"addressType": "3060","addressLine1": "Ocean Avenue","city": "Brooklyn","state": "NY","postalCode": "11235","countryCode": "Cell Phone","current": true}
And header Authorization = "Bearer " + genToken
When method post
Then status 201
And print response








