class Judge


#--------------メインの処理--------------------------

def judgment
  #ユーザーの合計得点の表示
  total_goal

  # if  @@user_goal == @com_goal
  #   # サドンデス
  #   sudden_death_effect
    
  #   # サドンデスの処理
  #    while true 
  #       @@user_goal = @@user_goal
  #       @com_goal += 1
      
  #       # 同点の場合
  #       if  @@user_goal == @com_goal
  #         puts "同点です！次のキッカーは準備してください"
  #       else
  #         # 同点ではなかった場合
  #         result
  #         break
  #       end
  #    end  
  # else
  #   # 勝敗判定
  #   result
  # end
end



#--------------メソッドの分割--------------------------



# # 結果の表示
# def result 
#   if  @@user_goal > @com_goal
#      puts "勝ち"
#   else
#     @@user_goal < @com_goal
#       puts "負け"
#   end
#  end


##ここにuserとcomのインスタンス変数をどのようにして運んでくるか！が勝負！


def total_goal
  puts <<~EOS
  ----------------------------------------
  
  ユーザー合計得点  :#{@@user_goal}点
  COM合計得点      :#{@com_goal}点
  
  ----------------------------------------
  EOS
  
end



end