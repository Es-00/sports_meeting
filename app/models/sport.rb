class Sport < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :teams

  validates :teamone,:status,:title,presence: true
  #validates :teamone,numericality: { only_integer: true }
  #validates :teamone,:teamtwo, length:{maximum:2}
  validates :wp,:lp, length:{maximum:30}
  #validates :hour,:minute, numericality:{greater_than_or_equal_to: 0}

  def self.check()
    Sport.all.each do |sport|
      @category=Category.find_by_name(sport.title)||Category.create(name:sport.title)
      sport.category=@category
      teams=[]
      if sport.teamtwo ==""
        sport.teamtwo=nil
      end
      teams<<sport.teamone<<sport.teamtwo
      for team in teams.compact
        @team=Team.where(name:team,category:@category).last||@category.teams.create({name:team,points:0,group:""})
        sport.teams<<@team
      end
      sport.save
    end
  end

end
