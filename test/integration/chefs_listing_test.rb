require 'test_helper'

class ChefsListingTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefname: "banarasi babu", email: "babu@example.com",
      password: "password", password_confirmation: "password")
    @chef2 = Chef.create!(chefname: "babson", email: "babs@example.com",
      password: "pass1234", password_confirmation: "pass1234")
  end

  test "should get chefs index" do
    get chefs_url
    assert_response :success
  end

  test "should show chefs listing" do
    get chefs_path
    assert_template 'chefs/index'
    assert_select 'a[href=?]', chef_path(@chef), text: @chef.chefname.capitalize
    assert_select "a[href=?]", chef_path(@chef2), text: @chef2.chefname.capitalize
  end
end
