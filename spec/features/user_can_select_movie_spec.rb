require "spec_helper"

describe "User can select movie", :js => true do
    before do
        @movie1 = FactoryGirl.create(:movie)
        @movie2 = FactoryGirl.create(:for_a_few_dollars_more)
    end

  it "displays two movies" do
    visit root_path
    click_link("Register")
    within("#new_user") do
        fill_in "Email", with: "johnny@apple.com"
        fill_in "Password", with: "appleseed"
        fill_in "Password confirmation", with: "appleseed"
    end
    click_button("Sign up")
    expect(page).to have_selector('img', count: 2)
  end
end
