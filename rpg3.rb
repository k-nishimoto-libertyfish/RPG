#モンスターを追加する

class Hero
  #勇者の基本情報
  @@strength = 120
  @@power = 0

  #勇者の体力を取得するメソッド
  def hero_strength
    @@strength
  end

  #勇者の攻撃力を取得するメソッド
  def hero_power
    @@power = rand(10..25)
  end

  #勇者が攻撃を受けた時の体力を減らすメソッド
  def hero_damage(monster_power)
    @@strength = @@strength - monster_power
  end

  #勇者の体力を回復するメソッド
  def hero_recovery
    @@strength = @@strength + 30
    #勇者の体力の上限は120のためそれ以上は回復させない
    if @@strength >= 120
      @@strength = 120
    end
  end
end

#モンスタークラス
class Monster

  #モンスターの基本情報
  @@strength = 0
  @@power = 0

  #モンスターの体力の設定
  def initialize(monster)
    @monster = monster
    if @monster == "スライム"
      @@strength = 80
    elsif @monster == "ゴブリン"
      @@strength = 100
    elsif @monster == "ドラゴン"
      @@strength = 120
    end
  end

  #モンスターの体力を取得するメソッド
  def monster_strength
    @@strength
  end

  #モンスターの攻撃力を取得するメソッド。モンスターによって攻撃力を変えている
  def monster_power
    if @monster == "スライム"
      @@power = rand(10..20)
    elsif @monster == "ゴブリン"
      @@power = rand(15..25)
    elsif @monster == "ドラゴン"
      @@power = rand(20..30)
    end
  end

  #モンスターが攻撃を受けた時の体力を減らすメソッド
  def monster_damage(hero_power)
    @@strength = @@strength - hero_power
  end
end


# 現れる敵をランダムに変えている
monsters = ["スライム","ゴブリン","ドラゴン"]
monster_name = monsters.sample
puts "#{monster_name}が現れた！戦闘を開始します！"

  #勇者のインスタンス化
  hero = Hero.new

  #モンスターのインスタンス化。敵によって生成されるものを変えている
  if monster_name == "スライム"
    monster = Monster.new("スライム")
  elsif monster_name == "ゴブリン"
    monster = Monster.new("ゴブリン")
  elsif monster_name == "ドラゴン"
    monster = Monster.new("ドラゴン")
  end


while true
  #勇者とモンスターの攻撃力を設定している。
  hero_power = hero.hero_power
  monster_power = monster.monster_power

  #モンスターの攻撃動作のメソッド
  def monster_attack_turn
    puts "#{monster_name}の攻撃! #{monster_power}のダメージを受けた"
    hero.hero_damage(monster_power)
    if hero.hero_strength <= 0
      puts "勇者は負けました。"
      break
    else
      puts "勇者の体力は残り #{hero.hero_strength}です！"
    end
  end 

  puts "何をしますか？"
  puts "戦う   [1]"
  puts "回復   [2]"
  puts "逃げる [3]"
  choice_hero = gets.to_i

  case choice_hero
  #戦うを選んだ場合
  when 1
    #勇者の攻撃のターン
    puts "勇者の攻撃! #{hero_power}のダメージを与えた"
    monster.monster_damage(hero_power)
    if monster.monster_strength <= 0
      puts "戦闘に勝ちました！"
      break
    else
      puts "#{monster_name}の体力は残り #{monster.monster_strength}です！"
    end
    
    #モンスターの攻撃のターン
    monster_attack_turn


  #回復を選んだ場合
  when 2
    #勇者の回復
    hero.hero_recovery
    puts "勇者の体力が回復しました"
    puts "勇者の体力は残り #{hero.hero_strength}です！"

    #モンスターの攻撃のターン
    monster_attack_turn

  #逃げるを選んだ場合
  when 3
    puts "無事に逃げれた！"
    break
  else
    puts "正しい数字を入力してください"
  end
end