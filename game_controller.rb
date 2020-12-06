require './user'
require './com'
require './player'
require './handicap'
require './modules/effect'
require './modules/message_dialog'

class GameController
  include Effect
  include MessageDialog

  #初期設定では5回ずつ蹴る
  GAME_NUM = 5

#--------------------メソッド--------------------
  # PK戦
  def pk
    #インスタンスの生成
    user = User.new
    com = Com.new
    handicap = Handicap.new

    #蹴る回数のカウント
    kick_count = 0

    #<<<<<--------------------ハンデの設定-------------------->>>>>
    judge = Judge.new(handicap.decide_handicap)

    #<<<<<--------------------start PK-------------------->>>>>
    # PK戦開始
    start_pk_effect

    while kick_count < GAME_NUM
      kick_count += 1

      #--------------------USERキック--------------------
      # USERのシュートコースの決定
      kick_num = user.select_kick_course(kick_count)

      # COMの守るエリアの決定
      save_num = com.com_save_course
   
      # kicker = true

      #結果の判定 サンプル
      judge.goal_determination(kick_num, save_num, kicker = "user")

      #--------------------COMキック--------------------
      # USERの守るエリアの決定
      save_num = user.user_save_course(kick_count)

      # COMのシュートコースの決定
      kick_num = com.select_kick_course

      # 結果の判定
      judge.goal_determination(kick_num, save_num,kicker= "com")

    end

    finish_pk_message(kick_count)
    #<<<<<--------------------finish PK-------------------->>>>>

    # 結果の判断
    judge.judgment

  end
end