module FoodPhotos
  # Map menu item names to static image filenames in app/assets/images/
  # Drop photo files in app/assets/images/ and add entries here.
  # Featured items show photos on homepage cards; menu page stays text-only.
  PHOTOS = {
    # "Pollo Con Crema" => "pollo-con-crema.webp",
    # "Carne Asada" => "carne-asada.webp",
    # "Fajitas El Mexicano" => "fajitas.webp",
    # "Tacos de Asada" => "tacos-asada.webp",
    # "David's Delight" => "davids-delight.webp",
    # "Fried Ice Cream" => "fried-ice-cream.webp",
  }.freeze

  def self.for(item_name)
    PHOTOS[item_name]
  end
end
