Admin.destroy_all
Seller.destroy_all
Customer.destroy_all
CarBrand.destroy_all
CarModel.destroy_all
CarPart.destroy_all
PartType.destroy_all

descriptions = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida massa quis ultricies scelerisque. Donec luctus ipsum eget quam tempus, nec blandit neque consectetur. Etiam ultrices velit eget enim viverra efficitur. Fusce mollis, lorem nec ornare pulvinar, sapien dolor semper massa, sit amet gravida nulla tellus volutpat dolor. Mauris iaculis ligula a finibus ullamcorper. Aenean sit amet nulla velit. Aliquam ut purus tempor, tempor felis sed, tempor ipsum.",
  "Donec mattis mattis porttitor. Ut auctor ultricies massa, ut commodo ipsum feugiat vitae. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas interdum, ex ac luctus varius, tellus augue suscipit metus, eu finibus metus turpis sed quam. Suspendisse ac eros in ex tristique iaculis quis eget lacus. Nunc et nibh ipsum. Pellentesque lacinia dui eget blandit ullamcorper. Nam in ex lacinia, pellentesque neque non, vehicula augue. Fusce semper elementum lacus vitae euismod. Sed placerat velit eu tortor faucibus fringilla. Aliquam auctor, nisi vel ultrices blandit, nunc arcu dapibus eros, quis lacinia ligula dui a est. In quis lacinia eros.",
  "Donec fermentum eros a nunc interdum, vitae sagittis eros interdum. Etiam dignissim elit lacus, blandit euismod sapien laoreet sit amet. Cras semper elit in diam laoreet, iaculis molestie odio gravida. Aenean maximus gravida lorem, a hendrerit diam sodales non. Phasellus purus leo, vulputate in tortor in, commodo sollicitudin libero. Pellentesque facilisis est ligula. In hac habitasse platea dictumst. Mauris eleifend vel turpis non gravida. Nam facilisis dui in velit sollicitudin iaculis. Etiam ultrices tristique sapien, ac tincidunt libero mollis nec.",
  "Donec eu gravida sem, et gravida diam. Sed vulputate pretium ipsum nec mollis. Ut tristique turpis sed purus commodo porttitor. Proin vestibulum finibus hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed aliquet ac metus et consequat. Phasellus ornare erat ut lectus lobortis, ac aliquet ante ullamcorper. Mauris leo sapien, pretium ac ante et, dapibus mattis massa. Quisque non ornare mi, ac efficitur tortor. Suspendisse enim libero, sollicitudin et laoreet eget, tincidunt nec neque. Nam vulputate aliquam diam consequat dignissim. Suspendisse euismod ultricies ante vel venenatis. Nulla a purus eget lorem bibendum euismod.",
  "Quisque pretium, arcu et suscipit pulvinar, sapien orci tristique ipsum, sit amet varius ante neque sed risus. In feugiat maximus eros eget tincidunt. Sed faucibus, justo at lobortis varius, ex felis auctor elit, quis tempus libero diam sit amet nulla. Cras sit amet ex vel mi sollicitudin condimentum. Fusce dolor metus, tempor sed ipsum sit amet, dapibus elementum augue. Aliquam vitae viverra dolor. Morbi congue sit amet purus vitae feugiat. Vestibulum ullamcorper lobortis ipsum at placerat." ]

part_names = [
  "Bosch Platinum Spark Plug (4417)",
  "ACDelco Professional Brake Pad Set (17D1367ACH)",
  "Mishimoto Performance Aluminum Radiator (MMRAD-CAMARO-10)",
  "Optima RedTop Battery (34/78)",
  "Denso Iridium Power Spark Plug (IK16)",
  "K&N High-Flow Air Filter (33-2304)",
  "MagnaFlow Performance Muffler (10416)",
  "Gates Micro-V Serpentine Belt (K060841)",
  "Bilstein B6 Performance Shock Absorber (24-186728)",
  "NGK Laser Iridium Spark Plug (BKR6EIX-11)" ]

model_names = [ "Corolla", "Mustang", "Civic", "Camaro", "SA", "3 Series", "C-Class", "Sonata", "Golf", "Wrangler" ]

brands_names = [ "Toyota", "Honda", "Ford", "BMW", "Tesla", "Chevrolet", "Mercedes-Benz", "Hyundai", "Volkswagen", "Jeep" ]

type_names = [ "Engine", "Transmission", "Alternator", "Brake Pads", "Radiator", "Fuel Injector", "Catalytic Converter", "Suspension Struts", "Battery", "Exhaust Muffler" ]

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
brands_names.each do |name|
  brands << CarBrand.create!(name: name)
end

models = []
brands.each_with_index do |brand, i|
  3.times do |j|
    models << CarModel.create!(
      name: model_names.sample,
      car_brand: brand
    )
  end
end

part_types = []
type_names.each do |name|
  part_types << PartType.create!(name: name)
end



models.each do |model|
  5.times do
    CarPart.create!(
      name: part_names.sample,
      description: "Description for #{model.car_brand.name} #{model.name} model. " + descriptions.sample,
      price: rand(50..400),
      quantity: rand(1..50),
      car_model: model,
      seller: sellers.sample,
      part_type: part_types.sample
    )
  end
end
