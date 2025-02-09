@signUp
Feature: Sign in with new user

Background: precondition
    Given url apiUrl

Scenario: Create new user
    * def emailId = karate.eval('"user_" + Math.random().toString(36).substring(2, 10) + "@gmail.com"')
    * def userName = karate.eval('"" + Math.random().toString(36).substring(2, 10)')
    Given path 'users'
    #And request {"user": { "email": #(emailId),"password": "test@123", "username": #(userName)}}
    And request 
    """
        {
            "user": {
                "email": #(emailId),
                "password": "test@123",
                "username": #(userName)
            }
        }
    """ 
    When method Post
    Then status 201