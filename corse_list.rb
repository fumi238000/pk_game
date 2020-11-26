module CorseList

# 方向
  RIGHT = "<<<<<<<<--------右"
  LEFT = "左-------->>>>>>>>"
  CENTER = "<<<----中央---->>>"
  
  # コースリスト
  CORSE_LIST = [
    {num: "1", couse: RIGHT},
    {num: "2", couse: CENTER},
    {num: "3", couse: LEFT},  

    #追加された時に、エラーにならないようにする
    {num: "4", couse: "右上"},  
    
  ]

  # プレイヤーに提示する選択肢の表示   
  def select_list    
    CORSE_LIST.each.with_index(1) do |corse,i|
      puts  "#{i}.[ #{corse[:couse]} ]"
    end
  end
  
  #リストの数
  LIST_LENGTH = 1..CORSE_LIST.size 
end