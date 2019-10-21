@res_automation @resource @import_activity
Feature: Import course's activities into another course
  In order to move and copy activities between courses
  As a teacher
  I need to import a course activity into another course selecting what I want to import

  @javascript
  Scenario: Import course's activity to another course
    Given the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1 | 0 |
      | Course 2 | C2 | 0 |
    And the following "users" exist:
      | username | firstname | lastname | email |
      | teacher1 | Teacher | 1 | teacher1@example.com |
    And the following "course enrolments" exist:
      | user | course | role |
      | teacher1 | C1 | editingteacher |
      | teacher1 | C2 | editingteacher |
    And the following "activities" exist:
      | activity | name             | intro            | course | idnumber |
      | feedback | feedback activity | Test feedback desc | C2     | feedback1   |
    And I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I click on "//*//i[@title='Actions menu']" "xpath_element"
    And I click on "//*//div/a[contains(.,'Import')]" "xpath_element"
    And I click on "//td[contains(.,'Course 2')]/preceding-sibling::td//input" "xpath_element"
    And I click on "//input[@value='Continue']" "xpath_element"
    And I click on "//input[@value='Next']" "xpath_element"
    And I click on "None" "link"
    And I click on "//label[contains(.,'General')]" "xpath_element"
    And I click on "//label[contains(.,'feedback')]" "xpath_element"
    And I click on "//input[@value='Next']" "xpath_element"
    And I click on "//input[@value='Perform import']" "xpath_element"
#    And I wait "3" seconds
    And I should see "Import complete. Click continue to return to the course."
    And I click on "//button[contains(.,'Continue')]" "xpath_element"
#    When I import "Course 2" course into "Course 1" course using this options:
    When I am on "Course 1" course homepage
    Then I should see "feedback activity"