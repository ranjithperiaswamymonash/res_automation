@res_automation @activity @create_Assignment @automation_dev
Feature: Create a moodle assignments
  In order to create a moodle assignment
  As an admin
  I need to be create an activity(assignment) so that students can submit assignments.
  @javascript
  Scenario: Create a moodle assignments
    Given the following "courses" exist:
     | fullname   | shortname   |   category |
     | Maths      | math102     |          0 |
    And the following "users" exist:
     | username   | firstname   | lastname   | email               |
     | bpes0001   | Bhavna      | Peswani    | bpes0001@monash.edu |
     | rper0019   | Ranjith     | Periaswamy | rper0019@monash.edu |
     | jsing001   | Jashpal     | Sing       | jsing001@monash.edu |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | bpes0001 | math102     | editingteacher |
      | rper0019 | math102     | student        |
    When I log in as "admin"
    And I am on "Maths" course homepage
    And I click on "//*//i[@title='Actions menu']" "xpath_element"
    And I click on "//*//div/a[contains(.,'Turn editing on')]" "xpath_element"
    And I click on "//li[@aria-label='General']//span[contains(text(),'Add an activity or resource')]" "xpath_element"
    And I click on "//span[@class='typename' and text()='Assignment']" "xpath_element"
    And I press "Add"
    And I set the following fields to these values:
      | Assignment name | Basic Understanding |
      | Description | Assignment to test the basic understanding of students |
      | id_allowsubmissionsfromdate_enabled | 1 |
      | id_allowsubmissionsfromdate_day | 14 |
      | id_allowsubmissionsfromdate_month | 9 |
      | id_allowsubmissionsfromdate_year | 2019 |
      | id_duedate_enabled | 1 |
      | id_duedate_day | 24 |
      | id_duedate_month | 9 |
      | id_duedate_year | 2019 |
      | id_gradingduedate_enabled | 1 |
      | id_gradingduedate_day | 25 |
      | id_gradingduedate_month | 9 |
      | id_gradingduedate_year | 2019 |
      | Maximum number of uploaded files  | 1 |
    And I click on "//input[@name='assignsubmission_onlinetext_enabled']" "xpath_element"
    And I click on "//input[@name='assignsubmission_onlinetext_wordlimit_enabled']" "xpath_element"
    And I set the field with xpath "//input[@name='assignsubmission_onlinetext_wordlimit']" to "10"
    And I click on "//input[@value='Save and display']" "xpath_element"
    And I log out
    And I log in as "rper0019"
    And I am on "Maths" course homepage
    And I click on "//a[contains(.,'Basic Understanding')]" "xpath_element"
    And I should see "Tuesday, 24 September 2019"
    And I press "Add submission"
    And I set the following fields to these values:
      | Online text | I'm the student first submission I'm the student first submission I'm the student first submission I wait |
    And I press "Save changes"
    And I should see "The word limit for this assignment is 10 words and you are attempting to submit"
    And I should see "Maximum size for new files: 2MB, maximum attachments: 1"