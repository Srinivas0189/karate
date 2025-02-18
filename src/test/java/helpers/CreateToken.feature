Feature: Generate token

Scenario: token generation
    Given url apiUrl
    Given path 'users/login'
    And request {"user": {"email": "#(userName)","password": "#(userPassword)"}}
    When method Post
    Then status 200
    * def authToken = response.user.token
    Feature: Generate token