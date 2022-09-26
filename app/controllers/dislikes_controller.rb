class DislikesController < ApplicationController
  before_action :logged_in_user

  def create
    @test_product = Product.find(params[:product_id])
    current_user.set_dislike(@test_product)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js 
    end
  end

  def destroy
    @test_product = Dislike.find(params[:id]).product
    current_user.unset_dislike(@test_product)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js 
    end
  end

end
