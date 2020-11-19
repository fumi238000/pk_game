

class GameController

#--------------------初期値--------------------
    #初期設定では5回ずつ蹴る  
  FIVE_KICK = 5
    

    
  def pk

    #蹴る回数のカウント
    kick_count = 0

    while kick_count < FIVE_KICK
      kick_count += 1
      
      #--------------------USERキック--------------------
    # 何人目のキッカーか表示
    puts <<~TEXT

      "USER 「#{kick_count}人目」のキッカーです"
    
      TEXT
      
    end

    # エフェクト
    player.kick_effect

end


     
end
     





  
#    # コース一覧の表示
#    user.select_list

#    # USERのシュートコースの決定
#    user.select_kick_course

#    # userのシュートコースを取得
#    user_select = user.select_kick

#    # COMの守るエリアの決定
#    com.com_save_area
   
#    # COMの守るエリアの取得
#    com_select = com.select_save
   
#    # 結果の判定
#    judge.user_goal_determination(user_select: user_select, com_select: com_select)

# #--------------------COMキック--------------------
#    # 何人目のキッカーか表示
#    puts <<~TEXT

#      "COM 「#{kick_count}人目」のキッカーです"
   
#    TEXT

#    # エフェクト
#    player.gk_effect 
     
#    # コース一覧の表示
#    com.select_list
     
#    # USERの守るエリアの決定
#    user.user_save_area
   
#    # USERの守るエリアの取得
#    user_select = user.select_save
   
#    # COMのシュートコースの決定
#    com.select_kick_course
   
#    # userのシュートコースを取得
#    com_select = com.select_kick
  
#    # 結果の判定
#    judge.com_goal_determination(user_select: user_select, com_select: com_select)
 
#  end

#  puts "両チーム「#{kick_count}回」ずつ蹴り終えました!"
# #<<<





