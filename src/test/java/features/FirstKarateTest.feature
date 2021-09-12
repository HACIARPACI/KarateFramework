Feature: welcome to karate

  Scenario: how to print
    Given  print "Hello World"
    When print 'another print'
    Then print "then print"

  Scenario: more printing
      Given  print " some words to print"
      * print 'My name is','karate kid'
      # ,--> concat  2 strings +1 white space
      * print 2+2

  Scenario: variables
    * def name = 'Mike' 
    * print 'my name is' + name
    * def age = 20
    * print name, 'is',age,'years old'

  Scenario: difficult parameters : json objects
    * def student = {'name':'sam','owes_tuition':false}
    * print student
    * print student.name
    * print student.owes_tuition


  Scenario: json object 2
     * def student =
     """
     {
     "firstName": "Steven",
     "lastName":"King",
     "salary":2099
     }
     """
     * print student.salary
     * print student.lastName
     * print student.firstName


    Scenario: Spartan Variable
      * def spartan =
      """
      {
    "id": 10,
    "name": "Lorenza",
    "gender": "Female",
    "phone": 3312820936
}
      """
  * print spartan.gender
  * print spartan.gender
  * print spartan.phone
  * print spartan.id


    Scenario: json array objects
  * def students =
      """
      [
      {'name':'sam',
      'owes_tuition':false},
      {
      'name':'mike',
      'owes_tuition':true
      }
      ]

      """

     * print students
    * print students[0].name
    * print students[1].owes_tuition