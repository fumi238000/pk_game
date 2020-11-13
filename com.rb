require './player'
require './user'

class Com < User
  def kick
 
  #---------------------------------
    #  COMの#{i + 1}人目のキッカーです
  #---------------------------------
  
   puts <<~EOS

    どこを守りますか？
    1:左
    2:真ん中
    3:右
    EOS
  
   

    #キーパーが守るエリアを決める
    user_save_area
  
    #COMのシュートコースの決定
    select_shooting_course

    #結果の判定
    goal_determination
  end  



  private
   
  
  
  # Userが守るエリアの決定
  def user_save_area
    while true
      # ユーザーが「１・２・３」を選択し、守る方向を決定
      select_num = gets.chomp.to_i 
      
      @user_select_save = case select_num
      when 1
        "「 左 」"
        break
      when 2
        "「 中央 」"
        break
      when 3
        "「 右 」"
        break
      else
        puts <<~text
        ----------------------------------
        error ： 守る方向を入力してください
        ----------------------------------
        text
      end 
    end
    puts "GKは#{@user_select_save}へ飛んだ！"
  end
  
  
  # COMのシュートコースの決定  
  def select_shooting_course

    rand_num = rand(1..3)
    
    @com_select_kick = case rand_num
    when 1
      "「 左 」"
     when 2
       "「 中央 」"
     when 3
       "「 右 」"
     end
    puts  "キッカーは#{@com_select_kick}に蹴った！"
  end


  # ゴール判定
  def goal_determination
    if @com_select_kick == @user_select_save 
      
      puts <<~TEXT
      #{save_effect}
      TEXT
      
      else

      puts <<~TEXT
      #{get_goal_effect}
      TEXT
   
      @com_goal += 1
    
    end
   
    puts <<~EOS
      COM：#{@com_goal}ゴール
    EOS
  end


    #ここの部分を別ファイルで定義したい
    def judgment
      #ユーザーの合計得点
      puts <<~EOS
        ユーザーの合計得点:#{@@user_goal}点
        COMの合計得点:#{@com_goal}点
      EOS
      
      if  @@user_goal == @com_goal
        puts "サドンデスです"
        #１回ずつ行う処理の実装
      
      elsif @@user_goal > @com_goal
        puts "勝ちました!!!!!!!!!!!!!!!!!!!!"
      
      else  @@user_goal > @com_goal
        puts "負けました...膝から崩れ落ちた・・・"
      end
    end
end
