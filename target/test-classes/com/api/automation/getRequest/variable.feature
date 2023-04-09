Feature: Variable creation in karate framework

  # format for creating variable
  # <Gharkin keyword> <def> <variaable name> = <value>
  # * <def> <variable name> = <value>
  #Use cases for variables
  # Use variables for repeating values
  # Storing data from external file
  # Passing data from one feature file to another future file
  Background: 
    * def page_load_var = 999

  Scenario: Creating variable
    Given def var_int = 9
    And def var_string = "Mohammad"
    Then print "The var int value is : ", var_int
    And print "The var string value is :", var_string
    * def var_int1 = 99
    And print "Addition of two int :", var_int+var_int1
    And print "Background var is :", page_load_var

  Scenario: Creating variable
    Given def var_int = 89
    Then print "Scenod scenario var is :", var_int
    And print "Background var is :", page_load_var
