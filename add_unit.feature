@moodle-upgrade  @add_unit
Feature: As a Moodle User,
  I want to automate adding a new unit
  so that I can test it is working

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email |
      | student1 | Student | 1 | student1@example.com  |
      | lecturer1| lecturer| 1 | lecturer1@example.com |

  @javascript
  Scenario: Adding a new unit
    Given I log in as "admin"
    And I navigate to "Courses > Add a new course" in site administration
    And I set the following fields to these values:
      | Course full name      | Test-Course     |
      | Course short name     | Test            |
    And I click on "Save and display" "button"
    Then I should see "Test-Course"
    