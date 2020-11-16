require './player'
require './user'

class Com < Player
  #--------------------メインの処理--------------------
  
  # def com_kick
  #   #userが守る
  #   gk_effect 
    
  #   # コース一覧の表示
  #   select_list
    
  #   #USERの守るエリアの決定
  #   user_save_area
    
  #   #COMのシュートコースの決定
  #   select_shooting_course
    
  #   #結果の判定
  #   goal_determination


  # end  
  
  #--------------------メソッドの定義--------------------
  # ①COMのシュートコースの決定する 
  def select_shooting_course
  rand_num = rand(1..3)
  
   #comのシュートコースをランダムに決定
  case rand_num
  when 1
    @com_select_kick = RIGHT
   when 2
    @com_select_kick = CENTER
   when 3
    @com_select_kick = LEFT
   end

  # キックした方向を表示
  puts "Com キッカーは[[  #{@com_select_kick}  ]]に蹴った！"

end



 # ②COMの守るエリアの決定する
   def com_save_area

    #comの守るエリアをランダムに決定
    rand_num = rand(1..3)

    case rand_num
    when 1
      @com_select_save = RIGHT
    when 2
      @com_select_save = CENTER
    when 3 
      @com_select_save = LEFT
    end

    # キックした方向を表示
    puts "Com GKは[[  #{@com_select_save}  ]]へ飛んだ！"
  
  end


  # ③ゴール判定
  def goal_determination
  # userとcomの数値を比較
  if @com_select_kick == @user_select_save 
    
    # セーブした場合の処理
    save_effect
    
  else
    
    # 得点した場合の処理
    get_goal_effect
    @com_goal += 1
    
  end
  
    # 現在の合計得点を表示
    puts <<~EOS
      COM：#{@com_goal}ゴール
    EOS
  end


  # ④comの合計得点の表示
  def total_goal
    user = @com_goal
  end
end


