Admin.destroy_all
Seller.destroy_all
Customer.destroy_all
CarBrand.destroy_all
CarModel.destroy_all
CarPart.destroy_all
PartType.destroy_all

admins = []
3.times do |i|
  admins << Admin.create!(
    email: "admin#{i+1}@gmail.com",
    password: "password",
    password_confirmation: "password"
  )
end

customers = []
10.times do |i|
  customers << Customer.create!(
    email: "customer#{i+1}@gmail.com",
    password: "password",
    password_confirmation: "password"
  )
end

sellers = []
5.times do |i|
  sellers << Seller.create!(
    email: "seller#{i+1}@gmail.com",
    password: "password",
    password_confirmation: "password"
  )
end

brands = []
[ 'Toyota', 'Honda', 'Ford', 'BMW', 'Tesla' ].each do |name|
  brands << CarBrand.create!(name: name)
end

models = []
brands.each_with_index do |brand, i|
  3.times do |j|
    models << CarModel.create!(
      name: "#{brand.name} Model #{j + 1}",
      car_brand: brand
    )
  end
end

part_types = []
[ 'Engine', 'Brake', 'Suspension', 'Interior', 'Exterior' ].each do |name|
  part_types << PartType.create!(name: name)
end

models.each do |model|
  5.times do
    CarPart.create!(
      name: "Part for #{model.name}",
      description: "Description for #{model.name}",
      price: rand(100..1000),
      quantity: rand(1..50),
      car_model: model,
      seller: sellers.sample,
      part_type: part_types.sample
    )
  end
end
