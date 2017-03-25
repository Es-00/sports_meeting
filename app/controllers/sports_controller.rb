class SportsController < ApplicationController

  def index
    @sports=Sport.all
  end

  def new
    @sport=Sport.new
    @sport.status = "未开始"
    @sport.winner = "0"
    @sport.loser = "0"
    @sport.week = "第一周"
    @sport.wday = "星期日"
    @sport.title = "羽毛球"
  end

  def create
    @sport = Sport.new(params.require(:sport).permit(:title,:teamone,:winner,:loser,:teamtwo,:wp,:lp,:week,:wday,:status,:hour,:minute,:place))

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
    if title.nil?
      if !(params[:key].empty?) and !(params[:wday_].empty?) and !(params[:week_].empty?)
            @sports=Sport.where(teamone:params[:key],wday:params[:wday_],week:params[:week_])
            @sports+=Sport.where(teamtwo:params[:key],wday:params[:wday_],week:params[:week_])
      end
        #都不为空
      if !(params[:key].empty?) and (params[:wday_].empty?) and (params[:week_].empty?)
            @sports=Sport.where(teamone:params[:key])
            @sports+=Sport.where(teamtwo:params[:key])
      end
      #week和wday为空
      if !(params[:key].empty?) and !(params[:wday_].empty?) and (params[:week_].empty?)
            @sports=Sport.where(teamone:params[:key],wday:params[:wday_])
            @sports+=Sport.where(teamtwo:params[:key],wday:params[:wday_])
      end
      #week为空
      if !(params[:key].empty?) and (params[:wday_].empty?) and !(params[:week_].empty?)
            @sports=Sport.where(teamone:params[:key],week:params[:week_])
            @sports+=Sport.where(teamtwo:params[:key],week:params[:week_])
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
    elsif
      if !(params[:key].empty?) and !(params[:wday_].empty?) and !(params[:week_].empty?)
            @sports=Sport.where(teamone:params[:key],wday:params[:wday_],week:params[:week_],title:params[:title])
            @sports+=Sport.where(teamtwo:params[:key],wday:params[:wday_],week:params[:week_],title:params[:title])
      end
        #都不为空
      if !(params[:key].empty?) and (params[:wday_].empty?) and (params[:week_].empty?)
            @sports=Sport.where(teamone:params[:key],title:params[:title])
            @sports+=Sport.where(teamtwo:params[:key],title:params[:title])
      end
      #week和wday为空
      if !(params[:key].empty?) and !(params[:wday_].empty?) and (params[:week_].empty?)
            @sports=Sport.where(teamone:params[:key],wday:params[:wday_],title:params[:title])
            @sports+=Sport.where(teamtwo:params[:key],wday:params[:wday_],title:params[:title])
      end
      #week为空
      if !(params[:key].empty?) and (params[:wday_].empty?) and !(params[:week_].empty?)
            @sports=Sport.where(teamone:params[:key],week:params[:week_],title:params[:title])
            @sports+=Sport.where(teamtwo:params[:key],week:params[:week_],title:params[:title])
      end
      #wday为空
      if (params[:key].empty?) and !(params[:wday_].empty?) and (params[:week_].empty?)
            @sports=Sport.where(wday:params[:wday_],title:params[:title])
      end
      #key和week为空
      if (params[:key].empty?) and (params[:wday_].empty?) and !(params[:week_].empty?)
            @sports=Sport.where(week:params[:week_],title:params[:title])
      end
      #key和wday为空
      if (params[:key].empty?) and !(params[:wday_].empty?) and !(params[:week_].empty?)
            @sports=Sport.where(wday:params[:wday_],week:params[:week_],title:params[:title])
      end
      #key为空
      if (params[:key].empty?) and (params[:wday_].empty?) and (params[:week_].empty?)
            @sports=Sport.where(title:params[:title])
      #全部为空
      end
    end
    @sports.sort_by!{|e| e.week*7+e.wday}
    #test
  end


  private
  def sport_params
    params.require(:sport).permit(:title,:winner,:loser,:teamone,:teamtwo,:wp,:lp,:week,:wday,:status,:hour,:minute,:place)
  end
end
