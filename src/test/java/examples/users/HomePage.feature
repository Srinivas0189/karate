@homePage
Feature: Test home page

Background: Define URL
    Given url apiUrl

Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['Zoom', 'Git']
    And match response.tags contains 'Enroll'
    And match response.tags !contains ['bike', 'Car']
    And match response.tags contains any ['GitHub', 'YouTube','SRINIVAS']
    And match response.tags !contains any ['GitHub', 'YouTube','SRINIVAS']
    #And match response.tags contains only ['Zoom', 'Git']
    And match each response.tags =='#string'

Scenario: get all articals
    #defining variables and calling other function
    * def timeValidator = read('classpath:helpers/timeValidator.js')
    Given params { limit: 10, offset: 0}
    Given path 'articles' 
    When method Get
    Then status 200
    And match response.articles == '#[10]'
    And match response.articlesCount == 17
    And match response.articlesCount != 500
    #check the response is array or not
    And match response == {"articles": "#array", "articlesCount": 17}
    And match response.articles[0].createdAt contains '2025'
    #loop assertion 
    # And match response.articals[*].author.bio contains null
    # And match response.articals[*].favoritesCount contains 38
    #for loop assertion when json is too long
    And match response..bio contains null
    And match response..favoritesCount contains 179
    #Assertion in each object
    And match each response..following == false 
    #Verify boolean expressions
    And match each response..following == '#boolean'
    #Verify key value is string or number
    And match each response..favoritesCount == '#number'
    And match each response..favoritesCount != '#string'
    #Verify each key has some value either it's string or null or number 
    #use ## to verify any any value
    And match each response..bio == '#null'
    And match each response.articals ==
    """
        {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": "#array"
            "createdAt": "#? timeValidator(_)",
            "updatedAt": "#? timeValidator(_)",
            "favorited": '#boolean',
            "favoritesCount": '#number',
            "author": {
                "username": "#string",
                "bio": '##string',
                "image": "#string",
            },
             "following": '#boolean',
             "favoritesCount": '#number'
        }
    """