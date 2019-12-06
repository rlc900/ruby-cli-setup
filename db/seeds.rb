User.destroy_all
Game.destroy_all

user1 = User.create(username: "rianna")


fps1 = Game.create(title: "Overwatch", genre: "FPS")
fps2 = Game.create(title: "Modern Warfare", genre: "FPS")
fps3 = Game.create(title: "Destiny 2", genre: "FPS")
fps4 = Game.create(title: "BioShock", genre: "FPS")
fps5 = Game.create(title: "Tom Clancy's Rainbow Six Siege", genre: "FPS")
fps6 = Game.create(title: "Titanfall 2", genre: "FPS")

rpg1 = Game.create(title: "Star Wars: Knights of the Old Republic", genre: "RPG")
rpg2 = Game.create(title: "The Elder Scrolls V: Skyrim", genre: "RPG")
rpg3 = Game.create(title: "The Outer Worlds", genre: "RPG")
rpg4 = Game.create(title: "Fallout4", genre: "RPG")
rpg5 = Game.create(title: "Dark Souls", genre: "RPG")
rpg6 = Game.create(title: "Cyberpunk", genre: "RPG")

mmo1 = Game.create(title: "WOW Classic", genre: "MMO")
mmo2 = Game.create(title: "Dauntless", genre: "MMO")
mmo3 = Game.create(title: "Bless Unleashed", genre: "MMO")
mmo4 = Game.create(title: "Last Oasis", genre: "MMO")
mmo5 = Game.create(title: "Torchlight Frontiers", genre: "MMO")
mmo6 = Game.create(title: "Rocket Arena", genre: "MMO")



fps_rental1 = Rental.create(user_id: user1.id, game_id: fps1.id)
fps_rental2 = Rental.create(user_id: user1.id, game_id: fps2.id)
fps_rental3 = Rental.create(user_id: user1.id, game_id: fps3.id)

rpg_rental1 = Rental.create(user_id: user1.id, game_id: rpg1.id)
rpg_rental2 = Rental.create(user_id: user1.id, game_id: rpg2.id)
rpg_rental3 = Rental.create(user_id: user1.id, game_id: rpg3.id)

mmo_rental1 = Rental.create(user_id: user1.id, game_id: mmo1.id)
mmo_rental2 = Rental.create(user_id: user1.id, game_id: mmo2.id)
mmo_rental3 = Rental.create(user_id: user1.id, game_id: mmo3.id)
# binding.pry
# puts "This has been seeded."
