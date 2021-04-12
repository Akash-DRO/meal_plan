require "test_helper"

describe Recipe do 
	describe "validity" do
		let(:recipe) { Recipe.new }

		before do
			recipe.valid?
		end

		it "requires a user" do
			recipe.errors(:user).must_include "can't be blank"   #Use _(obj).must_include
		end

		it "requires a description" do
		    recipe.errors(:description).must_include "can't be blank"
		end

		it "requires a name" do
			recipe.errors(:name).must_include "can't be blank"
		end

		it "requires the name to be unique for the same user" do
			existing_recipe = create(:recipe)
			recipe.name = existing_recipe.name
			recipe.user = existing_recipe.user
			recipe.valid?

			recipe.errors(:name).must_include "has already been taken"
		end

		it "does not require the name to be unique for different users" do
			existing_recipe = create(:recipe)
			recipe.name = existing _recipe.name
			recipe.valid?

			recipe.errors(:name).wont_include "has already been taken"
		end
	end
end

#Recipe::validity#test_0003_requires a name:
#ArgumentError: wrong number of arguments (given 1, expected 0)
 #   test/models/recipe_test.rb:20:in `block (3 levels) in <main>'
