class RankingsController < ApplicationController
  def index
    @rankings = Ranking.where(user_id: params[:user_id]).sort_by(&:win_percentage).reverse.map {|ranking| ranking.movie }
    render json: @rankings
  end

  def create
     @rankings = params[:collection]
     @rankings.each do |movie|
      ranking = current_user.rankings.find_or_initialize_by(movie_id: movie["id"])
      ranking.update(match_count: ranking.match_count + 1)
     end

     redirect_to root_path
  end

  def update
    @ranking = Ranking.find(params[:id])
    if @ranking.update(win_count: win_count + 1)
      render status: 200, nothing: true
    else
      render status: 400, nothing: true
    end
  end

  def win
    @ranking = current_user.rankings.find_by(movie_id: params[:id])
    @ranking.win_count += 1
    @ranking.save
    render json: @ranking
  end

  private

  def ranking_params
    params.require(:ranking).permit(:collection)
  end

end
