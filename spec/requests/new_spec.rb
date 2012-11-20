 require 'spec_helper'

describe "users/new.html.erb" do

  subject { page }

  describe "with invalid information" do

    before { visit sign_up_path }

    let(:submit) { "Create my account" }
    before { click_button submit }

    it { should have_content('error') }

  end
end

