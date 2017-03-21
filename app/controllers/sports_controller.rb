class SportsController < ApplicationController
  def index
    @sports=Sport.all
  end
  def new
    @sport=Sport.new
  end
  def create
  @sport = Sport.new(params.require(:sport).permit(:title,:winner,:loser,:wp,:lp))

  @sport.save
  redirect_to @sport
  end
  def destroy
  end
  def show
    @sport= Sport.find(params[:id])
  end
  def update
    @sport= Sport.find(params[:id])
  end
  def edit
    @sport= Sport.find(params[:id])
  end

  private
  def sport_params
    params.require(:sport).permit(:title,:winner,:loser,:wp,:lp)
  end
end
