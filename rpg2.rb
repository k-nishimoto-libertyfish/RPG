#体力回復を追加する

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
    @@strength =   @@strength + 20
  end
end

#モンスタークラス
class Monster
  #モンスターの基本情報
  @@strength = 100
  @@power = 0

  #モンスターの体力を取得するメソッド
  def monster_strength
    @@strength
  end

  #モンスターの攻撃力を取得するメソッド
  def monster_power
    @@power = rand(10..20)
  end

  #モンスターが攻撃を受けた時の体力を減らすメソッド
  def monster_damage(hero_power)
    @@strength = @@strength - hero_power
  end
end

puts "モンスターが現れた！戦闘を開始します！"

while true
  #インスタンス化
  hero = Hero.new
  hero_power = hero.hero_power

  monster = Monster.new
  monster_power = monster.monster_power

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
      puts "モンスターの体力は残り #{monster.monster_strength}です！"
    end
    
    #モンスターの攻撃のターン
    puts "モンスターの攻撃! #{monster_power}のダメージを受けた"
    hero.hero_damage(monster_power)
    if hero.hero_strength <= 0
      puts "勇者は負けました。"
      break
    else
      puts "勇者の体力は残り #{hero.hero_strength}です！"
    end

  #回復を選んだ場合
  when 2
    #勇者の回復
    hero.hero_recovery
    puts "勇者の体力が20回復しました"
    puts "勇者の体力は残り #{hero.hero_strength}です！"

    #モンスターの攻撃のターン
    puts "モンスターの攻撃! #{monster_power}のダメージを受けた"
    hero.hero_damage(monster_power)
    if hero.hero_strength <= 0
      puts "勇者は負けました。"
      break
    else
      puts "勇者の体力は残り #{hero.hero_strength}です！"
    end

  #逃げるを選んだ場合
  when 3
    puts "無事に逃げれた！"
    break
  else
    puts "正しい数字を入力してください"
  end
end