class Ranking < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  validates :user, :movie, presence: true
  validates :match_count, numericality: { greater_than: 0 }

  def win_percentage
    ((self.win_count.to_f / self.match_count) * 100).to_i
  end

end
