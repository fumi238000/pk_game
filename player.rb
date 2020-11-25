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
  CORSE_LIST = [
    {num: "1", couse: RIGHT},
    {num: "2", couse: CENTER},
    {num: "3", couse: LEFT}, 

    # 4つめを追加すると、エラーが発生する
    # {num: "4", couse: "右上"}, 
  ]

  # プレイヤーに提示する選択肢の表示   
  def select_list    
    CORSE_LIST.each.with_index(1) do |corse,i|
      puts  "#{i}.[ #{corse[:couse]} ]"
    end
  end

  LIST_LENGTH = 1..CORSE_LIST.size 
  
end