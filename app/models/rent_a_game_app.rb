class RentAGame
require 'tty-prompt'

  def run
    welcome
    login_or_signup
    options
  end

  def welcome
    # provides a welcome message to the user.
    puts "Welcome to Rent-A-Game! 😁"
    sleep(1)
  end

  def login_or_signup
    # has the user sign in or create a new username if they
    # dont have an account.
    puts "Please create a username below, or sign in with existing 👻"
    # downcase to cover edge cases
    answer = gets.chomp.downcase

    # finds instance based on answer
    @user = User.find_or_create_by(username: answer) #Create
    # binding.pry
    sleep(1.5)
    puts "Hello, #{@user.username}!"
    sleep(1.5)
  end



  def options
    prompt = TTY::Prompt.new
    # array = ["returning", "renting"]
    choice = prompt.select("What would you like to do?") do |game|
      game.choice "Rent", -> {self.rent_game}
      game.choice "Return", -> {self.return_game}
      game.choice "See rented games", -> {self.rented_games}
      # game.choice "Delete game", -> {self.delete_fav_rental_instances}
      game.choice "Update Username", -> {self.change_username}
      game.choice "Exit", -> {exit!}
    end
  end

  def change_username # Update
    #get the name
    #find the name
    #erase the name
    #create new

    @user.delete
    prompt = TTY::Prompt.new
    # i asked the user to create a new username
    puts "What would you like to change your username to?"
    # saved answer to new username
    new_name = gets.chomp
    # created new username
    @user = User.create(username: new_name)
    # binding.pry
    puts "Your new username is #{new_name}!"
    sleep(1)
    options
  end

  def rent_game
    # asks if user is renting/returning a game.
    # if user is renting a game, this method will make the user choose
    # which genre they want to rent from. :)
    prompt = TTY::Prompt.new
    #grabs all of the game genres
    choices = Game.all.map {|game| game.genre}
    nav = prompt.select("What type of game would you like to rent?", choices.uniq)
    # binding.pry
    puts "Sweeet!! Choose a game from below."
    # sees if choice is equal to game genre that was chosen by user
    chosen_games = Game.all.select {|game| nav == game.genre}
    # most definitely could refactor these lines
    titles = chosen_games.map {|game| game.title}
    title_choices = prompt.select("Game Choices", titles)

    # goes through rental, creates an intance. Game id will go to games, find
    # name of game and go to its id.
    # binding.pry
    # creating a new entry that saves to the database, finds & returns the game id
    Rental.create(user_id: @user.id, game_id: Game.find_by(title: title_choices).id)

    diff_responses = ["Great choice! Enjoy your game 🤩", "Awesome! Thanks for renting with us 🤪"]
    puts diff_responses.sample
    sleep(1)
    options
  end




  def return_game
    # in this method, the purpose is to return a game that the user
    # has previously rented.
      rentals_array = @user.rentals.uniq

     if @user.rentals.uniq == []
       puts "You have no games to return!"
       sleep(1)
       options
     end

     #game name of rentals
     prompt = TTY::Prompt.new
     game_array = rentals_array.map do |rental|
       # goes through game table, looks through id column, finds
       # rental.game_id (game instance), then grab the title.
      Game.find_by(id: rental.game_id).title
    end

    returned_game = prompt.select("Which game are you returning?", game_array)

    selected_game = Game.find_by(title: returned_game)
    # takes the username and game_id and tried to find the rental
    var = Rental.find_by(user_id: @user.id, game_id: selected_game.id)
    var.delete #Delete

    puts "Thanks for returning your game!"
    # binding.pry
    sleep(1)
    options
  end

  def rented_games #Read
    #displays all of the rented games user has rented.
    @user.rentals.uniq
    # rentals = Rental.all.select do |rental|
    # rental.user_id == @user.id
    # end
    game_array = rentals.map do |rental|
    puts "These are all of the games you rented!:"
    puts Game.find_by(id: rental.game_id).title
    end
    sleep(2)
    options
  end

end #end of Class
