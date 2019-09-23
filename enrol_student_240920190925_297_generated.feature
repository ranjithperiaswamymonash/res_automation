@res_automation @enrollment @enrol_student_as_role @automation_dev
Feature: Enroll Student as a role
  In order to enroll different students/staffs
  As an admin
  I need to be able to enrol student as a role
  @javascript
  Scenario Outline: Enroll Student as a role
    Given the following "users" exist:
     | username   | firstname   | lastname   | email               |
     | bpes0001   | Bhavna      | Peswani    | bpes0001@monash.edu |
     | rper0019   | Ranjith     | Periaswamy | rper0019@monash.edu |
     | jsing001   | Jashpal     | Sing       | jsing001@monash.edu |
    And the following "courses" exist:
     | fullname   | shortname   |   category |
     | Maths      | math102     |          0 |
    And the following "roles" exist:
     | shortname          | name                   | archetype   |
     | lecturer           | Lecturer               | teacher     |
     | nonprimarylecturer | Non - Primary Lecturer | teacher     |
    When I log in as "admin"
    And I am on "Maths" course homepage
    And I click on "//*//span[contains(.,'Participants')]" "xpath_element"
    And I press "Enrol users"
    And I set the following fields to these values:
      | Select users | <name> |
      | Assign role  | <role> |
    And I click on ".btn-primary" "css_element"
    And I log out
    And I log in as <username>
    Then "//a[contains(.,'math102')]" "xpath_element" should be visible
    Examples:
      | username   | name               | role                   |
      | "rper0019" | Ranjith Periaswamy | Student                |
      | "jsing001" | Jashpal Sing       | Lecturer               |
      | "bpes0001" | Bhavna Peswani     | Non - Primary Lecturer |