require 'spec_helper'

feature "User click New Game" do
  given!(:game) { Fabricate(:game) }

  background do
    Game.stub(:create).and_return(game)
  end

  scenario "User receives results" do
    visit "/"
    click_button "New Game"
    expect(page).to have_text("Tenpin Game #{game.id} Total score:")
    expect(page).to have_text("Frame number Points Balls")
  end


  scenario "User clicks back" do
    visit "/games/#{game.id}"
    click_link "Back"
    expect(page).to have_text("Tenpin Ten-pin bowling games")
  end
end
