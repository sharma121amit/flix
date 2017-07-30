class Movie < ApplicationRecord
  def flop?
    total_gross.blank? || total_gross < 50000
  end
end
