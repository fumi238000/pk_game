require './judge'
require './game_controller'

#--------------------メインの処理--------------------
# 開始のエフェクト
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

  # game_controllerのインスタンスを生成
  game_controller = GameController.new

  #PKメソッドの呼び出し
  game_controller.pk
