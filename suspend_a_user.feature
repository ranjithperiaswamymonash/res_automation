@enrol @suspend_user
Feature: Admin can suspend students in courses
  In order to suspend a user
  As an admin
  I need to suspend user from courses

Background:
Given the following "courses" exist:
| fullname | shortname | format |
| Course 1 | C1 | topics |
And the following "users" exist:
| username | firstname | lastname | email |
| teacher1 | Teacher | 1 | teacher1@example.com |
| student1 | Student | 1 | student1@example.com |
And the following "course enrolments" exist:
| user | course | role |
| teacher1 | C1 | editingteacher |
| student1 | C1 | student |


@javascript
Scenario: Suspend a user
Given I log in as "admin"
And I am on "Course 1" course homepage
And I navigate to "Users > Enrolled users" in current page administration
And I click on "Edit enrolment" "link" in the "Student 1" "table_row"
And I set the following fields to these values:
| Status | Suspended |
And I press "Save changes"



