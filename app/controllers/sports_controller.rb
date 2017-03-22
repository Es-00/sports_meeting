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
    if !(params[:key].empty?) and !(params[:wday_].empty?) and !(params[:week_].empty?)
          @sports=Sport.where(winner:params[:key],wday:params[:wday_],week:params[:week_])
          @sports+=Sport.where(loser:params[:key],wday:params[:wday_],week:params[:week_])
    end
      #都不为空
    if !(params[:key].empty?) and (params[:wday_].empty?) and (params[:week_].empty?)
          @sports=Sport.where(winner:params[:key])
          @sports+=Sport.where(loser:params[:key])
    end
    #week和wday为空
    if !(params[:key].empty?) and !(params[:wday_].empty?) and (params[:week_].empty?)
          @sports=Sport.where(winner:params[:key],wday:params[:wday_])
          @sports+=Sport.where(loser:params[:key],wday:params[:wday_])
    end
    #week为空
    if !(params[:key].empty?) and (params[:wday_].empty?) and !(params[:week_].empty?)
          @sports=Sport.where(winner:params[:key],week:params[:week_])
          @sports+=Sport.where(loser:params[:key],week:params[:week_])
    end
    #wday为空
    if (params[:key].empty?) and !(params[:wday_].empty?) and (params[:week_].empty?)
          @sports=Sport.where(wday:params[:wday_])
    end
    #key和week为空
    if (params[:key].empty?) and (params[:wday_].empty?) and !(params[:week_].empty?)
          @sports=Sport.where(week:params[:week_])
    end
    #key和wday为空
    if (params[:key].empty?) and !(params[:wday_].empty?) and !(params[:week_].empty?)
          @sports=Sport.where(wday:params[:wday_],week:params[:week_])
    end
    #key为空
    if (params[:key].empty?) and (params[:wday_].empty?) and (params[:week_].empty?)
          @sports=Sport.all
    end
    #全部为空
    #test
  end


  private
  def sport_params
    params.require(:sport).permit(:title,:winner,:loser,:wp,:lp,:week,:wday)
  end
end
