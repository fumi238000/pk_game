require './judge'
require './game_controller'
require './modules/message_dialog'
require 'pry'
include MessageDialog

#--------------------メインの処理--------------------
  # game_controllerのインスタンスを生成
  game_controller = GameController.new


  while true 
    #PKメソッドの呼び出し
    game_controller.pk

    print "もう一度チャレンジする場合は「１」を押してください > "
    answer = gets.chomp.to_i

    if answer == 1
      restart_game_message  
    else
      puts "遊んでいただき、ありがとうございました"
      break
    end
    
  end