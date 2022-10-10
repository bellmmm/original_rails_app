class User < ApplicationRecord
  has_many :dislikes, dependent: :destroy
  has_many :dislike_products, through: :dislikes, source: :product
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  validates :name, presence: true, length:{maximum:50}, if: :require_validation?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:true, length:{maximum:255}, 
             format:{with: VALID_EMAIL_REGEX},
             uniqueness: {case_sensitive: false},
             if: :require_validation?
  has_secure_password
  validates :password, presence:true, length:{minimum:6}, allow_nil: true
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest=send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  

  def forget
    update_attribute(:remember_digest, nil)
  end

  # アカウントを有効にする
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

   # パスワード再設定の属性を設定する
   def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  # パスワード再設定のメールを送信する
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # パスワード再設定の期限が切れている場合はtrueを返す
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # 商品をdislikeに設定する
  def set_dislike(product)
    dislike_products << product
  end

  # 商品をdislikeから解除する
  def unset_dislike(product)
    dislikes.find_by(product_id: product.id).destroy
  end

  # 現在のユーザーがdislikeに設定していたらtrueを返す
  def setting_dislike?(product)
    dislike_products.include?(product)
  end

  # ゲストユーザーのemailをid番号に変える
  def guest_email_make_unique
    update_attribute(:email, "#{self.id}@example.com")
  end

  private

    # メールアドレスをすべて小文字にする
    def downcase_email
      email.downcase!
    end

    # 有効化トークンとダイジェストを作成および代入する
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

    #ゲストユーザーのみバリデーションを解除する(falseを返す)
    def require_validation?
      return true if self.guest == false || self.guest == 0
      false
    end

    # ゲストユーザーを作成する
    def self.guest_login
      random_pass = SecureRandom.base36
      guest_user = create!(name:"Guest user",
              email: "#{random_pass}@example.com",
              password: random_pass,
              password_confirmation: random_pass,
              activated: true,
              activated_at: Time.zone.now,
              guest: true)
      guest_user.guest_email_make_unique
      return guest_user
    end  
end
