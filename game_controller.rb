# require './user'
# require './com'
# require './player'


# class GameController  


#--------------------メソッドの定義--------------------



# def pk
#   #開始画面
#   start_effect

#   #pkの処理
#   kick_count = 0
#    while kick_count < FIVE_KICK
#      kick_count += 1
#     #  user.user_kick
#     #  com.com_kick
#    end
# end
















#--------------------初期値の設定--------------------

# #５回蹴る  
# FIVE_KICK = 1








#--------------------エフェクト--------------------

# # 開始のエフェクト
# def start_effect
#   puts <<~TEXT
#     ----------------------------------
#     |                                |
#     |           PK GEAM              |
#     |                                |
#     ----------------------------------
   
#     ----------------------------------
#     |                                |
#     |           KICK OFF!            |
#     |                                |
#     ----------------------------------
    

#   TEXT
# end



#   # ゴールが決まった時のエフェクト 
#   def get_goal_effect   
#     puts <<~TEXT
 
#         ----------------------------------
#         |                                |
#         |         GOOOOOOOOOAL!!!!       |
#         |                                |
#         ----------------------------------

#                  ゴ━━━━(ﾟ∀ﾟ)━━━━ル!!  
              
                

#     TEXT
#   end
  
#   # ゴールが止められた時のエフェクト 
#   def save_effect
#     puts <<~TEXT
  
#         ----------------------------------
#         |                                |
#         |     ××××  NO GOAL  ××××××      |
#         |                                |
#         ----------------------------------
  
#                  ファインセーブ！！
  
#     TEXT
#   end

# end