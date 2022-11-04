class StaticPagesController < ApplicationController
  def home
    if logged_in?
      # 商品の一部(id=1,2,3,6,9,10,15,16,18,20,24,25)をテスト用プロダクトとする
      # @products = Product.paginate(page: params[:page], per_page:12)
      all_products=Product.all
      @test_products = [
        all_products[0],
        all_products[1],
        all_products[2],
        all_products[5],
        all_products[8],
        all_products[9],
        all_products[14],
        all_products[15],
        all_products[17],
        all_products[19],
        all_products[23],
        all_products[24]
      ]
      # @test_products = [
      #   Product.all[0],
      #   Product.all[1],
      #   Product.all[2],
      #   Product.all[5],
      #   Product.all[8],
      #   Product.all[9],
      #   Product.all[14],
      #   Product.all[15],
      #   Product.all[17],
      #   Product.all[19],
      #   Product.all[23],
      #   Product.all[24]
      # ]
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
