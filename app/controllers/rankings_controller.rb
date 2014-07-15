class RankingsController < ApplicationController
  def index
    @rankings = Ranking.where(user_id: params[:user_id]).where("match_count > 2").sort_by(&:win_percentage).reverse.map {|ranking| ranking.movie }
    render json: @rankings
  end

  def watchlist
    @watchlist = Ranking.where(user_id: params[:user_id]).where(has_watched: false).map {|ranking| ranking.movie }.sort_by(&:rating).reverse
    render json: @watchlist
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

  def add_to_watchlist
    @ranking = current_user.rankings.find_or_initialize_by(movie_id: params[:id])
    @ranking.has_watched = false
    @ranking.save
    render json: @ranking
  end

  private

  def ranking_params
    params.require(:ranking).permit(:collection)
  end

end
