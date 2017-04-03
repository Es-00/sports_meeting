class TeamsController < ApplicationController

  def index
    @teams=[]
    @team=[]
    @team+=Team.all
    @groups=["A","B","C","D"]
    @groups.each do |tp|
      @temp=[]
      @team.each do |t|
        if t.group==tp
          @temp<<t
        end
      end
      @temp.sort_by!{|e| -(e.points.to_i)}
      @teams+=@temp
    end
  end

  def board
    #test
    if params[:category]
      @category=Category.find_by_name(params[:category])
    end
  end

  def update_board
    if params[:category]
      for team_id in params[:category][:team].keys
        Team.find_by_id(team_id).update(points:params[:category][:team][team_id][:points].to_i)
      end
      redirect_to :root
    end
  end

  def show
    @team=Team.find(params[:id])

  end

  def edit
    @team=Team.find(params[:id])
  end

  def update
    @team=Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team=Team.find(params[:id])
    @team.destroy
    redirect_to @team
  end

  private
  def team_params
    params.require(:team).permit(:name,:points,:group)
    params.require(:category).permit(:name,:teams)
  end
end
