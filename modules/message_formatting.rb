# このファイルを別モジュールファイルで使用できなければ、削除する

# frozen_string_literal: true

module MessageFormatting
  # MEMO: #51
  # 文字をいい感じに中央寄せするメソッド
  def string_center(padding = ' ')
    width = 100
    output_width = each_char.map { |c| c.bytesize == 1 ? 1 : 2 }.reduce(0, &:+)
    padding_size = [0, width - output_width].max
    padding * (padding_size / 2) + self + padding * (padding_size / 2)
  end
end
