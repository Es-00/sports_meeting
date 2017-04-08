class Form < ApplicationRecord

  def size
    for i in (1..5)
      if eval("self.col"+i.to_s).empty?
        return i-1
      end
    end
    return 5
  end

end
