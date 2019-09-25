@core @core_backup @moodle-upgrade @activties
Feature: As A Moodle User,
  I want to restore a unit scenario
  so that restoring a unit can be tested and validated
  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email |
      | student1 | Student | 1 | student1@example.com  |
      | lecturer1| lecturer| 1 | lecturer1@example.com |
    And the following "courses" exist:
      | fullname | shortname | category | numsections |
      | Course 1 | C1        | 0        | 10          |
      | Course 2 | C2        | 0        | 2           |
      | Course 3 | C3        | 0        | 2           |
    And the following "course enrolments" exist:
      | user     | course | role |
      | student1 | C1     | student        |
      | lecturer1| C1     | editingteacher |
  @javascript
  Scenario: Validation of restoring a unit
    Given I log in as "lecturer1"
    And I am on "Course 1" course homepage
  And I click on "//*//i[@title='Actions menu']" "xpath_element"
   And I click on "//*//div/a[contains(.,'Turn editing on')]" "xpath_element"
   And I click on "//li[@aria-label='General']//span[contains(text(),'Add an activity or resource')]" "xpath_element"
    And I click on "//input[@id='item_resource']" "xpath_element"
    And I click on "Add" "button"
    And I set the following fields to these values:
      | Name        | Test-File         |
      | Description | For Test purpose    |
    And I click on "//div[@class='fm-empty-container']/div/div" "xpath_element"
    And I click on "//span[text()='Wikimedia']" "xpath_element"
    And I set the field "Search for:" to "Moodle"
    And I click on "Submit" "button"
    And I click on "//div[@class='container repository_wikimedia']/div/div[2]/div/div[2]/div/a" "xpath_element"
    And I click on "Select this file" "button"
    And I click on "Save and display" "button"
    Then I should see "Test-File"
    And I log out
    And I log in as "student1"
    And I am on "Course 1" course homepage
    Then I should see "Test-File"
    And I click on "Test-File" "link"
    Then I should see "Test-File"
    