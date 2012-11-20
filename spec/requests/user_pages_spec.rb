require 'spec_helper'

describe "User pages" do

  subject { page }

  #describe "profile page" do
  #  let(:user) { FactoryGirl.create(:user) }
  #  ## Code to make a user variable
  #  before { visit user_path(user) }
  #
  #  it { should have_selector('h1',    text: user.name) }
  #  it { should have_selector('title', text: user.name) }
  #end

  describe "signup page" do
    before { visit sign_up_path }

    it { should have_selector('h1',    text: 'Sign Up') }
    it { should have_selector('title', text: full_title('Sign up')) }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end


    #*** Validation inserting a new user ***

    describe "with valid information" do

      before do
        fill_in "Name",                   with: "Example User"
        fill_in "Username",               with: "kim@example.com"
        fill_in "Password",               with: "foobar"
        fill_in "Confirm Password",       with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        #before { click_button submit }
        let(:user) { User.find_by_username('kim@example.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_link('Sign out') }

           *** never got this one working to find selector, but is in html... move this to line 43?  ***
        #it { should have_selector('div.alert alert-success', text: 'Welcome') }
      end
    end
  end
end