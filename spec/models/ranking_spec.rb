require "spec_helper"

describe Ranking do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:movie) }

  it do
    should validate_numericality_of(:match_count).
      is_greater_than(0)
  end

  it "calculates the win percentage for a ranking" do
    ranking = Ranking.create(user_id: 1, movie_id: 1, win_count: 5, match_count: 10)
    ranking.win_percentage.should eq(50)
  end
end
