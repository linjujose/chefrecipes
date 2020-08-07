require 'test_helper'

class ChefsLoginTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "Linju", email: "linjus@example.com", password: "pass1234")
  end
  
  test "invalid login is rejected" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: " ", password: " "}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    #flash.now should show flash only once, shouldn't persist after redirect/ http cycle
    get root_path
    assert flash.empty?
  end    


  test "valid login credentials accepted and beign section" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: @chef.email, password: @chef.password}}
    assert_redirected_to @chef 
    follow_redirect!
    assert_template 'chefs/show'
    assert_not flash.empty?
  end

end
