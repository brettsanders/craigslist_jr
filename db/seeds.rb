["Cars", "Guns", "Supplements", "KeyTars", "Other" ].each do |category|
  Category.create(name:"#{category}")
end

cars = Category.find(1)
cars.posts.create(title:"Sweet ass E30 for Sale",text:"This E30 is dope. Almost all original. S54 engine.",price:3000)
19.times do
  cars.posts.create(title:Faker::Lorem.sentence, text: Faker::Lorem.paragraph, price: rand(100..10000))
end

guns = Category.find(2)
guns.posts.create(title:"Barret MRAD with Nightforce",text:".5 MOA",price:11000)
19.times do
  guns.posts.create(title:Faker::Lorem.sentence, text: Faker::Lorem.paragraph, price: rand(100..1000))
end

supplements = Category.find(3)
supplements.posts.create(title:"5 Pallets of Nan Bread",text:"A fuckload of tasty bread",price:3000)
19.times do
  supplements.posts.create(title:Faker::Lorem.sentence, text: Faker::Lorem.paragraph, price: rand(1..100))
end


keytars = Category.find(4)
keytars.posts.create(title:"A dope keytar to shred on",text:"Can be played like Jimmi Hendrix but a little different",price:300)
19.times do
  keytars.posts.create(title:Faker::Lorem.sentence, text: Faker::Lorem.paragraph, price: rand(100..1000))
end


other = Category.find(5)
other.posts.create(title:"Box for air mattress",text:"Can fit some air mattresses.",price:50)
19.times do
  other.posts.create(title:Faker::Lorem.sentence, text: Faker::Lorem.paragraph, price: rand(1..1000))
end
