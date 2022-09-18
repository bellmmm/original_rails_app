class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @products = Product.paginate(page: params[:page], per_page:12)
    end
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
