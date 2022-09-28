# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

#メインのサンプルプロダクトを1つ作成する
Product.create!(name:  "Sample_product01")

# 追加のプロダクトをまとめて生成する
98.times do |n|
  if n < 8
    name  = "Sample_product0#{n+2}"
    Product.create!(name:  name)
  else
    name  = "Sample_product#{n+2}"
    Product.create!(name:  name)
  end
end

# 以下のdislike関係を作成する
user = User.second
other_user = User.third
products = Product.all
some_products = products[2..10]
other_products = products[11..20]
some_products.each { |some_products| user.set_dislike(some_products)}
other_products.each { |other_products| other_user.set_dislike(other_products) }

#以下のfeatureを作成する
Feature.create!(feature:  "long_sleeve")
Feature.create!(feature:  "short_sleeve")
Feature.create!(feature:  "no_sleeve")
Feature.create!(feature:  "vivid_color")
Feature.create!(feature:  "pale_color")
Feature.create!(feature:  "natural_color")
Feature.create!(feature:  "black/white_color")
Feature.create!(feature:  "boat-neck")
Feature.create!(feature:  "off-the-shoulder-neck")
Feature.create!(feature:  "deep-neck")
Feature.create!(feature:  "halter-neck")
Feature.create!(feature:  "jewel-neck")
Feature.create!(feature:  "turtle-neck")
Feature.create!(feature:  "square-neck")
Feature.create!(feature:  "v-neck")
Feature.create!(feature:  "collared-neck")
Feature.create!(feature:  "tight-fit")
Feature.create!(feature:  "medium-fit")
Feature.create!(feature:  "loose-fit")


# Feature.create!(feature:  "bohemian-style")
# Feature.create!(feature:  "romantic-style")
# Feature.create!(feature:  "modern-style")
# Feature.create!(feature:  "casual-style")
# Feature.create!(feature:  "classic-style")
# Feature.create!(feature:  "city-style")

# 以下のcomposed関係を作成する
product_1 = Product.first
product_2 = Product.second
features = Feature.all
some_features = features[0..5]
other_features = features[6..10]
some_features.each { |feature| product_1.set_composed(feature)}
other_features.each { |feature| product_2.set_composed(feature) }