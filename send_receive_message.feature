@res_automation @messages @send_receive_messages

Feature: View messages
  In order to communicate with fellow users
  As a user
  I need to be able to send and receive messages

  @javascript
  Scenario: Send and receive messages
    Given the following "users" exist:
      | username | firstname | lastname | email             |
      | user1    | User      | 1        | user1@example.com |
      | user2    | User      | 2        | user2@example.com |
      | user3    | User      | 3        | user3@example.com |
    And I log in as "user2"
    And I click on "//div[@id='nav-message-popover-container']/div[@aria-role='button']" "xpath_element"
    And I click on "//a[contains(.,'New message')]" "xpath_element"
    And I set the field with xpath "//input[@id='searchtext']" to "User 1"
    And I click on "//div[@class='name' and contains(.,'User 1')]" "xpath_element"
    And I set the field with xpath "//textarea" to "User 2 to User 1"
    And I click on "//button[contains(.,'Send')]" "xpath_element"
    And I log out
    When I log in as "user1"
    And "//div[@class='count-container ']" "xpath_element" should be visible
    And I click on "//div[@id='nav-message-popover-container']/div[@aria-role='button']" "xpath_element"
    And I click on "//a[contains(.,'New message')]" "xpath_element"
    And I set the field with xpath "//input[@id='searchtext']" to "User 2"
    And I click on "//div[@class='name' and contains(.,'User 2')]" "xpath_element"
    And I should see "User 2 to User 1"
    And I set the field with xpath "//textarea" to "User 1 to User 2"
    And I click on "//button[contains(.,'Send')]" "xpath_element"
    And I log out
    And I log in as "user2"
    Then "//div[@class='count-container ']" "xpath_element" should be visible
    And I click on "//div[@id='nav-message-popover-container']/div[@aria-role='button']" "xpath_element"
    And I click on "//a[contains(.,'New message')]" "xpath_element"
    And I set the field with xpath "//input[@id='searchtext']" to "User 1"
    And I click on "//div[@class='name' and contains(.,'User 1')]" "xpath_element"
    And I set the field with xpath "//textarea" to "User 1 to User 2"
    And I log out
