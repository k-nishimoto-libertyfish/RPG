class Taiyaki

  #合計金額のためのクラス変数を定義
  #購入さえた合計個数のためのクラス変数を定義

  def initialize(taste, price)
    #味のインスタンス変数の定義
    #金額のインスタンス変数の定義
    #合計の個数を増やす
    #合計金額を計算する
  end

  def show_info
      puts "#{}味のたい焼きは#{}円です。"
  end

  def # クラスメソッドの定義
    puts #ここに合計個数を表示させる
    puts #ここに合計金額を表示させる
  end

end

while true
  puts "購入したいたい焼きはどれですか？"
  puts "あんこ　    150円 [1]"
  puts "チョコ　    170円 [2]"
  puts "カスタード  190円 [3]"

  choice_taiyaki = gets.to_i

  case choice_taiyaki
  when 1
    taiyaki = #あんこ味のインスタンス化
    #購入した商品の詳細を出すインスタンス変数の呼ぼ出し
  when 2
    taiyaki = #チョコ味のインスタンス化
    #購入した商品の詳細を出すインスタンス変数の呼ぼ出し
  when 3
    taiyaki = #カスタード味のインスタンス化
    #購入した商品の詳細を出すインスタンス変数の呼ぼ出し
  else
    puts "正しい数字を入力してください"
  end

  puts "購入を続けますか？"
  puts "まだ買う [1]"
  puts "もういらない [2]"

  continue_taiyaki = gets.to_i
  if continue_taiyaki == 2
    #合計個数と合計金額を表示するためのクラスメソッドを呼び出す
    break
  end
end