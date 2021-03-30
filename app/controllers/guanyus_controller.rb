class GuanyusController < ApplicationController

  def show
    @guanyu = Guanyu.find(params[:id])
  end


  def index
    @guanyus = Guanyu.all
  end
end
