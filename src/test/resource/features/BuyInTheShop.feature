Feature: Automated the your logo page

  @test1
  Scenario: choose a dress and it is displayed in the shopping cart successfully
    Given that I opened the browser at automationpractice page
    When  I look for 'dress' and select any displayed result to go to the shopping cart
    Then  should the shopping cart show the product is not 'null'

  @test2
  Scenario: choose a blouse and it is displayed in the shopping cart successfully
    Given that I opened the browser at automationpractice page
    When  I look for 'Blouse' and select any displayed result to go to the shopping cart
    Then  should the shopping cart show the product is not 'null'
