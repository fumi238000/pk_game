require './player'
require'./effect'
require './message_dialog'

class Com < Player
  include Effect
  include MessageDialog
  
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

    # 蹴る
    com_kick_message(@com_select_kick)
    
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
    
    # 守る
    com_save_message(@com_select_save)
  end
  
  #--------------------COMのシュートコースを変数に格納--------------------
  def select_kick
    com = @com_select_kick
  end
  
  #--------------------COMのシュートコースを変数に格納--------------------
  def select_save
    com = @com_select_save
  end
  
end