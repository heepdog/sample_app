require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do  
      post users_path, params: { user: { name:  "chris", 
                                          email: "user@invalid.com",
                                          password: "test1234", 
                                          password_confirmation: "test1234" } }
    end
    assert_template 'users/new'
    assert_select 'div#<CSS id for error explanation>'
    assert_select 'div.<CSS class for field with error>'

  end
end