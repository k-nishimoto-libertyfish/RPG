class Hero
  @@strength = 120
  @@power = 0

  def hero_strength
    @@strength
  end

  def hero_power
    @@power = rand(10..25)
  end

  def hero_damage(monster_power)
    @@strength = @@strength - monster_power
  end
end

class Monster
  @@strength = 100
  @@power = 0

  def monster_strength
    @@strength
  end

  def monster_power
    @@power = rand(10..20)
  end

  def monster_damage(hero_power)
    @@strength = @@strength - hero_power
  end
end

puts "モンスターが現れた！戦闘を開始します！"

while true
  hero = Hero.new
  hero_power = hero.hero_power

  monster = Monster.new
  monster_power = monster.monster_power

  puts "何をしますか？"
  puts "戦う   [1]"
  puts "逃げる [2]"
  choice_hero = gets.to_i

  case choice_hero
  when 1
    puts "勇者の攻撃! #{hero_power}のダメージを与えた"
    monster.monster_damage(hero_power)
    if monster.monster_strength <= 0
      puts "戦闘に勝ちました！"
      break
    else
      puts "モンスターの体力は残り #{monster.monster_strength}です！"
    end
    
    puts "モンスターの攻撃! #{monster_power}のダメージを受けた"
    hero.hero_damage(monster_power)
    if hero.hero_strength <= 0
      puts "勇者は負けました。"
      break
    else
      puts "勇者の体力は残り #{hero.hero_strength}です！"
    end
  when 2
    puts "無事に逃げれた！"
    break
  else
    puts "正しい数字を入力してください"
  end
end