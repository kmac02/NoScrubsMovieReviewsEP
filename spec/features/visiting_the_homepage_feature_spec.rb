require 'rails_helper'

feature "visiting the homepage" do
  scenario "the user sees a list of popular movies and can view them" do
    visit "/"

    within(".popular_movies") do
      expect(page).to have_content
    end

    expect(page).to have_current_path game_path(most_recent_game)
  end

  scenario "the user can go to a genre page" do
    visit "/"
    click_link("")
    expect(page).to have_current_path(genre_path(@genre))
  end
end
