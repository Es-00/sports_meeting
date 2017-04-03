class SportsController < ApplicationController

  def index
    @sports=Sport.all
  end

  def new
    if current_user
      @sport=Sport.new
      @sport.status = "已结束"
      @sport.winner = "0"
      @sport.loser = "0"
      @sport.week = "第一周"
      @sport.wday = "星期日"
    else
      redirect_to :root
    end
  end

  def forenotice
    @sports=Sport.where("status=?", "未开始")
  end

  def interest
  end

  def interesting
    if params[:category]
      @sports=[]
      @sports+=Sport.where("title=?","趣味项目:"+params[:category])
      unless @sports.empty?
        begin
          unless @sports.last.wp.include? ":"
            @sports.sort_by! {|x| x.wp.to_i*(-1)}
          else
            @sports.sort_by! {|x| x.wp}
          end
        rescue
          #Do Nothing
        end
      end
      respond_to do |f|
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
    if current_user
      @sport = Sport.find(params[:id])
      @sport.destroy
      redirect_to @sport
    else
      redirect_to :root
    end
  end

  def show
    if current_user
      @sport= Sport.find(params[:id])
    else
      redirect_to :root
    end
  end

  def edit
    if current_user
      @sport= Sport.find(params[:id])
    else
      redirect_to :root
    end
  end

  def update
    if current_user
      @sport= Sport.find(params[:id])
      if @sport.update(sport_params)
        redirect_to @sport
      else
        render 'edit'
      end
    else
      redirect_to :root
    end
  end



  def search
    dic={"校历第五周"=>1,"校历第六周"=>2,"校历第七周"=>3,"校历第八周"=>4}
    dic2={"星期一"=>1,"星期二"=>2,"星期三"=>3,"星期四"=>4,"星期五"=>5,"星期六"=>6,"星期日"=>7}
    @sports=[]
    if params[:key]
      Sport.all.each do |sport|
        if sport.teamone.include? params[:key] or sport.teamtwo.include? params[:key]
          if sport.wday.include? params[:wday_] and sport.week.include? params[:week_] and sport.title.include? params[:title]
            unless sport.title.include? "趣味" or sport.status=="未开始"
              @sports << sport
            end
          end
        end
      end
    end
    @sports.sort_by!{|e| dic[e.week]*7+dic2[e.wday]}
  end




  private
  def sport_params
    params.require(:sport).permit(:title,:winner,:loser,:teamone,:teamtwo,:wp,:lp,:week,:wday,:status,:hour,:minute,:place,:interest)
  end
end
