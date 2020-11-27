require'./effect'

class Player 
  include Effect
#--------------------共通処理--------------------
  attr_accessor :user_goal, :com_goal

  # 方向
  RIGHT = "<<<<<<<<--------右"
  LEFT = "左-------->>>>>>>>"
  CENTER = "<<<----中央---->>>"
  
  # コースリスト
  COURSE_LIST = [
    {num: "1", couse: RIGHT},
    {num: "2", couse: CENTER},
    {num: "3", couse: LEFT},  
  ]

  # プレイヤーに提示する選択肢の表示   
  def select_list    
    COURSE_LIST.each.with_index(1) do |course,i|
      puts  "#{i}.[ #{course[:couse]} ]"
    end
  end
  
  #リストの数
  LIST_LENGTH = 1..COURSE_LIST.size 

end