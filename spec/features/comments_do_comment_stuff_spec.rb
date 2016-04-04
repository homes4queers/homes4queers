require "rails_helper"

feature "comments load on listing show page" do
  setup do
    @listing = FactoryGirl.create(:listing)
    @user = FactoryGirl.create(:test_user)
  end

  scenario "successfully" do
  ApplicationController.any_instance.stub(:require_login)
    visit listing_path(id: 1)
    expect(page).to have_css '#the-comments'
    expect(page).to have_css '#comment_body'
  end
end
