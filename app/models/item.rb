class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  

  def self.available_items
    select { |i| i.inventory > 0 }
  end

end
