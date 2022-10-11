class StaticPagesController < ApplicationController
  def home
    if logged_in?
      # @products = Product.paginate(page: params[:page], per_page:12)
      @test_products = [
        Product.all[0],
        Product.all[1],
        Product.all[2],
        Product.all[5],
        Product.all[8],
        Product.all[9],
        Product.all[14],
        Product.all[15],
        Product.all[17],
        Product.all[19],
        Product.all[23],
        Product.all[24]
      ]
      # Product.find(1,2,3,6,9,10,15,16,18,20,24,25)
    end
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
