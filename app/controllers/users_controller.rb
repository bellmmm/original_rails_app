class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only:  :destroy
  
  # def index
  #   @users = User.where(activated: true).paginate(page: params[:page])
  # end
  
  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated && @user=current_user
    dislike_feat_sql = <<-"EOS"
      SELECT 
        count(products.id) as product_id_num,
        features.id as feature_id,
        features.feature as feature
      FROM products 
        INNER JOIN dislikes 
          ON products.id=dislikes.product_id 
        INNER JOIN users 
          ON dislikes.user_id=users.id
        INNER JOIN composeds
          ON products.id=composeds.product_id
        INNER JOIN features
          ON composeds.feature_id=features.id
      WHERE users.id=#{@user.id}
      GROUP BY features.id
      HAVING product_id_num >= 2
    EOS
    @dislike_features = Feature.find_by_sql(dislike_feat_sql)

    like_product_sql = <<-"EOS"
      select products.* from products
      where products.id not in(
        select composeds.product_id from composeds
        inner join(    
          select 
            features.id as feature_id
          from products 
          inner join dislikes 
            on products.id=dislikes.product_id 
          inner join users 
            on dislikes.user_id=users.id
          inner join composeds
            on products.id=composeds.product_id
          inner join features
            on composeds.feature_id=features.id
          where users.id=#{@user.id}
          group by features.id
          having count(products.id) >=2
        ) as FT
        on composeds.feature_id=FT.feature_id
      )
    EOS
    @recommend_products = Product.paginate_by_sql(like_product_sql, page: params[:page], per_page:12)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else 
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def guest_login
    if current_user
      redirect_to current_user, alert: "You have already logged in."
    else
      @user = User.guest_login
      log_in(@user)
      redirect_to root_url
      flash[:success] = "Successfylly logged in as Guest user."
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
  # beforeアクション


    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
     redirect_to(root_url) unless current_user.admin?
    end

    def create_activation_digest
      # 有効化トークンとダイジェストを作成および代入する
    end
end
