@debug
Feature: Test home page

Background: Define URL
    Given url apiUrl

    @test1
Scenario: Create a new article
    Given path 'articles/'
    And request { "article": {"title": "test44260","description": "article title1","body": "test article","tagList": []}}
    And method Post
    Then status 201
    And match response.article.title == 'test44260'

@test2
Scenario: Create and Delete article
    Given path 'articles'
    And request { "article": {"tagList": [],"title": "Delete Article","description": "Test","body": "test article"}}
    And method Post
    Then status 201
    * def articleId = response.article.slug

    Given params { limit:10, offset: 0}
    Given path 'articles' 
    When method Get
    Then status 200
    #And match response.articals[0].title == 'Delete Article'

    Given path 'articles/',articleId
    When method Delete
    Then status 204

    Given path 'articles' 
    When method get
    Then status 200
    And match response.articals[0].title != 'Delete Article'