require 'spec_helper'
require_relative '../bird_app'

Capybara.app = BirdApp

  feature "Birdies" do

    before do
      DB[:birds].delete
    end

    scenario "user can add and see birds" do
      visit "/"
      bird_name = "finch"
      expect(page).to have_no_content(bird_name)
      expect(page).to have_no_content("red ")
      fill_in "Bird Name", with: bird_name
      fill_in "Bird Color", with: "red"
      click_on "Add"
      expect(page).to have_content(bird_name)
      expect(page).to have_content("red")
    end
  end
