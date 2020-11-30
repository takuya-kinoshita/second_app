require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: {name: "",
                                        email: "user@invalid",
                                        password: "password",
                                        password_confirmation: "password"}}
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
    assert_select 'form[action="/signup"]'

  end

  test "valid signup integration" do
    get signup_path
    assert_difference 'User.count' do
      post signup_path, params: {user: {name: "aaaaa",
                                        email: "aaa@gmail.com",
                                        password: "password",
                                        password_confirmation: "password"}}
    follow_redirect!                                        
    assert_template 'users/show'
    assert_not flash.empty?
    end
  end


end
