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
  CORCE_LIST = [
    {number: "1" ,corce: RIGHT},
    {number: "2" ,corce: CENTER},
    {number: "3" ,corce: LEFT},
  ]

  # プレイヤーに提示する選択肢の表示   
  def select_list
    CORCE_LIST.each {|list|  puts  list[:number] + ":  [" + list[:corce] + "]"}
  end
end