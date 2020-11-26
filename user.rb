require './player'
require './effect'
require './message_dialog'

class User  < Player
  include Effect
  include MessageDialog

#--------------------USERのシュートコースの決定する--------------------
  def select_kick_course
    while true
      # コース一覧の表示
      select_list

      # USERが番号を選択する
      print "コースを数値で入力してください > "
      select_num = gets.chomp.to_i 

      #必要な数値が入力されているか？
      break if (LIST_LENGTH).include?(select_num)
      
      #エラーメッセージ
      not_select_kick_message
    end
      
      #コースを変数に格納
      select_num = CORSE_LIST[select_num - 1]
  
      # 蹴るエフェクト
      user_kick_message(select_num)  
  end
  
  #--------------------USERの守るコースの決定する--------------------
  def user_save_course
    while true
      
      # コース一覧の表示
      select_list
      
      # USERが番号を選択する
      print "コースを数値で入力してください > "
      select_num = gets.chomp.to_i 
      
      #必要な数値が入力されているか？
      break if (LIST_LENGTH).include?(select_num)

      #エラーメッセージ
        not_select_save_message
      end 

      select_num  = CORSE_LIST[select_num - 1]
    
      # 守るエフェクト
      user_save_message(select_num)
   
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