require './player'
require './effect'
require './message_dialog'

class Com < Player
  include Effect
  include MessageDialog
#--------------------COMのシュートコースの決定する--------------------
  def select_kick_course

    #comの守るエリアをランダムに決定し、戻り値を変数に格納
    rand_num = rand(LIST_LENGTH)
    kick_num  = COURSE_LIST[rand_num - 1]

    # return kick_num  = COURSE_LIST[ rand(LIST_LENGTH) - 1]
  end
  #--------------------COMの守るコースの決定する--------------------
  def com_save_course

    #comの守るエリアをランダムに決定し、戻り値を変数に格納
    rand_num = rand(LIST_LENGTH)
    save_num = COURSE_LIST[rand_num - 1]

    #  return save_num  = COURSE_LIST[rand(LIST_LENGTH) - 1]
  end

end