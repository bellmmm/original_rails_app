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

# プロダクトを生成する
Product.create!(name:"Sample_product01")

# プロダクトをまとめて生成する
98.times do |n|
  if n < 8
    name  = "Sample_product0#{n+2}"
    Product.create!(name:  name)
  else
    name  = "Sample_product#{n+2}"
    Product.create!(name:  name)
  end
end
#プロダクトのphotofrapher情報を追加する
# Avelino Calvar Martinez(Sample_product16,17,18,21)
product16=Product.find_by(name: "Sample_product16")
product16.update_attribute(:photo_by, "Avelino Calvar Martinez")
product17=Product.find_by(name: "Sample_product17")
product17.update_attribute(:photo_by, "Avelino Calvar Martinez")
product18=Product.find_by(name: "Sample_product18")
product18.update_attribute(:photo_by, "Avelino Calvar Martinez")
product21=Product.find_by(name: "Sample_product21")
product21.update_attribute(:photo_by, "Avelino Calvar Martinez")
# Farah(Sample_product20,24)
product20=Product.find_by(name: "Sample_product20")
product20.update_attribute(:photo_by, "Farah")
product24=Product.find_by(name: "Sample_product24")
product24.update_attribute(:photo_by, "Farah")
# Jeremy Marasigan(Sample_product15,22)
product15=Product.find_by(name: "Sample_product15")
product15.update_attribute(:photo_by, "Jeremy Marasigan")
product22=Product.find_by(name: "Sample_product22")
product22.update_attribute(:photo_by, "Jeremy Marasigan")
# Matthew Henry(Sample_product12,25)
product12=Product.find_by(name: "Sample_product12")
product12.update_attribute(:photo_by, "Matthew Henry")
product25=Product.find_by(name: "Sample_product25")
product25.update_attribute(:photo_by, "Matthew Henry")
# Nicole De Khors(Sample_product14)
product14=Product.find_by(name: "Sample_product14")
product14.update_attribute(:photo_by, "Nicole De Khors")
# Samantha Hurley(Sample_product04,26)
product04=Product.find_by(name: "Sample_product04")
product04.update_attribute(:photo_by, "Samantha Hurley")
product26=Product.find_by(name: "Sample_product26")
product26.update_attribute(:photo_by, "Samantha Hurley")
# Sarah Pflug(Sample_product01,05,06,08,09,10,11,13,23)
product01=Product.find_by(name: "Sample_product01")
product01.update_attribute(:photo_by, "Sarah Pflug")
product05=Product.find_by(name: "Sample_product05")
product05.update_attribute(:photo_by, "Sarah Pflug")
product06=Product.find_by(name: "Sample_product06")
product06.update_attribute(:photo_by, "Sarah Pflug")
product08=Product.find_by(name: "Sample_product08")
product08.update_attribute(:photo_by, "Sarah Pflug")
product09=Product.find_by(name: "Sample_product09")
product09.update_attribute(:photo_by, "Sarah Pflug")
product10=Product.find_by(name: "Sample_product10")
product10.update_attribute(:photo_by, "Sarah Pflug")
product11=Product.find_by(name: "Sample_product11")
product11.update_attribute(:photo_by, "Sarah Pflug")
product13=Product.find_by(name: "Sample_product13")
product13.update_attribute(:photo_by, "Sarah Pflug")
product23=Product.find_by(name: "Sample_product23")
product23.update_attribute(:photo_by, "Sarah Pflug")
# Shopify Partners(Sample_product03,07,19)
product03=Product.find_by(name: "Sample_product03")
product03.update_attribute(:photo_by, "Shopify Partners")
product07=Product.find_by(name: "Sample_product07")
product07.update_attribute(:photo_by, "Shopify Partners")
product19=Product.find_by(name: "Sample_product19")
product19.update_attribute(:photo_by, "Shopify Partners")
# Thom Bradley(Sample_product02)
product02=Product.find_by(name: "Sample_product02")
product02.update_attribute(:photo_by, "Thom Bradley")



# 以下のdislike関係を作成する
user = User.second
other_user = User.third
products = Product.all
some_products = products[0..10]
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
Feature.create!(feature:  "high-neck")
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
# product_1 = Product.first
# product_2 = Product.second
# product_3 = Product.third
# product_4 = Product.fourth
# features = Feature.all
# some_features = features[0..15]
# other_features = features[4..10]
# another_features = features[8..15]
# last_features = features[1..18]
# some_features.each { |feature| product_1.set_composed(feature)}
# other_features.each { |feature| product_2.set_composed(feature) }
# another_features.each { |feature| product_3.set_composed(feature) }
# last_features.each { |feature| product_4.set_composed(feature) }

# product01.set_composed(Feature.find(1))
# product01.set_composed(Feature.find(7))
product01.set_composed(Feature.find(16))
# product01.set_composed(Feature.find(19))

# product02.set_composed(Feature.find(2))
# product02.set_composed(Feature.find(7))
product02.set_composed(Feature.find(12))
# product02.set_composed(Feature.find(18))

product03.set_composed(Feature.find(3))
# product03.set_composed(Feature.find(7))
product03.set_composed(Feature.find(11))
product03.set_composed(Feature.find(17))

# product04.set_composed(Feature.find(2))
# product04.set_composed(Feature.find(7))
product04.set_composed(Feature.find(12))
# product04.set_composed(Feature.find(18))

# product05.set_composed(Feature.find(2))
# product05.set_composed(Feature.find(4))
product05.set_composed(Feature.find(12))
# product05.set_composed(Feature.find(18))

# product06.set_composed(Feature.find(2))
# product06.set_composed(Feature.find(4))
product06.set_composed(Feature.find(9))
# product06.set_composed(Feature.find(19))

# product07.set_composed(Feature.find(2))
# product07.set_composed(Feature.find(5))
product07.set_composed(Feature.find(12))
# product07.set_composed(Feature.find(18))

product08.set_composed(Feature.find(3))
# product08.set_composed(Feature.find(7))
product08.set_composed(Feature.find(12))
product08.set_composed(Feature.find(17))

# product09.set_composed(Feature.find(1))
# product09.set_composed(Feature.find(6))
product09.set_composed(Feature.find(12))
# product09.set_composed(Feature.find(19))

# product10.set_composed(Feature.find(1))
# product10.set_composed(Feature.find(6))
product10.set_composed(Feature.find(12))
product10.set_composed(Feature.find(17))

# product11.set_composed(Feature.find(2))
# product11.set_composed(Feature.find(5))
product11.set_composed(Feature.find(10))
product11.set_composed(Feature.find(17))

# product12.set_composed(Feature.find(2))
# product12.set_composed(Feature.find(4))
product12.set_composed(Feature.find(12))
# product12.set_composed(Feature.find(18))

# product13.set_composed(Feature.find(2))
# product13.set_composed(Feature.find(7))
product13.set_composed(Feature.find(10))
product13.set_composed(Feature.find(17))

product14.set_composed(Feature.find(3))
# product14.set_composed(Feature.find(7))
product14.set_composed(Feature.find(10))
product14.set_composed(Feature.find(17))

# product15.set_composed(Feature.find(1))
# product15.set_composed(Feature.find(7))
product15.set_composed(Feature.find(13))
# product15.set_composed(Feature.find(19))

# product16.set_composed(Feature.find(1))
# product16.set_composed(Feature.find(6))
product16.set_composed(Feature.find(13))
# product16.set_composed(Feature.find(18))

# product17.set_composed(Feature.find(2))
# product17.set_composed(Feature.find(7))
product17.set_composed(Feature.find(9))
product17.set_composed(Feature.find(17))

# product18.set_composed(Feature.find(2))
# product18.set_composed(Feature.find(5))
product18.set_composed(Feature.find(9))
product18.set_composed(Feature.find(17))

# product19.set_composed(Feature.find(2))
# product19.set_composed(Feature.find(4))
product19.set_composed(Feature.find(9))
# product19.set_composed(Feature.find(19))

product20.set_composed(Feature.find(3))
# product20.set_composed(Feature.find(7))
product20.set_composed(Feature.find(13))
# product20.set_composed(Feature.find(18))

# product21.set_composed(Feature.find(1))
# product21.set_composed(Feature.find(7))
product21.set_composed(Feature.find(8))
# product21.set_composed(Feature.find(18))

product22.set_composed(Feature.find(3))
# product22.set_composed(Feature.find(7))
product22.set_composed(Feature.find(11))
product22.set_composed(Feature.find(17))

# product23.set_composed(Feature.find(1))
# product23.set_composed(Feature.find(7))
product23.set_composed(Feature.find(16))
# product23.set_composed(Feature.find(19))

# product24.set_composed(Feature.find(1))
# product24.set_composed(Feature.find(7))
product24.set_composed(Feature.find(16))
# product24.set_composed(Feature.find(18))

product25.set_composed(Feature.find(3))
# product25.set_composed(Feature.find(7))
product25.set_composed(Feature.find(15))
# product25.set_composed(Feature.find(18))

product26.set_composed(Feature.find(3))
# product26.set_composed(Feature.find(4))
product26.set_composed(Feature.find(15))
product26.set_composed(Feature.find(17))
product26.set_composed(Feature.find(10))
