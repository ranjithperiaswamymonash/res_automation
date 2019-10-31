@res_automation @activity @create_Workshop_activity
Feature: Create a moodle Workshop activity
  In order to create a Workshop activity
  As an admin
  I need to be create Workshop activity so that students can use it in course.
  @javascript
  Scenario: Create a moodle Workshop activity
    Given the following "courses" exist:
      | fullname | shortname | category |
      | Maths    | math102   | 0        |
    And the following "users" exist:
      | username | firstname | lastname   | email               |
      | bpes0001 | Bhavna    | Peswani    | bpes0001@monash.edu |
      | rper0019 | Ranjith   | Periaswamy | rper0019@monash.edu |
      | jsing001 | Jashpal   | Sing       | jsing001@monash.edu |
    And the following "course enrolments" exist:
      | user     | course  | role           |
      | bpes0001 | math102 | editingteacher |
      | rper0019 | math102 | student        |
    When I log in as "bpes0001"
    And I am on "Maths" course homepage
    And I click on "//*//i[@title='Actions menu']" "xpath_element"
    And I click on "//*//div/a[contains(.,'Turn editing on')]" "xpath_element"
    And I click on "//li[@aria-label='General']//span[contains(text(),'Add an activity or resource')]" "xpath_element"
    And I click on "//span[@class='typename' and text()='Workshop']" "xpath_element"
    And I click on "//input[@type='submit' and @value='Add']" "xpath_element"
    And I set the following fields to these values:
      | Workshop name | Test Workshop for Regression |
      | Description  | Show on course page          |
    And I click on "//input[@value='Save and return to course']" "xpath_element"
    And I log out
    And I log in as "rper0019"
    And I am on "Maths" course homepage
    Then I should see "Test Workshop for Regression"
    And I log out