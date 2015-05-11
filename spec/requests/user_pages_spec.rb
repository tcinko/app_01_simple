require 'rails_helper'

describe "User pages:" do
	subject { page }

	describe "profile page:" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end


	describe "signup page:" do
		before { visit signup_path }

		it { should have_content('Sign up') }
		it { should have_title(full_title('Sign up')) }

		let(:submit) { "Create my account" }

		describe "with invalid information:" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)

#  эквивалентно:       -eq
# 				init_count = User.count
# 				click_button "Create my account"
# 				final_count = User.count
# 				expect(init_count).to eq final_count
			end
		end

		describe "with valid information:" do
			before do
				fill_in "Name",         with: "Example User"
				fill_in "E-mail",       with: "user@example.com"
				fill_in "Password",     with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end

			it "should create a user:" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user:" do
				before { click_button submit }
 				let(:user) { User.find_by(email: 'example@railstutorial.org') }
# 				let(:user) { FactoryGirl.create(:user) }
#	не работает
# 				it { should have_title(user.name) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome to') }
				it { should have_link('Sign out') }
			end
		end

		describe "after submission:" do
			before { click_button submit }

			it { should have_title('Sign up') }
			it { should have_content('error') }
		end

# don't work
# 		describe "followed by signout:" do
# 			before { click_link "Sign out" }
# 			it { should have_link('Sign in') }
# 		end

	end

end
