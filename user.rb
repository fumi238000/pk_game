require './player'
require './effect'
require './message_dialog'

class User  < Player
  include Effect
  include MessageDialog

#--------------------USERのシュートコースの決定する--------------------
  def select_kick_course(kick_count)
    while true

      # キッカーであることを表示
      user_kicker_message(kick_count)

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
    
    #以下まとめられないか？

    #コースを変数に格納
    select_num = COURSE_LIST[select_num - 1]
  
    # 蹴るエフェクト
    kick_message(select_num)  

  end
  #--------------------USERの守るコースの決定する--------------------
  def user_save_course(kick_count)
    while true
      
      #GKであることを表示
      com_kicker_message(kick_count)

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
    
    
    #以下まとめられないか？

    #コースを変数に格納
    select_num  = COURSE_LIST[select_num - 1]
    
    # 守るエフェクト
    save_message(select_num)
  end
end