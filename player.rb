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
  CORSES = [RIGHT,CENTER, LEFT]
  
  # プレイヤーに提示する選択肢の表示   
  def select_list    
    CORSES.each.with_index(1) do |corse,i|
      puts  "#{i}.[ #{corse} ]"
    end
  end

end