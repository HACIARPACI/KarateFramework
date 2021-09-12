Feature: Karete Java Integration
  Background:
    * def baseUrl = 'https://api.exchangeratesapi.io'
    * def spartanUrl = 'http://54.237.100.89:8000'
    * def hrUrl = 'http://54.237.118.39:1000/ords/hr'
  Scenario:  get a spartan with rewquest header
    Given url spartanUrl
    And  path "api/spartans"
    And  header Accept = 'application/json'
    When method GET
    Then status 200


  Scenario: create a new spartan
    Given url spartanUrl
    And path "/api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
    {
    "gender":"Female",
    "name":"Lorenzaa",
    "phone":2332233232

    }
    """
    When method POST
    Then status 201
    And print response

    Scenario: reading java methods
      #point the class that we want to ran
    #Java.type used to connect to java class
      * def SDG = Java.type('utilities.SpartanDataGenerator')
      * def newSpartan = SDG.createSpartan()
    # run teh static method in hat class and capture teh results
    # the return map object is representes as a json
      * print newSpartan



  Scenario: create spartan with Random Data (Java)
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    Given url spartanUrl
    And path "/api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method POST
    Then status 201
    And print response
    And match response.success == 'A Spartan is Born!'
    # verify names
    And match response.data.name == newSpartan.name

  Scenario: create spartan with Random Data (Java) and delete
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    Given url spartanUrl
    And path "/api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method POST
    Then status 201
    And print response
    And match response.success == 'A Spartan is Born!'
    # verify names
    And match response.data.name == newSpartan.name
    And def idToDelete = response.data.id
    Given url spartanUrl
    And path 'api/spartans'
    And path idToDelete
    When method DELETE
    Then status 204


