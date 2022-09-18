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
