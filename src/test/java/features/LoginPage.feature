@LoginPage
Feature: Login Page

  @EmtyMail
  Scenario Outline: Empty Mail
    Given user is on login page
    When user enters password "<password>"
    When user clicks on Login button
    Then user should see empty mail message "<emptyMailMessage>"
    Examples:
      | password | emptyMailMessage                              |
      | password | Lütfen kullanıcı adınızı/e-postanızı giriniz. |

  @EmtyPassword
  Scenario Outline: Empty Password
    Given user is on login page
    When user enters email "<email>"
    When user clicks on Login button
    Then user should see empty password message "<emptyPassMessage>"
    Examples:
      | email                  | emptyPassMessage          |
      | mikail.snmz@gmail.com | Lütfen şifrenizi giriniz. |

  @FalseLogin
  Scenario Outline: False Password and Mail
    Given user is on login page
    When user enters email "<email>"
    When user enters password "<password>"
    When user clicks on Login button
    Then user should see popup message "<message>"
    Examples:
      | email         | password | message                                                                        |
      | mail@mail.com | password | Hatalı giriş. Lütfen kullanıcı adı ve şifrenizi kontrol edip tekrar deneyiniz. |

  @SuccessLogin
  Scenario Outline:  Success Login with <email>
    Given user is on login page
    When user enters email "<email>"
    When user enters password "<password>"
    When user clicks on Login button
    When user clicks popup close button
    Then user should see name "<name>"
    Examples:
      | email                  | password  | name         |
      | mikail.snmz@gmail.com | Mikail.2000 | Mikail Som,ez |