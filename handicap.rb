require './message_dialog'

class Handicap
  include MessageDialog

#--------------------ハンデを決める--------------------
  def decide_handicap
    handicap_message

    while true

      # ハンデのありなしの決定
      print "YES:1 , NO:2 >"
      num = gets.chomp.to_i

        if num == 1
          # ハンデあり
          return handicap

        elsif num == 2
          #ハンデなし
          return  no_handicap

        else
          #エラーメッセージ
          not_handicap_message
        end

    end
  end


private

#--------------------ハンデあり--------------------
def handicap
  puts "0~3点までハンデを入力してください"

  #ハンデの値を変数に格納
  user_hand = user_dicide_handicap
  com_hand = com_dicide_handicap

  #ハンデの表示
  handicap_num_message(user_hand,com_hand)
  
  #ハンデを初期値に設定
  return judge = Judge.new(user_goal: user_hand, com_goal: com_hand)

end


#--------------------ハンデなし--------------------
def no_handicap 
  puts "ゲームをスタートします"
  return judge = Judge.new(user_goal: 0, com_goal: 0)
end

#--------------------USERのハンデを決める--------------------
  def user_dicide_handicap
    while true
      print "USERのハンデ >"
      user_hand  = gets.chomp.to_i
      
      break if (1..3).include?(user_hand)
      
      not_handicap_select_message
    end
    user_hand
  end

#--------------------COMのハンデを決める--------------------
  def com_dicide_handicap
    while true
     print "COMのハンデ >"
     com_hand = gets.chomp.to_i
     
     break if (1..3).include?(com_hand)
     
     not_handicap_select_message
   end
   com_hand
 end      

end