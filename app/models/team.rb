class Team < ApplicationRecord
  has_and_belongs_to_many :sports
  belongs_to :category

  validates :name,presence:true
  validates :points,numericality: { only_integer: true }

  def self.import(form,name)
    @form=Form.find_by_name(name)||Form.new(name:name)
    for i in (1..5)
      eval("@form.col"+i.to_s+"=''")
    end
    CSV.foreach(form.path) do |row|
      size=row.length
      #支持一行非空一行空
      for i in (0..size-1)
        if row[i]== nil
          row[i]=@former[i]
        end
      end

      for i in (0..size-1)
        eval("@form.col"+(i+1).to_s+"<<(row[i]+'End')")
      end
      @former=row
    end
    @form.save
  end

end
