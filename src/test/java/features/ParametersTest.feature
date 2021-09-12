Feature: Parameters examples

  Background:
    * def baseUrl = 'https://api.exchangeratesapi.io'
    * def spartanUrl = 'http://54.237.100.89:8000'
    * def hrUrl = 'http://54.237.118.39:1000/ords/hr'
  Scenario: path parameters
    Given url baseUrl
    And path "latest"
    When method GET
    Then status 200

Scenario: path parameters
    Given url baseUrl
    And path "2010-01-12"
    When method GET
    Then status 200

  Scenario: get all spartans with path
    Given url spartanUrl
    And path "api/spartans"
    When method get
    Then status 200
    And  print response

    Scenario: get ones spartans only
      * def expectedSpartan =
    """
    {
    "gender": "Male",
    "phone": 1231231234,
    "name": "Dan2",
    "id": 195
  }
    """
      Given url spartanUrl
      And path "api/spartans"
      And path "195"
      When  method get
      Then status 200
      And  print response
      And match response == expectedSpartan

  Scenario: query parameters
    Given  url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And  print response
    And match response.pageable.pageNumber == 0
    #verify each content has gender = Female
    And match each response.content contains {"gender":"Female"}
    #second way of iteration
    And match each response.content[*].gender == 'Female'
    And match response.content[0].name == 'Janette'
    # verify each content phone is number
    And match each response.content[*].phone == '#number'


  Scenario: hr region sample
    Given url hrUrl
    And path 'regions'
    When method GET
    Then  status 200
   # And print response
    And match response.limit == 25
    And match response.items[*].region_id == '#string'

