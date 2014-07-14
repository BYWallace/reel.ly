class RankingsController < ApplicationController
  def index
    @rankings = Ranking.where(user_id: params[:user_id]).sort_by(&:win_percentage).reverse.map {|ranking| ranking.movie }
    render json: @rankings
  end

  def create

  end

  def update
    @ranking = Ranking.find(params[:id])
    if @ranking.update(ranking_params)
      render status: 200, nothing: true
    else
      render status: 400, nothing: true
    end
  end

  private

  def ranking_params
    params.require(:ranking).permit(:win_count, :match_count)
  end

end
