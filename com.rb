require './player'

class Com < Player

  def initialize
    @com_goal = START_GOAL 
  end
  
  def kick

    puts <<~EOS



    どこを守りますか？
    1:左
    2:真ん中
    3:右
    EOS
  
     
    #キーパーが守るエリアを決める
    puts "#{user_protect_area}"
  
    #COMのシュートコースの決定
    puts "#{select_shooting_course}"

    #結果の判定
    puts "#{goal_determination}"
    
  end
  
  
  
  
  private
   
  #------------------------------
  # COMのシュートコースの決定  
  def select_shooting_course

    com_select_num = rand(1..3)
    
    @select_kick = case com_select_num
    when 1
      "「 左 」"
     when 2
       "「 中央 」"
     when 3
       "「 右 」"
     end

    puts  "COMキッカーは#{@select_kick}に蹴った！"
    #エフェクトが出るとわかりやすいかもしれない
  end
  
  #-------------------------------------
  
  # Userが守るエリアの決定
  def user_protect_area
   
    user_select_num = gets.chomp.to_i 

    @select_save = case user_select_num
    when 1
      "「 左 」"
    when 2
      "「 中央 」"
    when 3
      "「 右 」"
    end
  
    puts "ユーザーGKは#{@select_save}へ飛んだ！"
    #エフェクトが出るとわかりやすいかもしれない
  end
    
  #------------------------------------------

  # ゴール判定
  def goal_determination
    if @select_kick == @select_save 
   
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
end