@res_automation @activity @create_lesson_activity @automation_dev

Feature: Create a moodle lesson activity

  In order to create a lesson activity

  As an admin

  I need to be create lesson activity so that students can use it in course.

  @javascript

  Scenario: Create a moodle lesson activity

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

    And I click on "//span[@class='typename' and text()='Lesson']" "xpath_element"

    And I click on "//input[@type='submit' and @value='Add']" "xpath_element"

    And I set the following fields to these values:

      | Name | Test Lesson |
      | Description | Test Lesson Description |

    And I click on "//input[@value='Save and return to course']" "xpath_element"

    And I log out

    And I log in as "rper0019"

    And I am on "Maths" course homepage

    Then I should see "Test Lesson"

    And I log out