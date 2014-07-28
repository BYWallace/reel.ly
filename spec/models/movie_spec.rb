require 'spec_helper'

describe Movie do
  it "has a valid factory" do
    FactoryGirl.create(:movie).should be_valid
  end

  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:year) }
  it { should have_many(:rankings) }

  # this takes a very long time :(
  # it "populates the database with the imdb top 250" do
  #   expect{Movie.generate_imdb250}.to change{Movie.count}.from(0).to(250)
  # end
end
