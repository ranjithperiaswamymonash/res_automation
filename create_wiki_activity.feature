@res_automation @activity @create_wiki_activity
Feature: As A Moodle User,
  I want to automate adding a wiki activty
  so that I can test the wiki creation

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
  Scenario: Adding Wiki Activity
    Given I log in as "lecturer1"
    And I am on "Course 1" course homepage
    And I click on "//*//i[@title='Actions menu']" "xpath_element"
    And I click on "//*//div/a[contains(.,'Turn editing on')]" "xpath_element"
    And I click on "//li[@aria-label='General']//span[contains(text(),'Add an activity or resource')]" "xpath_element"
    And I click on "//input[@id='item_wiki']" "xpath_element"
    And I click on "//input[@value='Add']" "xpath"
    And I set the following fields to these values:
      | Wiki name        | Test Wiki               |
      | Description      | For Test Purpose        |
      | First page name  | Test First Page         |
      | Default format   | HTML                    |
      | Force format     | 1                       |
    And I press "Save and display"
    And I should see "Test Wiki"
    And I log out
    And I log in as "student1"
    And I am on "Course 1" course homepage
    Then I should see "Test Wiki"
    And I log out
