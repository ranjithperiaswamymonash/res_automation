@res_automation @profile @update_profile_admin
Feature: As A Moodle Administrator User,
  I want to update m a student profile
  so that I can test the update profile feature

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
  Scenario Outline: Update Profile Feature
    Given I log in as "admin"
    And I should see "Admin User"
    And I should see "Acceptance test site"
    And I navigate to "Users > Accounts > Browse list of users" in site administration
    And I click on "//td[contains(.,'Student 1')]/following-sibling::td//i[@aria-label='Edit']" "xpath_element"
    And I set the following fields to these values:
      | First name            | <First name>            |
      | Surname               | <Surname>               |
      | Email display         | <Email display>         |
      | City/town             | <City/town>             |
      | Select a country      | <Select a country>      |
      | Timezone              | <Timezone>              |
      | Description           | <Description>           |
      | Picture description   | <Picture description>   |
      | First name - phonetic | <First name - phonetic> |
      | Surname - phonetic    | <Surname - phonetic>    |
      | Middle name           | <Middle name>           |
      | Alternate name        | <Alternate name>        |
      | List of interests     | <List of interests>     |
      | Web page              | <Web page>              |
      | ICQ number            | <ICQ number>            |
      | Skype ID              | <Skype ID>              |
      | AIM ID                | <AIM ID>                |
      | Yahoo ID              | <Yahoo ID>              |
      | MSN ID                | <MSN ID>                |
      | ID number             | <ID number>             |
      | Institution           | <Institution>           |
      | Department            | <Department>            |
      | Phone                 | <Phone>                 |
      | Mobile phone          | <Mobile phone>          |
      | Address               | <Address>               |
    And I press "Update profile"
    And I should see "<First name>"
    And I should see "<Surname>"
    And I should see "student1@example.com"
    And I should see "<City/town>"
    And I should see "<Select a country>"
    And I click on "//td[contains(.,'StudentUpdate 1Update')]/a" "xpath_element"
    And I should see "<Description>"
    And I should see "User details"
    And I should see "student1@example.com"
    And I should see "<Select a country>"
    And I should see "<City/town>"
    And I should see "<Web page>"
    And I should see "<List of interests>"
    And I should see "<ICQ number>"
    And I should see "<Skype ID>"
    And I should see "<AIM ID>"
    And I should see "<MSN ID>"
    # Make sure that the fields, that were updated persist, when you enter Edit mode
    And I click on "Edit profile" "link" in the "region-main" "region"
    And I should see "StudentUpdate 1Update"
    And I expand all fieldsets
    And I should see "<First name>"
    And I should see "<Surname>"
    And I should see "<Email display>"
    And I should see "<City/town>"
    And I should see "<Select a country>"
    And I should see "<Timezone>"
    And I should see "<Description>"
    And I should see "<List of interests>"
    And the field "Picture description" matches value "<Picture description>"
    And the field "First name - phonetic" matches value "<First name - phonetic>"
    And the field "Surname - phonetic" matches value "<Surname - phonetic>"
    And the field "Middle name" matches value "<Middle name>"
    And the field "Alternate name" matches value "<Alternate name>"
    And the field "Web page" matches value "<Web page>"
    And the field "ICQ number" matches value "<ICQ number>"
    And the field "Skype ID" matches value "<Skype ID>"
    And the field "AIM ID" matches value "<AIM ID>"
    And the field "Yahoo ID" matches value "<Yahoo ID>"
    And the field "MSN ID" matches value "<MSN ID>"
    And the field "ID number" matches value "<ID number>"
    And the field "Institution" matches value "<Institution>"
    And the field "Department" matches value "<Department>"
    And the field "Phone" matches value "<Phone>"
    And the field "Mobile phone" matches value "<Mobile phone>"
    And the field "Address" matches value "<Address>"
    And I press "Cancel"
    # Check that to update an email address requires verification from the email recipient
    And I click on "Edit profile" "link" in the "region-main" "region"
    And I should see "StudentUpdate 1Update"
    And I set the field "Email address" to "student1Update@example.com"
    And I press "Update profile"
    And I should see "<First name>"
    And I should see "<Surname>"
    And I should see "student1Update@example.com"
    And I should see "<City/town>"
    And I should see "<Select a country>"
    And I log out
    Examples:
      | First name    | Surname | Email display                          | City/town | Select a country | Timezone            | Description             | Picture description | First name - phonetic | Surname - phonetic | Middle name      | Alternate name | List of interests    | Web page       | ICQ number | Skype ID | AIM ID | Yahoo ID | MSN ID | ID number | Institution             | Department             | Phone     | Mobile phone | Address                               |
      | StudentUpdate | 1Update | Allow everyone to see my email address | Melbourne | Australia        | Australia/Melbourne | Test Description Update | Test Picture Update | AvaUpdate             | NemcovaUpdate      | MiddleNameUpdate | LeahUpdate     | Test Interest Update | www.update.com | 771        | 772      | 773    | 774      | 775    | 776       | Test Institution Update | Test Department Update | 9428 7817 | 408108637    | 261 Update Street, Richmond, Vic 3121 |



