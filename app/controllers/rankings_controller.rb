class RankingsController < ApplicationController
  def index
    @rankings = Ranking.where(user_id: params[:user_id]).sort_by(&:win_percentage).reverse.map {|ranking| ranking.movie }
    render json: @rankings
  end

  private

  def request_params
    params.require(:ranking).permit(:win_count, :match_count)
  end

end
