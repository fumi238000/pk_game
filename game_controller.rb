# require './user'
# require './com'
# require './player'
# require './judge'



class GameController
# while true
#   ５回蹴る
#   user_kick
#   com_kick 
# end



#--------------------メイン処理--------------------
FIVE_KICK = 5

def pk
  kick_count = 0 
  while kick_count < FIVE_KICK
    kick_count += 1
    puts "#{kick_count}目"
    user_kick
    com_kick
  end
end
  
#--------------------メソッドの定義--------------------



 #ユーザーが蹴る場合
 def user_kick
  puts <<~TEXT
    ユーザーが蹴るコースを選択
    comが守るコースを決定
    結果発表
  TEXT

 end
 
  #  user.kick
  #  com.save
  #  judge
 
#COMが蹴る場合
def com_kick
  puts <<~TEXT
    ユーザーが守るコースを選択
    comが蹴るコースを決定
    結果発表
  TEXT

end






#--------------------------------------------
#結果の判定
def judgement
  puts "俺がジャッジする！"
end
















  
  #user.save
  #com.kick
  #judge


# #５回蹴る  
# FIVE_KICK = 5

# # PK戦開始
# kick_count = 0
#  while kick_count < FIVE_KICK
#    kick_count += 1
#    user.user_kick
#    com.com_kick
#  end








#締め
end