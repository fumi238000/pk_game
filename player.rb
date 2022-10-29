# frozen_string_literal: true

require './modules/effect'
require './modules/message_formatting'

class Player
  include Effect
  include MessageFormatting
  #--------------------共通処理--------------------
  attr_accessor :user_goal, :com_goal

  # 方向
  LEFT   = '左 <<<<<<<<---------'
  RIGHT  = '--------->>>>>>>> 右'
  CENTER = '>>>---- 中央 ----<<<'

  # コースリスト
  # パターン１
  COURSE_LIST = [
    { num: '1', couse: RIGHT },
    { num: '2', couse: CENTER },
    { num: '3', couse: LEFT }

    # パターン2
    # {num: "1", couse: "真ん中"},
    # {num: "2", couse: "右上"},
    # {num: "3", couse: "右下"},
    # {num: "4", couse: "左上"},
    # {num: "5", couse: "左下"},
  ].freeze

  # プレイヤーに提示する選択肢の表示
  def select_list
    puts
    COURSE_LIST.each.with_index(1) do |course, i|
      puts "#{i}. [ #{course[:couse]} ]".string_center(' ')
    end
    puts
  end

  # リストの数
  LIST_LENGTH = (1..COURSE_LIST.size).freeze
end
