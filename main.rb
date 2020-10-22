require './user'
require './com'
require './game_controller'

puts <<~TEXT
    ----------------------------------
    |                                |
    |           PK GEAM              |
    |                                |
    ----------------------------------
   
    ----------------------------------
    |                                |
    |           KICK OFF!            |
    |                                |
    ----------------------------------
    

  TEXT

  user = User.new
  com = Com.new

  #５回お互いに蹴る  
  1.times{|i|
    puts "---------------------------------"
    puts "ユーザーの#{i + 1}人目のキッカーです"
    puts "---------------------------------"

    user.kick

    puts "---------------------------------"
    puts "COMの#{i + 1}人目のキッカーです"
    puts "---------------------------------"

    com.kick  
  }

  
  game_controller = Game_controller.new
  game_controller.judgment


