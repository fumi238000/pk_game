class Judge

#結果の表示
def result 
  if  @@user_goal > @com_goal
     win_effect
  else
    @@user_goal < @com_goal
     lose_effect
  end
 end


#ここの部分を別ファイルで定義したい
def judgment
  #ユーザーの合計得点の表示
  total_goal

  if  @@user_goal == @com_goal
    # サドンデス
    sudden_death_effect
    
    # サドンデスの処理
     while true 
        @@user_goal = @@user_goal
        @com_goal += 1
      
        # 同点の場合
        if  @@user_goal == @com_goal
          puts "同点です！次のキッカーは準備してください"
        else
          # 同点ではなかった場合
          result
          break
        end
     end  
  else
    # 勝敗判定
    result
  end
end


end