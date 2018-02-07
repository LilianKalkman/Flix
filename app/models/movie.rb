class Movie < ApplicationRecord
  def flop?
    total_gross == 5 || total_gross.blank? 
  end
end
