# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Liquor.create!([{ name: 'Rum' },
                { name: 'Vodka' },
                { name: 'Gin' },
                { name: 'Tequila' }])
                
Mixer.create!([{ name: 'Mint leaves' },
              { name: 'Simple syrup' },
              { name: 'Lime juice' },
              { name: 'Club soda' },
              { name: 'Ginger beer' },
              { name: 'Lemon juice' },
              { name: 'Cola' }])
              
Drink.create!([{ name: 'Mojito', alcoholPerVolume: 15.5, flavor: :Sweet, 
                description: "In a shaker, lightly muddle the mint.
 Add the rum, simple syrup and lime juice, fill with ice and strain.
 Pour into a highball glass.
 Top with the club soda.
 Garnish with a mint sprig.", liquor_ids: [1], mixer_ids: [1, 2, 3, 4] },
                { name: 'Moscow Mule', alcoholPerVolume: 25.5, flavor: :Sour,
                  description: "Add all of the ingredients intoto a Moscow Mule mug (or highball glass) over ice.
 Garnish with a lime wheel.", liquor_ids: [2], mixer_ids: [3, 5] },
                { name: 'Bloody Mary', alcoholPerVolume: 12.0, flavor: :Savory,
                  description: "Pour some celery salt onto a small plate.
Rub the juicy side of the lemon or lime wedge along the lip of a pint glass. 
Roll the outer edge of the glass in celery salt until fully coated. 
Fill with ice and set aside. Squeeze the lemon and lime wedges into a shaker and drop them in.
Add the remaining ingredients and ice and shake gently. Strain into the prepared glass. 
Garnish with a parsley sprig and 2 speared green olives and a lime wedge.", liquor_ids: [2], mixer_ids: [6] },
                { name: 'Daiquiri', alcoholPerVolume: 15.0, flavor: :Sweet,
                  description: "In a blender, combine ice, sugar and strawberries.
                  Pour in lime juice, lemon juice, rum and lemon-lime soda. Blend until smooth. Pour into glasses and serve.",
liquor_ids: [1], mixer_ids: [7]},
                { name: 'Long Island Iced Tea', alcoholPerVolume: 22.0, flavor: :Sweet,
                  description: "Add all the ingredients except the cola into a Collins glass with ice.
Top with a splash of the cola and stir briefly.
Garnish with a lemon wedge.", liquor_ids: [1, 2, 3, 4], mixer_ids: [2, 6, 7] }]) 
 
 p "Created #{Drink.count} drinks"
