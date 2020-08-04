require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "babu", email: "babs@example.com",
                          password: "password", password_confirmation: "password")
  end

  
  test "reject an invalid edit" do
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: {chef: {chefname: " ", email: "babs@example.com"} } #update doesn't enforce pswd presence
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "accept valid edit" do
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: {chef: {chefname: "babson", email: "babson@example.com"} }
    assert_redirected_to @chef #show page
    assert_not flash.empty?
    @chef.reload
    assert_match "babson", @chef.chefname
    assert_match "babson@example.com", @chef.email
  end

end
