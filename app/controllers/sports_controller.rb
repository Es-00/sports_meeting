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
  end

  def forenotice
    @sports=Sport.where("status=?", "未开始")
  end

  def interest
    if params[:category]
      @sports=Sport.where("title=?","趣味项目:"+params[:category])
      @sports.sort_by! {|x| x.wp}
      respond do |f|
        f.js
      end
    end
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
    @sports=[]
    if params[:key]
      (Sport.all).each do |sport|
        if sport.teamone==params[:key] or sport.teamtwo==params[:key] or params[:key].empty?
          if sport.wday.include? params[:wday_] and sport.week.include? params[:week_] and sport.title.include? params[:title]
            @sports << sport
          end
        end
      end
    end
    #@sports.sort_by!{|e| e.week}
  end




  private
  def sport_params
    params.require(:sport).permit(:title,:winner,:loser,:teamone,:teamtwo,:wp,:lp,:week,:wday,:status,:hour,:minute,:place,:interest)
  end
end
