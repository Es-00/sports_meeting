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
  end

  def interesting
    if params[:category]
      @sports=[]
      @sports+=Sport.where("title=?","趣味项目:"+params[:category])
      @sports.sort_by! {|x| x.wp}
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
    dic={"第一周"=>1,"第二周"=>2,"第三周"=>3,"第四周"=>4}
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
