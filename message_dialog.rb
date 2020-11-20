module MessageDialog
  #キッカーのメッセージ
  def kick_message
    

  end

  #守る時のメッセージ
  def difence_message
    
  end
    
  #結果判定のメッセージ
  def judge_message

  end


  # サドンデス
  def shooting_power_message
    puts <<~TEXT
    どれくらいの威力で蹴りますか？
    0~100%の間で入力してください
    TEXT
  end

  def power_kick_message
    
  end

  def not_power_message
    puts <<~TEXT
          
      ----------------------------------
            1~100%の中からお選びください
      ----------------------------------

    TEXT
  end
end