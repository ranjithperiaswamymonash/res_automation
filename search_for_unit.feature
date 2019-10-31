@res_automation @resource @search_unit
Feature: Search a course
  In order to search a course
  As an admin
  I need to search a course.


  @javascript
  Scenario: Search for a course
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
    When I log in as "admin"
    And I click on "//*//img[@alt='Close Copyright']" "xpath_element"
    And I click on "All Units" "link"
    And I set the field "coursesearchbox" to "Maths"
    And I press "Go"
    And I should see "Maths"
    
