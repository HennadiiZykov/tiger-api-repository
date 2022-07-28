Feature: Create an account and add address to the account

# Step 1)  Get a token
# Step 2)  Generate an Account
# Step 3)  Add address to Account

Background: Create new Account
Given url "https://tek-insurance-api.azurewebsites.net"
* def result = callonce read('CreateAccountFeature.feature')
And print result
* def primaryPersonId = result.response.id
* def genToken = result.result.response.token
 And print primaryPersonId
 
 
 Scenario: Add address to an account
 Given path '/api/accounts/add-account-address'
 And param primaryPersonId = primaryPersonId
 Given header Authorization = "Bearer " + genToken
 
 Given request
 """
 {
  "addressType": "Home",
  "addressLine1": "235 W end ",
  "city": "New Jerse",
  "state": "NJ",
  "postalCode": "11235",
    "current": true
}
 """
 When method post
 When status 201
 And print response