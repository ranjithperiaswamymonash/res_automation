@res_automation @hide_unhide_activities @hide_unhide_folder_activity @automation_dev
Feature: In order to hide folder activities from students
  As a Lecturer
  I can hide and un hide folder activities in the course

  @javascript
  Scenario Outline: hide and un hide folder activities in the course
    Given the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | topics |
    And the following "users" exist:
      | username | firstname | lastname   | email               |
      | bpes0001 | Bhavna    | Peswani    | bpes0001@monash.edu |
      | rper0019 | Ranjith   | Periaswamy | rper0019@monash.edu |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | bpes0001 | C1     | editingteacher |
      | rper0019 | C1     | student        |
    And the following "activities" exist:
      | activity | name             | intro            | course | idnumber |
      | folder   | Test folder name | Test folder desc | C1     | folder1   |
    When I log in as "bpes0001"
    And I am on "Course 1" course homepage
    And I click on "//*//i[@title='Actions menu']" "xpath_element"
    And I click on "//*//div/a[contains(.,'Turn editing on')]" "xpath_element"
    And I click on "//span[@data-value='<name>']/parent::div/following-sibling::span//a[@aria-label='Edit']" "xpath_element"
    And I click on "//span[@data-value='<name>']/parent::div/following-sibling::span//a[@data-action='hide']" "xpath_element"
    And I log out
    Then I log in as "rper0019"
    And I am on "Course 1" course homepage
    And I should not see "<name>"
    And I log out
    And I log in as "bpes0001"
    And I am on "Course 1" course homepage
    And I click on "//*//i[@title='Actions menu']" "xpath_element"
    And I click on "//*//div/a[contains(.,'Turn editing on')]" "xpath_element"
    And I click on "//span[@data-value='<name>']/parent::div/following-sibling::span//a[@aria-label='Edit']" "xpath_element"
    And I click on "//span[@data-value='<name>']/parent::div/following-sibling::span//a[@data-action='show']" "xpath_element"
    And I log out
    And I log in as "rper0019"
    And I am on "Course 1" course homepage
    And I should see "<name>"
    And I log out
    Examples:
      | name             |
      | Test folder name |