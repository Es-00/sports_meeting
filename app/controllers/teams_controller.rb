class TeamsController < ApplicationController
  # def index
  #   @teams=[]
  #   @team=[]
  #   @team+=Team.all
  #   @groups=["A","B","C","D"]
  #   @groups.each do |tp|
  #     @temp=[]
  #     @team.each do |t|
  #       if t.group==tp
  #         @temp<<t
  #       end
  #     end
  #     @temp.sort_by!{|e| -(e.points.to_i)}
  #     @teams+=@temp
  #   end
  # end
  def import_form
    Team.import(params[:form],params[:form_name])
    redirect_to :root,notice: "表格信息成功导入！"
  end

  def board
    #test
    if params[:category]
      @category=Category.find_by_name(params[:category])
      @sort_teams=@category.teams.sort do |a,b|
        [a.group, (-1)*a.points.to_i] <=> [b.group, (-1)*b.points.to_i]
      end
    end
    if params[:compete]
      dic={"advance"=>"强","final"=>"决","groups"=>""}
      dic2={"advance"=>"晋级赛表单","groups"=>"小组赛表单","final"=>"决赛表单"}
      @category=Category.find_by_name(params[:category])
      if @category.name!="羽毛球"
        @teams=[]
        @category.teams.each do |t|
          if t.name.include? dic[params[:compete]]
            @teams<<t
          end
        end
        @type="normal"
        @sort_teams=@teams.sort do |a,b|
          [a.group, (-1)*a.points.to_i] <=> [b.group, (-1)*b.points.to_i]
        end
      end
      if @category.name=="羽毛球"
        @form=Form.where("name=?", dic2[params[:compete]]).last
        @type="badminton"
        @form_name=dic2[params[:compete]]
        @action=params[:compete]
      end
      respond_to do |f|
        f.js
      end
    end
  end

  def update_board
    if current_user
      if params[:category]
        for team_id in params[:category][:team].keys
          the_team=params[:category][:team][team_id]
          Team.find_by_id(team_id).update(points:the_team[:points].to_i,group:the_team[:group])
        end
        redirect_to :root
      end
    end
  end
  #
  # def show
  #   @team=Team.find(params[:id])
  # end
  #
  # def edit
  #   @team=Team.find(params[:id])
  # end
  #
  # def update
  #   @team=Team.find(params[:id])
  #
  #   if @team.update(team_params)
  #     redirect_to @team
  #   else
  #     render 'edit'
  #   end
  # end
  #
  def destroy
     @team=Team.find(params[:id])
     #解除所有关联
     @team.sports.each do |s|
       s.teams.delete(@team)
     end
     @team.category.teams.delete(@team)
     #Now Suicide
     @team.destroy
     redirect_to :root
  end

  private
  def team_params
    params.require(:team).permit(:name,:points,:group)
    params.require(:category).permit(:name,:teams)
  end
end
