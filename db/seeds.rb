products_list = {
  "Goddess" => {
    category: "Bath Bomb",
    oil: "Jasmine",
    benefit: "Soothing aphrodisiac"
  },
  "Madame Prez" => {
    category: "Bath Bomb",
    oil: "Grapefruit",
    benefit: "Refreshing"
  },
  "Grl Pwr" => {
    category: "Bubble Bar",
    oil: "Bergamot",
    benefit: "Uplifting"
  },
  "Pink Petitgrain" => {
    category: "Bubble Bar",
    oil: "Petitgrain",
    benefit: "Refreshing, sweet and uplifting"
  },
  "Rose Jam" => {
    category: "Bubble Bar",
    oil: "Rose",
    benefit: "Soothing and balancing"
  },
  "Tea and Sympathy" => {
    category: "Bath Bomb",
    oil: "Bergamot",
    benefit: "Uplifting"
  },
  "Rose Butterfly" => {
    category: "Bath Bomb",
    oil: "Rose",
    benefit: "Soothing and balancing"
  },
  "Sakura" => {
    category: "Bath Bomb",
    oil: "Mimosa Absolute",
    benefit: "Cleansing and calming"
  },
  "Sex Bomb" => {
    category: "Bath Bomb",
    oil: "Clary Sage",
    benefit: "Sensual, soothing and rich in antioxidants"
  },
  "Groovy In Love" => {
    category: "Bath Bomb",
    oil: "Rosewood",
    benefit: "Fragrant and uplifting"
  },
  "Intergalactic" => {
    category: "Bath Bomb",
    oil: "Peppermint",
    benefit: "Cooling and invigorating"
  },
  "Dragon's Egg" => {
    category: "Bath Bomb",
    oil: "Lemon",
    benefit: "Uplifting, refreshing and cleansing"
  },
  "Forever Blowing Bubbles" => {
    category: "Bubble Bar",
    oil: "Lemon",
    benefit: "Uplifting, refreshing and cleansing"
  },
  "Yellow Submarine" => {
    category: "Bath Bomb",
    oil: "Orange",
    benefit: "Uplifting and fragrant"
  },
  "Rocket Science" => {
    category: "Bath Bomb",
    oil: "Lemon",
    benefit: "Uplifting, refreshing and cleansing"
  }
}

products_list.each do |name, product_hash|
  p = Product.new
  p.name = name
  product_hash.each do |attribute, value|
    p[attribute] = value
  end
  p.save
end
