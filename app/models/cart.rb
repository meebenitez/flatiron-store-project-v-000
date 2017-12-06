class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def total
    self.line_items.each.sum do |line_item|
      line_item.item.price * line_item.quantity
    end
  end

  def add_item(item_id)
    if line_item = self.line_items.find_by(item_id: item_id)
      line_item.quantity += 1
    else
      line_item = self.line_items.new(item_id: item_id)
    end
    line_item
  end


  

  



end
