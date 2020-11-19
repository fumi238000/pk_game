require './player'

class Com < Player
#--------------------COMのシュートコースの決定する--------------------
  def select_kick_course
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

    # 蹴るエフェクト
    com_kick_effect
    
  end
  #--------------------COMの守るコースの決定する--------------------
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
    
    # 守るエフェクト
    com_save_effect
  end
  
  #--------------------COMのシュートコースを変数に格納--------------------
  def select_kick
    com = @com_select_kick
  end
  
  #--------------------COMのシュートコースを変数に格納--------------------
  def select_save
    com = @com_select_save
  end
  
  
  

  # 何人目かを知らせるエフェクト
  def kicker_num(kick_count)
    puts <<~TEXT
  
      "COM 「#{kick_count}人目」のキッカーです"
      
    TEXT
  end
  



  #<<<<<--------------------privateメソッド-------------------->>>>>
  
  private
  # 蹴る時のエフェクト
  def com_kick_effect
    
    puts <<~TEXT
  
    -------------------------KICK-----------------------------
      
         Com キッカーは[[  #{@com_select_kick}  ]]に蹴った！
    
    -------------------------KICK-----------------------------
      
    TEXT

  end


  # 守る時のエフェクト
  def com_save_effect
    puts <<~TEXT
    
    -------------------------SAVE-----------------------------
    
            Com GKは[[  #{@com_select_save}  ]]へ飛んだ！
    
    -------------------------SAVE-----------------------------
    
    TEXT
    
  end
  

  


end