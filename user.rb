require './player'
require './effect'
require './message_dialog'

class User  < Player
  include Effect
  include MessageDialog

#--------------------USERのシュートコースの決定する--------------------
  def select_kick_course
    while true
      # USERが番号を選択する
      print "コースを数値で入力してください > "
      select_num = gets.chomp.to_i 

      #コースに応じて対応を決める
      case select_num
      when 1
        @user_select_kick =  RIGHT
        # 番号と方向を都度変更しなければいけないので、ハッシュから取得できるようにしたい
        # puts  CORCE_LIST[:corce][0]みたいに
        break
      when 2
        @user_select_kick =  CENTER
        break
      when 3
        @user_select_kick =  LEFT
        break
      else
        #エラーメッセージ
        not_select_kick_message
      end
    end

    # 蹴るエフェクト
    user_kick_message(@user_select_kick)  
  end
  
  #--------------------USERの守るコースの決定する--------------------
  def user_save_area
    while true
      # USERが番号を選択する
      print "コースを数値で入力してください > "
      select_num = gets.chomp.to_i 
      
      #コースに応じて対応
      case select_num
      when 1
        @user_select_save = RIGHT
        break
      when 2
        @user_select_save =  CENTER
        break
      when 3
        @user_select_save = LEFT
        break
      else
        #エラーメッセージ
        not_select_save_message
      end 
    end
    # 守るエフェクト
    user_save_message(@user_select_save)
  end
  
#--------------------USERのシュートコースを変数に格納-----------------
  def select_kick
    user = @user_select_kick
  end
  
#--------------------USERの守るコースを変数に格納--------------------
  def select_save
    user = @user_select_save
  end 
  
#--------------------キッカーの番号--------------------
  # 何人目かを表示する
  def kicker_num(kick_count)
    puts <<~TEXT

      "USER 「#{kick_count}人目」のキッカーです"

    TEXT
  end

end
