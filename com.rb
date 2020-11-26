require './player'
require './effect'
require './message_dialog'

class Com < Player
  include Effect
  include MessageDialog
  
#--------------------COMのシュートコースの決定する--------------------
  def select_kick_course
    rand_num = rand(LIST_LENGTH)
    
    select_num  = COURSE_LIST[rand_num - 1]
  
    # 蹴る
     kick_message(select_num)

  end
  #--------------------COMの守るコースの決定する--------------------
  def com_save_course
    
    #comの守るエリアをランダムに決定
    rand_num = rand(LIST_LENGTH)

    select_num  = COURSE_LIST[rand_num - 1]
    
    # 守る
    save_message(select_num)

  end
  
end