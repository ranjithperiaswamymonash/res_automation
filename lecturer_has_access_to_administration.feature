@res_automation @profile @lecturer_has_admin
Feature: As A Moodle Adminstrator User,
  I want to be able to login with Administrator permissions
  so that I can access the administrator features

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
  Scenario: Login with administrator permissions Feature
    When I log in as "admin"
    And I should see "Admin User"
    And I should see "Acceptance test site"
    # Has Admin permissions
    And I should see "Site administration"
    And I navigate to "Appearance > Default Dashboard page" in site administration
    And I log out
    And I log in as "lecturer1"
    And I should see "lecturer 1"
    And I should see "Acceptance test site"
    # Does NOT have Admin permissions
    And I should not see "Site administration"
    And I follow "Profile" in the user menu
    And I log out
    And I log in as "student1"
    Then I should see "Student 1"
    And I should see "Acceptance test site"
    # Does NOT have Admin permissions
    And I should not see "Site administration"
    And I follow "Profile" in the user menu
    And I log out


