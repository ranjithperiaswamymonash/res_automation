@regression_tests_theme @resource @create_page_resource @automation_dev
Feature: Create page resource
  In order to enroll different students/staffs
  As an admin
  I need to be able to enrol student as a role
  @javascript
  Scenario: Create page resource
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
    And I click on "//span[@class='typename' and text()='Page']" "xpath_element"
    And I press "Add"
    And I expand all fieldsets
    And I set the following fields to these values:
      | Name | Test page name |
      | Description | Test page description <br> Test page description <br> Test page description <br> Test page description <br> Test page description |
      | Page content | This is a page |
      | Display description on course page | 1 |
      | Availability      | Show on course page |
    And I click on "//label[contains(.,'Display page description')]" "xpath_element"
    And I click on "//input[@value='Save and return to course']" "xpath_element"
    And I log out
    And I log in as "rper0019"
    And I am on "Maths" course homepage
    Then I should see "Test page name"
    And I follow "Test page name"
    And I should see "This is a page"
    And I log out