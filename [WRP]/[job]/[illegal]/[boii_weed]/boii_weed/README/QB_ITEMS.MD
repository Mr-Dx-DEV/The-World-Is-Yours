# QB Inventory Item List

```lua
--- Guide Book
weed_guide_book = { name = "weed_guide_book", label = "Weed Guide", weight = 250, type = "item", image = "weed_guide_book.png", unique = false, useable = true, shouldClose = true, description = "The Cannabis Grow Guide, the only growing guide you need." },

--- Action Items
foliar_spray = { name = "foliar_spray", label = "Foliar Spray", weight = 250, type = "item", image = "foliar_spray.png", unique = false, useable = false, shouldClose = false, description = "Foliar spray, good for fighting off plant pests and diseases." },
hydrogen_peroxide = { name = "hydrogen_peroxide", label = "Hydrogen Peroxide", weight = 300, type = "item", image = "hydrogen_peroxide.png", unique = false, useable = false, shouldClose = false, description = "Hydrogen peroxide, useful for treating root rot and sterilizing soil." },
organic_fungicide = { name = "organic_fungicide", label = "Organic Fungicide", weight = 275, type = "item", image = "organic_fungicide.png", unique = false, useable = false, shouldClose = false, description = "Organic fungicide, effective against fungal infections like bud rot." },
neem_oil = { name = "neem_oil", label = "Neem Oil", weight = 200, type = "item", image = "neem_oil.png", unique = false, useable = false, shouldClose = false, description = "Neem oil, a natural pesticide that helps fight off fungus gnats and other pests." },
insecticidal_soap = { name = "insecticidal_soap", label = "Insecticidal Soap", weight = 250, type = "item", image = "insecticidal_soap.png", unique = false, useable = false, shouldClose = false, description = "Insecticidal soap, effective against soft-bodied pests like thrips." },

--- Processing
weed_processing_table = { name = "weed_processing_table", label = "Processing Table (Weed)", weight = 2500, type = "item", image = "weed_processing_table.png", unique = true, useable = true, shouldClose = true, description = "A pop up weed processing table." },

trimming_shears = { name = "trimming_shears", label = "Trimming Shears", weight = 250, type = "item", image = "trimming_shears.png", unique = false, useable = false, shouldClose = false, description = "A pair of plant trimming shears." },
small_resealable_bag = { name = "small_resealable_bag", label = "Resealable Bag (Small)", weight = 1, type = "item", image = "small_resealable_bag.png", unique = false, useable = false, shouldClose = false, description = "A small resealable mylar bag." },
large_resealable_bag = { name = "large_resealable_bag", label = "Resealable Bag (Large)", weight = 1, type = "item", image = "large_resealable_bag.png", unique = false, useable = false, shouldClose = false, description = "A small resealable mylar bag." },
rolling_paper = { name = "rolling_paper", label = "Rolling Paper", weight = 1, type = "item", image = "rolling_paper.png", unique = false, useable = false, shouldClose = false, description = "A pack of rolling papers." },
drug_grinder = { name = "drug_grinder", label = "Grinder", weight = 1, type = "item", image = "drug_grinder.png", unique = false, useable = false, shouldClose = false, description = "A high quality metal herb grinder." },
drug_scales = { name = "drug_scales", label = "Scales", weight = 1, type = "item", image = "drug_scales.png", unique = false, useable = false, shouldClose = false, description = "A set of electronic weighing scales." },

watering_can_empty = { name = "watering_can_empty", label = "Watering Can (Empty)", weight = 200, type = "item", image = "watering_can.png", unique = false, useable = true, shouldClose = true, description = "A empty watering can, fill it up at a body of water." },
watering_can_full = { name = "watering_can_full", label = "Watering Can (Full)", weight = 1500, type = "item", image = "watering_can.png", unique = false, useable = false, shouldClose = false, description = "A full watering can." },

liquid_fertilizer = { name = "liquid_fertilizer", label = "Liquid Fertilizer", weight = 500, type = "item", image = "liquid_fertilizer.png", unique = false, useable = false, shouldClose = false, description = "A bottle of liquid fertilizer." },
organic_fertilizer = { name = "organic_fertilizer", label = "Organic Fertilizer", weight = 500, type = "item", image = "organic_fertilizer.png", unique = false, useable = false, shouldClose = false, description = "A bag of organic fertilizer." },

--- Smoking
lighter = { name = "lighter", label = "Ligter", weight = 50, type = "item", image = "lighter.png", unique = false, useable = false, shouldClose = false, description = "A lighter." },
bong = { name = "bong", label = "Bong", weight = 500, type = "item", image = "bong.png", unique = false, useable = false, shouldClose = false, description = "A glass smoking bong." },

--- Strains
pink_runtz_seed_m = { name = "pink_runtz_seed_m", label = "Pink Runtz Seed (M)", weight = 1, type = "item", image = "pink_runtz_seed.png", unique = false, useable = true, shouldClose = true, description = "A male Pink Runtz seed." },
pink_runtz_seed_f = { name = "pink_runtz_seed_f", label = "Pink Runtz Seed (F)", weight = 1, type = "item", image = "pink_runtz_seed.png", unique = false, useable = true, shouldClose = true, description = "A feminized Pink Runtz seed." },
pink_runtz_untrimmed  = { name = "pink_runtz_untrimmed", label = "Pink Runtz (Untrimmed)", weight = 1, type = "item", image = "pink_runtz_untrimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh untrimmed Pink Runtz bud." },
pink_runtz_trimmed  = { name = "pink_runtz_trimmed", label = "Pink Runtz (Trimmed)", weight = 1, type = "item", image = "pink_runtz_trimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh trimmed Pink Runtz bud." },
pink_runtz_bag  = { name = "pink_runtz_bag", label = "Pink Runtz (Bag)", weight = 2, type = "item", image = "pink_runtz_bag.png", unique = false, useable = true, shouldClose = true, description = "A baggie of Pink Runtz." },
pink_runtz_ounce  = { name = "pink_runtz_ounce", label = "Pink Runtz (Ounce)", weight = 28, type = "item", image = "pink_runtz_ounce.png", unique = false, useable = false, shouldClose = false, description = "A ounce of Pink Runtz." },
pink_runtz_joint  = { name = "pink_runtz_joint", label = "Pink Runtz (Joint)", weight = 1, type = "item", image = "joint.png", unique = false, useable = true, shouldClose = true, description = "A joint of Pink Runtz." },

zkittlez_seed_m = { name = "zkittlez_seed_m", label = "Zkitlez Seed (M)", weight = 1, type = "item", image = "zkittlez_seed.png", unique = false, useable = true, shouldClose = true, description = "A male Zkittlez seed." },
zkittlez_seed_f = { name = "zkittlez_seed_f", label = "Zkitlez Seed (F)", weight = 1, type = "item", image = "zkittlez_seed.png", unique = false, useable = true, shouldClose = true, description = "A feminized Zkittlez seed." },
zkittlez_untrimmed  = { name = "zkittlez_untrimmed", label = "Zkitlez (Untrimmed)", weight = 1, type = "item", image = "zkittlez_untrimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh untrimmed Zkitlez bud." },
zkittlez_trimmed  = { name = "zkittlez_trimmed", label = "Zkitlez (Trimmed)", weight = 1, type = "item", image = "zkittlez_trimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh trimmed Zkitlez bud." },
zkittlez_bag  = { name = "zkittlez_bag", label = "Zkitlez (Bag)", weight = 2, type = "item", image = "zkittlez_bag.png", unique = false, useable = true, shouldClose = true, description = "A baggie of Zkitlez." },
zkittlez_ounce  = { name = "zkittlez_ounce", label = "Zkitlez (Ounce)", weight = 28, type = "item", image = "zkittlez_ounce.png", unique = false, useable = false, shouldClose = false, description = "A ounce of Zkitlez." },
zkittlez_joint  = { name = "zkittlez_joint", label = "Zkitlez (Joint)", weight = 1, type = "item", image = "joint.png", unique = false, useable = true, shouldClose = true, description = "A joint of Zkitlez." },

gelato_seed_m = { name = "gelato_seed_m", label = "Gelato Seed (M)", weight = 1, type = "item", image = "gelato_seed.png", unique = false, useable = true, shouldClose = true, description = "A feminized Gelato seed." },
gelato_seed_f = { name = "gelato_seed_f", label = "Gelato Seed (F)", weight = 1, type = "item", image = "gelato_seed.png", unique = false, useable = true, shouldClose = true, description = "A feminized Gelato seed." },
gelato_untrimmed  = { name = "gelato_untrimmed", label = "Gelato (Untrimmed)", weight = 1, type = "item", image = "gelato_untrimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh untrimmed Gelato bud." },
gelato_trimmed  = { name = "gelato_trimmed", label = "Gelato (Trimmed)", weight = 1, type = "item", image = "gelato_trimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh trimmed Gelato bud." },
gelato_bag  = { name = "gelato_bag", label = "Gelato (Bag)", weight = 2, type = "item", image = "gelato_bag.png", unique = false, useable = true, shouldClose = true, description = "A baggie of Gelato." },
gelato_ounce  = { name = "gelato_ounce", label = "Gelato (Ounce)", weight = 28, type = "item", image = "gelato_ounce.png", unique = false, useable = false, shouldClose = false, description = "A ounce of Gelato." },
gelato_joint  = { name = "gelato_joint", label = "Gelato (Joint)", weight = 1, type = "item", image = "joint.png", unique = false, useable = true, shouldClose = true, description = "A joint of Gelato." },

melonade_seed_m = { name = "melonade_seed_m", label = "Melonade Seed (M)", weight = 1, type = "item", image = "melonade_seed.png", unique = false, useable = true, shouldClose = true, description = "A male Melonade seed." },
melonade_seed_f = { name = "melonade_seed_f", label = "Melonade Seed (F)", weight = 1, type = "item", image = "melonade_seed.png", unique = false, useable = true, shouldClose = true, description = "A feminized Melonade seed." },
melonade_untrimmed  = { name = "melonade_untrimmed", label = "Melonade (Untrimmed)", weight = 1, type = "item", image = "melonade_untrimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh untrimmed Melonade bud." },
melonade_trimmed  = { name = "melonade_trimmed", label = "Melonade (Trimmed)", weight = 1, type = "item", image = "melonade_trimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh trimmed Melonade bud." },
melonade_bag  = { name = "melonade_bag", label = "Melonade (Bag)", weight = 2, type = "item", image = "melonade_bag.png", unique = false, useable = true, shouldClose = true, description = "A baggie of Melonade." },
melonade_ounce  = { name = "melonade_ounce", label = "Melonade (Ounce)", weight = 28, type = "item", image = "melonade_ounce.png", unique = false, useable = false, shouldClose = false, description = "A ounce of Melonade." },
melonade_joint  = { name = "melonade_joint", label = "Melonade (Joint)", weight = 1, type = "item", image = "joint.png", unique = false, useable = true, shouldClose = true, description = "A joint of Melonade." },

blue_dream_seed_m = { name = "blue_dream_seed_m", label = "Blue Dream Seed (M)", weight = 1, type = "item", image = "blue_dream_seed.png", unique = false, useable = true, shouldClose = true, description = "A male Blue Dream seed." },
blue_dream_seed_f = { name = "blue_dream_seed_f", label = "Blue Dream Seed (F)", weight = 1, type = "item", image = "blue_dream_seed.png", unique = false, useable = true, shouldClose = true, description = "A feminized Blue Dream seed." },
blue_dream_untrimmed  = { name = "blue_dream_untrimmed", label = "Blue Dream (Untrimmed)", weight = 1, type = "item", image = "blue_dream_untrimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh untrimmed Blue Dream bud." },
blue_dream_trimmed  = { name = "blue_dream_trimmed", label = "Blue Dream (Trimmed)", weight = 1, type = "item", image = "blue_dream_trimmed.png", unique = false, useable = false, shouldClose = false, description = "A fresh trimmed Blue Dream bud." },
blue_dream_bag  = { name = "blue_dream_bag", label = "Blue Dream (Bag)", weight = 2, type = "item", image = "blue_dream_bag.png", unique = false, useable = true, shouldClose = true, description = "A baggie of Blue Dream." },
blue_dream_ounce  = { name = "blue_dream_ounce", label = "Blue Dream (Ounce)", weight = 28, type = "item", image = "blue_dream_ounce.png", unique = false, useable = false, shouldClose = false, description = "A ounce of Blue Dream." },
blue_dream_joint  = { name = "blue_dream_joint", label = "Blue Dream (Joint)", weight = 1, type = "item", image = "joint.png", unique = false, useable = true, shouldClose = true, description = "A joint of Blue Dream." },


```