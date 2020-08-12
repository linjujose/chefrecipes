require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "baby", email: "baby@example.com",
                          password: "password", password_confirmation: "password")
    @chef2 = Chef.create!(chefname: "baby1", email: "baby1@example.com",
                            password: "pass1234", password_confirmation: "pass1234")
    @admin = Chef.create!(chefname: "baby2", email: "babydriver@example.com",
                            password: "pass1234", password_confirmation: "pass1234", admin: true)
  end

  
  test "reject an invalid edit" do
    sign_in_as(@chef)
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: {chef: {chefname: " ", email: "babs@example.com"} } #update doesn't enforce pswd presence
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test "accept valid edit" do
    sign_in_as(@chef)
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: {chef: {chefname: "babson", email: "babson@example.com"} }
    assert_redirected_to @chef #show page
    assert_not flash.empty?
    @chef.reload
    assert_match "babson", @chef.chefname
    assert_match "babson@example.com", @chef.email
  end

  test "accept edit attempt by admin user" do
    sign_in_as(@admin)
    get edit_chef_path(@chef)
    assert_template 'chefs/edit'
    patch chef_path(@chef), params: {chef: {chefname: "baba", email: "baba@example.com"} }
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "baba", @chef.chefname
    assert_match "baba@example.com", @chef.email
  end

  test "redirect edit by a non-admin user" do
    sign_in_as(@chef2)
    updated_name = "joe"
    updated_email = "joe@example.com"
    patch chef_path(@chef), params: {chef: {chefname: updated_name, email: updated_email} }
    assert_redirected_to chefs_path #as instructed in chefs_controller
    assert_not flash.empty?
    @chef.reload
    assert_match "baby", @chef.chefname
    assert_match "baby@example.com", @chef.email
  end

end
