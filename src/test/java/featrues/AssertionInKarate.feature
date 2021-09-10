Feature: using match keyword

  Scenario:  some matching example
    * def name = 'Severus Snape'
    * match name == 'Severus Snape'
    # similar to Assert.assertequals(name,"Severus Snape")

    * match name != 'Tom Riddle'
  @wip
    Scenario: more matching example
      * def employee =
      """
      {
      "first_name":"TJ",
      "salary":24001,
      "active":true
      }
      """
      * def emp_name = employee.first_name
      * match emp_name == 'TJ'
      * match employee.salary == 24001


