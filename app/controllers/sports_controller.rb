class SportsController < ApplicationController

  def index
    @sports=Sport.all
  end

  def new
    @sport=Sport.new
  end

  def create
    @sport = Sport.new(params.require(:sport).permit(:title,:winner,:loser,:wp,:lp,:week,:wday))

    @sport.save

    if @sport.save
      redirect_to @sport
    else
      render 'new'
    end
  end

  def destroy
    @sport = Sport.find(params[:id])
    @sport.destroy

    redirect_to @sport
  end

  def show
    @sport= Sport.find(params[:id])
  end

  def edit
    @sport= Sport.find(params[:id])
  end

  def update
    @sport= Sport.find(params[:id])
    if @sport.update(sport_params)
      redirect_to @sport
    else
      render 'edit'
    end
  end

  def search
    @sports=Sport.where('winner=?',params[:key])
    @sports+=Sport.where('loser=?',params[:key])
  end


  private
  def sport_params
    params.require(:sport).permit(:title,:winner,:loser,:wp,:lp,:week,:wday)
  end
end
