class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:show, :checkout]


  def show
  end

  def checkout
    #binding.pry
    if @current_cart 
      #binding.pry
      @current_cart.status = "submitted"
      @current_cart.line_items.each do |line_item|
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
    end
  
    redirect_to cart_path(@current_user.current_cart.id)
    @current_user.current_cart = nil
  end


  private

  def set_cart
    @current_cart = current_user.current_cart
  end

end
