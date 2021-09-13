Feature: Data driven tests

  Scenario Outline: get tken for different users<email>
    Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = "<email>"
    And param password = "<password>"
    When method GET
    Then status 200
    And print response.accessToken
    And def token = response.accessToken

      Examples:
    |email|password|
    | sbirdbj@fc2.com            | asenorval   |
    | htwinbrowb4@blogspot.com   | kanyabang   |
    | dfrederick5@yellowbook.com | engraciahuc |


  Scenario Outline: get tken for different users<email>
    Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = "<email>"
    And param password = "<password>"
    When method GET
    Then status 200
    And print response.accessToken
    And def token = response.accessToken

    Examples:
    |read('data/users.csv')|


  Scenario: get user information verification(Database vs API)
    * def DBUtils = Java.type('utilities.DBUtils')
    * def query = "select id,firstname,lastname,role from users where email = 'sbirdbj@fc2.com'"
    * def dbResult = DBUtils.getRowMap(query)
    * print 'DAATABASE RESULT',dbResult
    Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'sbirdbj@fc2.com'
    And param password = 'asenorval'
    When method GET
    Then status 200
    And print response.accessToken
    And def token = response.accessToken

    Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/'
    And path 'api/users/me'
    And header Authorization = 'Bearer '+ token
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    # tek tek fistname lastname role match yapılabilir
    And match response.id == dbResult.id
    And response.firstname == dbResult.firstname
    And response.lastname == dbResult.lastname
    And response.role == dbResult.role

  @wip
  Scenario Outline: get user information verification(Database vs API) <email>
    * def DBUtils = Java.type('utilities.DBUtils')
    * def query = "select id,firstname,lastname,role from users where email = '<email>'"
    * def dbResult = DBUtils.getRowMap(query)
    * print 'DAATABASE RESULT',dbResult
    Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    Then status 200
    And print response.accessToken
    And def token = response.accessToken

    Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/'
    And path 'api/users/me'
    And header Authorization = 'Bearer '+ token
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    # tek tek fistname lastname role match yapılabilir
    And match response.id == dbResult.id
    And response.firstname == dbResult.firstname
    And response.lastname == dbResult.lastname
    And response.role == dbResult.role

    Examples:
      |read('data/users.csv')|








