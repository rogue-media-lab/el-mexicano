# Create admin user
admin = User.find_or_create_by!(email: "admin@elmexicano.com") do |u|
  u.password = "password123"
  u.password_confirmation = "password123"
end
puts "Admin user: #{admin.email}"

# Menu Categories
categories = {
  "Appetizers" => 1,
  "Nachos" => 2,
  "Salads" => 3,
  "Soups" => 4,
  "Chicken Especialidades" => 5,
  "Steak Especialidades" => 6,
  "Pork" => 7,
  "Fajitas" => 8,
  "Burritos" => 9,
  "Enchiladas" => 10,
  "Combos" => 11,
  "Desserts" => 12,
  "Drinks" => 13
}

cat_records = {}
categories.each do |name, sort_order|
  cat_records[name] = MenuCategory.find_or_create_by!(name: name) do |c|
    c.sort_order = sort_order
    c.active = true
  end
end
puts "Menu categories: #{MenuCategory.count}"

# Appetizers
appetizers = [
  { name: "Chori Dip", description: "Mexican sausage blended with melted cheese dip.", price: 8.25 },
  { name: "Bean Dip", description: "Creamy refried beans topped with melted cheese.", price: 5.25 },
  { name: "Guacamole Dip", description: "Fresh-made guacamole with tomatoes, onions, and cilantro.", price: 5.25 },
  { name: "Cheese Quesadillas (2)", description: "Two grilled flour tortillas filled with melted cheese.", price: 5.50 },
  { name: "Quesadillas (2)", description: "Choice of beef, chicken, mushroom, or spinach.", price: 8.25 },
  { name: "Grilled Chicken Quesadillas (2)", description: "Two quesadillas stuffed with grilled chicken and melted cheese.", price: 10.00 },
  { name: "Shrimp Quesadillas (2)", description: "Two quesadillas with shrimp and grilled vegetables.", price: 11.25 },
  { name: "Chicken Wings (10pc)", description: "Ten crispy wings served with hot sauce.", price: 9.99 }
]

appetizers.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Appetizers"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.active = true
  end
end

# Nachos
nachos = [
  { name: "Cheese Nachos", description: "Crispy tortilla chips topped with melted cheese.", price: 4.75 },
  { name: "Bean Nachos", description: "Tortilla chips with refried beans and melted cheese.", price: 7.75 },
  { name: "Beef Nachos", description: "Tortilla chips with seasoned ground beef and cheese.", price: 8.00 },
  { name: "Fajita Nachos", description: "Tortilla chips with grilled steak, peppers, onions, and cheese.", price: 12.75 },
  { name: "Fajita Camarón Nachos", description: "Tortilla chips with grilled shrimp, peppers, onions, and cheese.", price: 14.99 },
  { name: "Beef & Bean Nachos", description: "Tortilla chips with beef, beans, and melted cheese.", price: 8.50 },
  { name: "Nachos Supreme", description: "Beef, lettuce, tomatoes, sour cream, and guacamole.", price: 9.25 },
  { name: "Nachos Plancha", description: "Grilled chicken, grated cheese, and cheese dip.", price: 12.25 },
  { name: "Chicken Nachos", description: "Tortilla chips with shredded chicken and melted cheese.", price: 8.00 }
]

nachos.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Nachos"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.active = true
  end
end

# Salads
salads = [
  { name: "Guacamole Salad", description: "Fresh guacamole on a bed of lettuce.", price: 1.00 },
  { name: "Tossed Salad", description: "Fresh greens with your choice of dressing.", price: 5.99 },
  { name: "Taco Salad", description: "Crispy flour tortilla with beef and beans, lettuce, tomatoes, cheese, sour cream, and guacamole.", price: 8.75 },
  { name: "Steak Salad", description: "Grilled steak over fresh greens.", price: 10.39 },
  { name: "Grilled Chicken Salad", description: "Grilled chicken breast over fresh greens.", price: 10.00 },
  { name: "Taco Salad with Shrimp", description: "Crispy tortilla bowl with grilled shrimp, lettuce, tomatoes, cheese, and sour cream.", price: 12.75 },
  { name: "Grilled Shrimp Salad", description: "Grilled shrimp over fresh greens with pico de gallo.", price: 12.75 }
]

salads.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Salads"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.active = true
  end
end

# Soups
soups = [
  { name: "Shrimp Soup", description: "Hearty Mexican soup with shrimp, vegetables, and rice.", price: 10.75 },
  { name: "Chicken Soup", description: "Traditional Mexican chicken soup with rice and vegetables.", price: 8.75 }
]

soups.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Soups"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.active = true
  end
end

# Chicken Especialidades
chicken = [
  { name: "Pollo Fundido", description: "Two flour tortillas deep-fried, stuffed with chicken and topped with shredded cheese, sour cream. Served with rice.", price: 12.25 },
  { name: "Pollo Loco", description: "Chicken breast served with Mexican rice, beans, and an avocado salad.", price: 11.99 },
  { name: "Pollo Con Crema", description: "Grilled chicken strips topped with creamy cheese sauce. Served with rice, beans, and tortillas.", price: 11.99 },
  { name: "Pollo Adobe", description: "Grilled chicken breast under fresh mushrooms and spinach, topped with nacho cheese sauce. Served with rice, beans, and three tortillas.", price: 12.25 },
  { name: "Mole Poblano", description: "Shredded chicken breast smothered in mole poblano sauce. Served with white rice, beans, and three tortillas.", price: 12.25 },
  { name: "Mole Ranchero", description: "Shredded chicken breast smothered in mole ranchero sauce. Served with Mexican rice, beans, and three tortillas.", price: 12.25 },
  { name: "Julie's Special", description: "Grilled chicken cooked with tomatoes, onions, green peppers, mushrooms, squash, and green onions over a bed of rice, drizzled in nacho cheese sauce.", price: 12.75 },
  { name: "Karina's Chicken", description: "Grilled chicken strips smothered in spicy chipotle sauce. Served with rice, lettuce, sour cream, pico de gallo, and three tortillas.", price: 12.25 },
  { name: "Yolandas", description: "Three chicken enchiladas topped with ranchero sauce, Mexican rice, and a guacamole salad.", price: 10.99 },
  { name: "David's Delight", description: "Grilled chicken strips on a bed of rice covered in nacho cheese sauce.", price: 12.75 },
  { name: "Chori Pollo", description: "Grilled chicken strips with Mexican sausage, topped with cheese sauce. Served with beans and a guacamole salad.", price: 12.29 },
  { name: "Enchiladas Poblanas", description: "Three chicken enchiladas covered with mole poblano sauce, topped with shredded cheese and fresh chopped onions. Served with white rice.", price: 10.50 }
]

chicken.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Chicken Especialidades"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.featured = ["Pollo Con Crema", "David's Delight", "Chori Pollo"].include?(item[:name])
    m.active = true
  end
end

# Steak Especialidades
steak = [
  { name: "Carne Asada", description: "Rib-eye slices served with Mexican rice, beans, and an avocado salad.", price: 14.99 },
  { name: "Steak Ranchero", description: "Rib-eye steak cooked in our special ranchero sauce. Served with Mexican rice, beans, and tortillas.", price: 14.99 },
  { name: "Steak a la Tampiqueña", description: "Rib-eye steak cooked with onions. Served with Mexican rice, beans, tortillas, and a guacamole salad.", price: 14.99 },
  { name: "El Mexicano Special", description: "Rib-eye steak cooked with green onions, mushrooms, squash, tomatoes, and bell peppers. Served with Mexican rice, beans, and tortillas.", price: 14.99 },
  { name: "Clover Steak", description: "Rib-eye steak served with French fries and California blend veggies.", price: 14.99 },
  { name: "Chile Colorado", description: "Steak strips topped with a spicy chipotle sauce. Served with rice and beans.", price: 12.99 },
  { name: "Cheese Steak Burrito", description: "A soft flour tortilla filled with sliced steak, grilled onions, and nacho cheese. Served with lettuce, tomato, and rice or beans.", price: 11.99 },
  { name: "Steak & Shrimp", description: "Rib-eye steak with grilled shrimp. Served with rice, beans, and three tortillas.", price: 16.99 },
  { name: "El Mexicano Hamburger Steak", description: "Hamburger patty cooked with steak sauce, mushrooms, and onions. Served with Mexican rice and California blend veggies.", price: 11.50 },
  { name: "Burritos Tipicos", description: "Two burritos filled with beef tips and topped with lettuce, sour cream, and tomatoes. Served with Mexican rice.", price: 11.99 },
  { name: "Super Chimichanga", description: "Two flour tortillas soft or deep fried, filled with beef tips, beans, and topped with nacho cheese. Garnished with sour cream salad.", price: 11.99 },
  { name: "Chimichanga", description: "One flour tortilla soft or deep fried, filled with beef tips, beans, and topped with nacho cheese. Garnished with sour cream salad.", price: 10.25 }
]

steak.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Steak Especialidades"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.featured = ["Carne Asada", "El Mexicano Special"].include?(item[:name])
    m.active = true
  end
end

# Pork
pork = [
  { name: "Burritos El Mexicano (2)", description: "Two flour tortillas stuffed with pork, cooked with tomatoes, onions, bell peppers, and enchilada sauce. Served with guacamole salad and nacho cheese.", price: 11.99 },
  { name: "Chuletas El Mexicano", description: "Three pork chops topped with a red tomatillo sauce. Served with rice and beans.", price: 12.99 },
  { name: "Burrito El Mexicano (1)", description: "A flour tortilla stuffed with pork, cooked with tomatoes, onions, bell peppers, and enchilada sauce. Served with Mexican rice.", price: 10.25 }
]

pork.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Pork"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.active = true
  end
end

# Fajitas (customer favorites!)
fajitas = [
  { name: "Fajitas El Mexicano", description: "Sizzling grilled steak, chicken, and shrimp with peppers, onions, and tomatoes. Served with rice, beans, and tortillas.", price: 16.99 },
  { name: "Beef and Chicken Fajitas", description: "Sizzling grilled steak and chicken with peppers and onions. Served with rice, beans, and tortillas.", price: 15.99 },
  { name: "Sizzling Fajitas", description: "Your choice of grilled steak or chicken with peppers, onions, and tomatoes. Served with rice, beans, and tortillas.", price: 14.99 },
  { name: "Shrimp Fajitas", description: "Sizzling grilled shrimp with peppers, onions, and tomatoes. Served with rice, beans, and tortillas.", price: 17.99 },
  { name: "Fajita El Mexico", description: "Grilled steak with peppers, onions, and tomatoes on a sizzling plate. Served with rice, beans, and tortillas.", price: 15.99 },
  { name: "Hawaiian Fajita Quesadilla", description: "Grilled chicken and pineapple in a large quesadilla with cheese, peppers, and onions.", price: 13.99 }
]

fajitas.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Fajitas"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.featured = true
    m.active = true
  end
end

# Burritos
burritos = [
  { name: "Burrito Teriyaki", description: "10-inch tortilla filled with sweet chicken and white rice, topped with homemade teriyaki sauce and sesame seeds.", price: 9.50 },
  { name: "Carnitas Plate", description: "Slow-cooked pulled pork with rice, beans, guacamole salad, and tortillas.", price: 13.99 },
  { name: "Tacos de Asada", description: "Three grilled steak tacos with cilantro, onions, and salsa verde.", price: 12.99 }
]

burritos.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Burritos"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.featured = ["Tacos de Asada", "Carnitas Plate"].include?(item[:name])
    m.active = true
  end
end

# Enchiladas
enchiladas = [
  { name: "Enchiladas Rancheras", description: "Two cheese enchiladas topped with ranchero sauce, served with rice and beans.", price: 10.25 },
  { name: "Enchiladas Suizas", description: "Three chicken enchiladas topped with creamy green tomatillo sauce and melted cheese.", price: 11.25 }
]

enchiladas.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Enchiladas"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.active = true
  end
end

# Combos
combos = [
  { name: "Make Your Own Combo", description: "Choose any two items served with rice and beans.", price: 11.99 }
]

combos.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Combos"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.active = true
  end
end

# Desserts
desserts = [
  { name: "Fried Ice Cream", description: "Crispy coated vanilla ice cream drizzled with honey and whipped cream.", price: 5.99 },
  { name: "Flan", description: "Classic Mexican caramel custard — creamy and smooth.", price: 4.99 },
  { name: "Sopapillas", description: "Fried pastry pillows drizzled with honey and cinnamon.", price: 4.50 },
  { name: "Churros", description: "Crispy fried dough sticks rolled in cinnamon sugar.", price: 4.99 }
]

desserts.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Desserts"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.active = true
  end
end

# Drinks
drinks = [
  { name: "Coke", description: "", price: 2.49 },
  { name: "Sprite", description: "", price: 2.49 },
  { name: "Dr. Pepper", description: "", price: 2.49 },
  { name: "Iced Tea", description: "", price: 2.49 },
  { name: "Horchata", description: "Traditional Mexican rice drink with cinnamon.", price: 3.49 },
  { name: "Jarritos Mandarin", description: "Mexican soda — mandarin flavor.", price: 2.99 },
  { name: "Jarritos Tamarind", description: "Mexican soda — tamarind flavor.", price: 2.99 },
  { name: "Margarita", description: "House margarita — frozen or on the rocks.", price: 6.99 },
  { name: "Michelada", description: "Mexican beer cocktail with lime, salt, and spices.", price: 7.99 }
]

drinks.each do |item|
  MenuItem.find_or_create_by!(name: item[:name], menu_category: cat_records["Drinks"]) do |m|
    m.description = item[:description]
    m.price = item[:price]
    m.active = true
  end
end

puts "Menu items: #{MenuItem.count}"

# Hours — El Mexicano actual hours
hours_data = [
  { day_of_week: 0, open_time: "11:00", close_time: "22:00", closed: false },  # Sunday
  { day_of_week: 1, open_time: "11:00", close_time: "22:00", closed: false },  # Monday
  { day_of_week: 2, open_time: "11:00", close_time: "22:00", closed: false },  # Tuesday
  { day_of_week: 3, open_time: "11:00", close_time: "22:00", closed: false },  # Wednesday
  { day_of_week: 4, open_time: "11:00", close_time: "22:00", closed: false },  # Thursday
  { day_of_week: 5, open_time: "11:00", close_time: "22:30", closed: false },  # Friday
  { day_of_week: 6, open_time: "11:00", close_time: "22:30", closed: false }   # Saturday
]

hours_data.each do |h|
  Hour.find_or_create_by!(day_of_week: h[:day_of_week]) do |hour|
    hour.open_time = h[:open_time]
    hour.close_time = h[:close_time]
    hour.closed = h[:closed]
  end
end
puts "Hours: #{Hour.count}"

# Testimonials (from real reviews)
testimonials = [
  { customer_name: "K R.", quote: "We have been here a couple times. It's one of our new favorites! The service is quick and friendly. The margaritas are one of the best we have had. The cheese dip is excellent and food portions are large, even the lunch menu items. Great value for the price.", stars: 5, featured: true },
  { customer_name: "Babita", quote: "Stopped by for a quick lunch. They greeted us and let us sit. We got our free chips and salsa — hot and mild, both were delicious. Ordered our seafood and the food came pretty quick. They made sure to check on us frequently.", stars: 5, featured: true },
  { customer_name: "Christopher C.", quote: "The service and atmosphere is great and the food tastes pretty good. A solid neighborhood Mexican restaurant with friendly staff and reasonable prices.", stars: 4, featured: true },
  { customer_name: "Local Family", quote: "El Mexicano is kid-friendly, wheelchair accessible, and the staff is wonderful. The portions are generous and the prices can't be beat. We come here every week.", stars: 5, featured: false },
  { customer_name: "Regular Customer", quote: "Pollo con crema and David's delight are great choices. The Michelada is the best I've ever had. Clean restrooms and plenty of parking. Highly recommend!", stars: 5, featured: false }
]

testimonials.each do |t|
  Testimonial.find_or_create_by!(customer_name: t[:customer_name]) do |test|
    test.quote = t[:quote]
    test.stars = t[:stars]
    test.featured = t[:featured]
    test.active = true
  end
end
puts "Testimonials: #{Testimonial.count}"

# Site Settings
settings = {
  "hero_heading" => "Authentic Mexican Flavors, Made With Heart",
  "hero_subheading" => "Sizzling fajitas. Crispy golden tacos. Hand-rolled burritos with the perfect salsa. Generous portions, warm smiles, and bold flavors that keep you coming back.",
  "about_heading" => "A Family Place in the Heart of Clover",
  "about_body" => "El Mexicano is a family-owned gem on North Main Street in Clover — a place where generous portions, warm smiles, and authentic Mexican cooking come together. From our sizzling fajitas and handmade tacos to cheesy enchiladas and fresh guacamole, every dish is made with the same care we'd put on our own family table.",
  "address" => "401 N Main St, Clover, SC 29710",
  "phone" => "(803) 222-1838",
  "email" => "admin@elmexicano.com"
}

settings.each do |key, value|
  SiteSetting.set(key, value)
end
puts "Site settings: #{SiteSetting.count}"

puts "\nSeed complete! #{MenuItem.count} menu items across #{MenuCategory.count} categories."
