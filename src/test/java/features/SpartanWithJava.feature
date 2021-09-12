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
  @wip
    Scenario: reading java methods
      #point the class that we want to ran
    #Java.type used to connect to java class
    * def SpartanDataGenerator = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SpartanDataGenerator.createSpartan()
    # run teh static method in hat class and capture teh results
    # the return map object is representes as a json
    * print newSpartan



