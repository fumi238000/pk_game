# 定義
# effect.rbに定義されていな文章を「message_dialog」として定義する


module MessageDialog
  
#-------------------------------------------------------USERのメッセージ
  # USER蹴る時
  def user_kicker_message(kick_count)
    puts <<~TEXT

       USER 「#{kick_count}人目」のキッカーです

    TEXT
    

    puts <<~TEXT
    
    
    
         ----------------------------------
                  あなたはキッカーです
                  どこにシュートしますか？
    
                      お選びください
         ----------------------------------
    
    TEXT
  end
  

  # USER蹴る時  
  def user_kick_message(user_select_kick)
    puts <<~TEXT
      
         -------------------------KICK-----------------------------

               User キッカーは[[  #{user_select_kick}  ]]に蹴った！

         -------------------------KICK-----------------------------
      
    TEXT
  end
    
    
  # USER守る時
  def user_save_message(user_select_save)
    puts <<~TEXT
        
          -------------------------SAVE-----------------------------

                  User GKは[[  #{user_select_save}  ]]に飛んだ！

          -------------------------SAVE-----------------------------
      
    TEXT
  end
    
    
    
#--------------------------------------------------COMのメッセージ
    
  def com_kicker_message(kick_count)
    puts <<~TEXT
    
          COM 「#{kick_count}人目」のキッカーです
    
    TEXT
        
        
    puts <<~TEXT
        
        
        
         ----------------------------------
                  あなたは GK です
                  どこを守りますか？
          
                    お選びください
         ----------------------------------
        
    TEXT

  end
  
  # COM蹴る時のエフェクト
  def com_kick_message(com_select_kick)
    
    puts <<~TEXT
    
         -------------------------KICK-----------------------------
    
                Com キッカーは[[  #{com_select_kick}  ]]に蹴った！
    
         -------------------------KICK-----------------------------
    
    TEXT
  end
  
  # COM 守る時のエフェクト
  def com_save_message(com_select_save)
    puts <<~TEXT
    
         -------------------------SAVE-----------------------------
         
                  Com GKは[[  #{com_select_save}  ]]へ飛んだ！
         
         -------------------------SAVE-----------------------------
    
    TEXT
  end

  
      
#----------------------------------------------------結果判定のメッセージ

  #現在の合計点を表示（USER）
  def user_now_goal_message(user_goal)
    puts <<~TEXT
      USER：#{user_goal}ゴール
    TEXT
  end
  

  # 現在の合計得点を表示（COM)
  def com_now_goal_message(com_goal)
    puts <<~TEXT
       COM：#{com_goal}ゴール
    TEXT
  end

  
  # PKを既定の回数（５回）蹴り終えた後のメッセージ
  def finish_pk_message(kick_count)
    puts "両チーム「#{kick_count}回」ずつ蹴り終えました!"
  end
  
  #合計点の表示
  def total_goal_message(user_goal, com_goal)
    puts <<~TEXT
          ------------------------------------------
    
             USER  <<< 合計得点 :#{@user_goal}点 >>>

             COM   <<< 合計得点 :#{@com_goal}点 >>>
    
          ------------------------------------------
    TEXT
  end


#----------------------------------------------------サドンデスのメッセージ
  # サドンデス
  def shooting_power_message
    puts <<~TEXT
    どれくらいの威力で蹴りますか？
    0~100%の間で入力してください
    TEXT
  end

  def power_kick_message(select)
    
    puts <<~TEXT
      
         --------------------------------------------
         
              USERは「 #{select}％ 」の威力で蹴った！
        
         --------------------------------------------
    
    TEXT
  end


 #----------------------------------------------------エラーメッセージ

  def not_power_message
    puts <<~TEXT
    
         --------------------------------------
              1~100%の中からお選びください
         --------------------------------------

    TEXT
  end

  #以下を統一できないか？
  def not_select_kick_message
    puts <<~text
    
         --------------------------------------
              error ： 蹴る方向を入力してください
         --------------------------------------
    
    text
  end


  def not_select_save_message
    puts <<~text
   
         --------------------------------------
              error ： 守る方向を入力してください
         --------------------------------------
    
    text
  end


end