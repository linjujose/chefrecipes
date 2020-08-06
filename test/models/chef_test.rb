require 'test_helper'

class ChefTest < ActiveSupport::TestCase

    def setup
        @chef = Chef.new(chefname: "linju", email:"linju@chefrecipes.com", 
                            password: "password", password_confirmation: "password")
    end

    test "should be valid" do
        assert @chef.valid?
    end

    test "chefname should be present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end
    
    test "email should be present" do
        @chef.email = " "
        assert_not @chef.valid?
    end

    test "chefname should not be longer than 30 chars" do
        @chef.chefname = "g" * 31
        assert_not @chef.valid?
    end

    test "email should not be too long" do
        @chef.email = "r" * 90 + "@chefrecipes.com"
        assert_not @chef.valid?
    end

    test "email should accept valid formats" do
        valid_emails = %w[user@example.com linju@chefrecipes.com L.J@gmail.co.uk random.houSE7@yahoo.org]
        valid_emails.each do |valid|
            @chef.email = valid
            assert @chef.valid?, "#{valid.inspect} should be valid"
        end
    end

    test "email should reject invalid formats" do
        invalid_emails = %w[user@example linju.chefrecipes@com L.J@gmail.co,uk random.houSE7@yahoo+org]
        invalid_emails.each do |invalid|
            @chef.email = invalid
            assert_not @chef.valid?, "#{invalid.inspect} should be invalid"
        end
    end

    test "email should be unique" do
        duplicate_chef = @chef.dup
        @chef.save
        assert_not duplicate_chef.valid?
    end

    test "email should be case insensitive" do
        duplicate_chef = @chef.dup
        duplicate_chef.email = @chef.email.upcase
        @chef.save
        assert_not duplicate_chef.valid?
    end

    test "email should be only lowercase in db" do
        mixed_email = "JoSE@gmail.com"
        @chef.email = mixed_email
        @chef.save
        assert_equal mixed_email.downcase, @chef.reload.email
    end

    test "password should be present" do
        @chef.password = @chef.password_confirmation = " "
        assert_not @chef.valid?
    end

    test "password should be atleast 6 characters" do
        @chef.password = @chef.password_confirmation = "3" * 5
        assert_not @chef.valid?
    end

    test "associated recipes should be destroyed" do
        @chef.save
        @chef.recipes.create!(name: "testing destroy", description: "testing destroy feature")
        assert_difference 'Recipe.count', -1 do
            @chef.destroy
        end
    end

end