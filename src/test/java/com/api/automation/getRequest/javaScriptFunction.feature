Feature: To execute javaScript function


Scenario: To execute javaScript function with and with out parameters
#without parameters
* def getInt = function() {return 10}
Then print getInt()
* def getnote = function() {return 10 * 10}
Then print getnote()
#with parameters
* def getFunction = function(a) {return "hello " + a}
Then print getFunction("world")

