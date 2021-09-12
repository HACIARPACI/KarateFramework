Feature: exchange rate api tests
  Scenario: basic test with status code validatiom
    Given url 'https://api.exchangeratesapi.io/latest'
    When method GET
    Then status 200
  
Scenario: get rates for specific day
  Given url 'https://api.exchangeratesapi.io/latest'
  Given method get
  Then status 201


  Scenario: get rates for specific day
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    Given method get
    Then status 201


  Scenario: header verification
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    Given method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match header Vary == 'Accept-Encoding'
    And match header Connection == 'keep-alive'
    And match header Date == '#preset'
    # this equals to headers().hasHeaderWithName


  Scenario: json body verification
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    Given method get
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And print response.base
    # verify base is EUR
    And match response.base == 'EUR'
    And print response.rates
    And print response.rates.USD
    And match response.rates.USD == '#present'