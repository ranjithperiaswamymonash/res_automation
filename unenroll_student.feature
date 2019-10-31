@res_automation @resource @unenroll_student
Feature: Unenrol a student from a course
  In order to unenrol a student
  As an admin
  I need to unenrol a user from the course participants page that was enrolled

  @javascript
  Scenario: Unenrol a user from the course participants page
    Given the following "users" exist:
      | username | firstname | lastname | email            |
      | student1 | Student   | 1        | student1@asd.com |
    And the following "courses" exist:
      | fullname | shortname |
      | Course 1 | C1C1      |
    And the following "course enrolments" exist:
      | user     | course | role    | status |
      | student1 | C1C1   | student | 0      |
    And I log in as "admin"
    Given I am on "Course 1" course homepage
    And I navigate to course participants
    # Suspended users can be unenrolled.
    When I click on "//a[@data-action='unenrol']" "xpath_element" in the "student1" "table_row"
    And I click on "Unenrol" "button" in the "Unenrol" "dialogue"
    Then "*//td[contains(.,'student1')]" "xapth_element" should not be visible
