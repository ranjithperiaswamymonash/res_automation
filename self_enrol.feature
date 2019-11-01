@enrol @self_enrol
Feature: Users can self-enrol themselves in courses where self enrolment is allowed
  In order to participate in courses
  As a user
  I need to self enrol myself in courses

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email |
      | teacher1 | Teacher | 1 | teacher1@example.com |
      | student1 | Student | 1 | student1@example.com |
    And the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1 | topics |
    And the following "course enrolments" exist:
      | user | course | role |
      | teacher1 | C1 | editingteacher |


@javascript
Scenario: Self-enrolment enabled
Given I log in as "teacher1"
And I am on "Course 1" course homepage
And I wait "10" seconds
When I add "Self enrolment" enrolment method with:
| Custom instance name | Test student enrolment |
And I log out
And I log in as "student1"
And I am on "Course 1" course homepage
And I press "Enrol me"
Then I should see "Topic 1"
And I should not see "Enrolment options"