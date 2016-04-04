require 'rails_helper'

feature "comments save on submit" do
  # setup do
    @listing = FactoryGirl.create(:listing, :id=>1)
    @user = FactoryGirl.create(:test_user)
  # end
  current_user = FactoryGirl.create(:test_user)

  scenario "successfully" do
    ApplicationController.any_instance.stub(:require_login)
    visit listing_path(id: 1)
    fill_in 'comment_body', with: "Lorem ipsum dolor sit amet"
    click_on 'Add Comment'

    expect(page).to have_css "#show-comment", text: "Lorem ipsum dolor sit amet"
  end
end
