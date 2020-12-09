require './judge'
require './game_controller'
require './modules/message_dialog'
require 'pry'
require './modules/effect'
include MessageDialog
include Effect

#--------------------メインの処理--------------------
  #PKメソッドの呼び出し
  GameController.pk