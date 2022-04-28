# たい焼きの設計図を作成
class Taiyaki

  # 全てのインスタンスで共有されるクラス変数
  @@total_price = 0 
  @@total_taiyaki_count = 0

  # インスタンス作成の時に実行される
  def initialize(taste, price)
    @taste = taste
    @price = price
    # インスタンスが作成(new)される毎にカウントアップ
    @@total_taiyaki_count += 1
    @@total_price = @@total_price + @price
  end

  # インスタンスメソッド
  def show_info
      puts "#{@taste}味のたい焼きは#{@price}円です。"
  end

  # クラスメソッド
  def self.show_all_count
    puts "たい焼きは全部で#{@@total_taiyaki_count}個購入されました。"
    puts "合計金額は#{@@total_price}円です"
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
    taiyaki = Taiyaki.new("あんこ",150)
    taiyaki.show_info
  when 2
    taiyaki = Taiyaki.new("チョコ",170)
    taiyaki.show_info
  when 3
    taiyaki = Taiyaki.new("カスタード",190)
    taiyaki.show_info
  else
    puts "正しい数字を入力してください"
  end

  puts "購入を続けますか？"
  puts "まだ買う [1]"
  puts "もういらない [2]"

  continue_taiyaki = gets.to_i
  if continue_taiyaki == 2
    Taiyaki.show_all_count
    break
  end
end