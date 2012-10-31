require "spec_helper"

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')

    #To change this template use File | Settings | File Templates.
    #true.should == false
    end
  end
end