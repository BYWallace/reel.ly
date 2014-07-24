require "spec_helper"

describe "User can register for an account" do

  it "signs in and redirects to root page" do
    visit root_path
    click_link("Register")
    within("#new_user") do
        fill_in "Email", with: "johnny@apple.com"
        fill_in "Password", with: "appleseed"
        fill_in "Password confirmation", with: "appleseed"
    end
    click_button("Sign up")
    expect(page).to have_content "Sign out"
  end

  it "throws an error when information is invalid" do
    visit root_path
    click_link("Register")
    within("#new_user") do
        fill_in "Email", with: "johnny@apple.com"
        fill_in "Password", with: "appleseed"
        fill_in "Password confirmation", with: "asdf"
    end
    click_button("Sign up")
    expect(page).to have_content "Register"

    end

end
