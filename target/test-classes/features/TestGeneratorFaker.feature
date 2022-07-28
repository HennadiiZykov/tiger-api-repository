Feature: Create account with Data generator

Background: Prepeare for test. generator token
Given url "https://tek-insurance-api.azurewebsites.net"
* def result = callonce read('GenerateToken.feature')
And print result
* def genToken = result.response.token
And print genToken
And header Authorization = "Bearer " + genToken

Scenario: Create new Account used Data Generator 
* def gen = Java.type ('tiger.api.test.data.TestGenerator')
* def email = gen.getEmail()
* def firstName = gen.getFirstName()
* def lastName = gen.getLastName()
* def dob = gen.getDob()
And print email
And print firstName
And print lastName
Given path "/api/accounts/add-primary-account"
And request 
"""
{
"email": "#(email)",
"firstName": "#(firstName)",
"lastName": "#(lastName)",
"title": "Mr.",
"gender": "MALE",
"maritalStatus": "SINGLE",
"employmentStatus": "QA tester1",
"dateOfBirth": "#(dob)"

}
"""

When method post
When status 201
And print response
* def genId = response.id
And print genId
And print response
Then assert response.email == email








