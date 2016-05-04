# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Item.exists?(name: "Ring of Basilius")
  it = Item.new
  it.name_en ='Ring of Basilius'
  it.legend_en = "Ring given as a reward to the greatest mages."
  it.effect_en = "Passive: Basilius Aura - Grants mana regeneration and armor in a 900 area of effect.

            Active: Toggle whether the aura affects other non-hero units.

            Multiple instances of Basilius Aura do not stack."
  it.stats_en = "+ 6 Damage
+ 1 Armor
AURA MANA REGEN: 0.65
AURA BONUS ARMOR: 2 "
  it.price = 50000
  it.name_es = 'Anillo de Basilius'
  it.legend_es = 'Anillo otorgado como recompensa a los mejores magos.' 
  it.effect_es = 'En inglés: Ring of Basilius.

Pasiva: Aura de Basilius - Otorga regeneración de maná y armadura en un área de 900.
Activa: Decide si el aura afecta a otras unidades que no sean héroes.

Múltiples instancias de Aura de Basilius no son acumulables.'
  it.stats_es = '+ 7 Daño
REGENERACIÓN DE MANÁ EN AURA: 0.65
ARMADURA ADICIONAL EN AURA: 2'
  File.open('/home/pablo/Pictures/dota2_items/ring_of_basilius_lg.png') do |f|
    it.image = f
  end
  it.save
end



unless User.exists?(email: "shopkeeper@shopping-cart.com")
  User.create!(email: "shopkeeper@shopping-cart.com", password: "password", shopkeeper: true)
end

unless User.exists?(email: "user@shopping-cart.com")
  User.create!(email: "user@shopping-cart.com", password: "password")
end

unless Item.exists?(name: "Moon Shard")
  it = Item.new
  it.name_en ='Moon Shard'
  it.legend_en = 'Said to be a tear from the lunar goddess Selemene.'
  it.effect_en = 'Use: Consume the Moon Shard to permanently gain 60 attack speed.
  Does not stack.
  Passive: Shade Sight - Grants 250 bonus night vision.'
  it.stats_en = '+ 120 Attack Speed
  SHADE BONUS NIGHT VISION: 250
  CONSUME ATTACK SPEED: 60'
  it.price = 400000
  it.name_es = 'Esquirla Lunar'
  it.legend_es = 'Se dice que es una lágrima de la diosa lunar Selemene.'
  it.effect_es = 'En inglés: Moon Shard.

  Uso: Consume la Esquirla Lunar para ganar permanentemente 60 de velocidad de ataque. No es acumulable.
  Pasiva: Luz en la Oscuridad - Otorga una bonificación de 250 de visión nocturna.'
  it.stats_es = '+ 120 Velocidad de ataque
  VISIÓN NOCTURNA ADICIONAL: 250
  VELOCIDAD DE ATAQUE TRAS CONSUMIR: 60'
  File.open('/home/pablo/Pictures/dota2_items/moon_shard_lg.png') do |f|
    it.image = f
  end
  it.save
end

unless Item.exists?(name: "Glimmer Cape")
  it = Item.new
  it.name_en ='Glimmer Cape'
  it.legend_en = 'The stolen cape of a master illusionist.'
  it.effect_en = 'Active: Glimmer - After a 0.6 second delay, grants invisibility and 45% magic resistance to you or a target allied unit. Can be cast while channelling.'
  it.stats_en = '+ 20 Attack Speed
  + 15% Spell Resistance
  GLIMMER FADE TIME: 0.6
  GLIMMER MAGIC RESISTANCE: 45%
  GLIMMER DURATION: 5'
  it.price = 185000
  it.name_es = 'Capa Fulgurante'
  it.legend_es = 'La capa robada de un maestro ilusionista.'
  it.effect_es = 'En inglés: Glimmer Cape.

  Activa: Destello - Tras un retardo de 0.6 segundos, otorga invisibilidad y un 45% de resistencia mágica a ti o a una unidad aliada objetivo. Se puede lanzar durante canalizaciones.'
  it.stats_es = '+ 20 Velocidad de ataque
  + 15% Resistencia a hechizos
  TIEMPO DE DESVANECIMIENTO DEL DESTELLO: 0.6
  RESISTENCIA MÁGICA POR DESTELLO: 45%
  DURACIÓN DEL DESTELLO: 5'
  File.open('/home/pablo/Pictures/dota2_items/glimmer_cape_lg.png') do |f|
    it.image = f
  end
  it.save
end

unless Item.exists?(name: "Sange and Yasha")
  it = Item.new
  it.name_en ='Sange and Yasha'
  it.legend_en = 'Sange and Yasha, when attuned by the moonlight and used together, become a very powerful combination.'
  it.effect_en = "Passive: Greater Maim - Each attack has a chance to slow the enemy's movement and attack speed for 5.0 seconds.

    Yasha-based movement speed bonuses from multiple items do not stack."
  it.stats_en = '+ 16 Damage
  + 16 Strength
  + 16 Agility
  + 16 Attack Speed
  + 16% Movement Speed
  MAIM CHANCE: 30%
  MOVEMENT SLOW MELEE: 26%
  ATTACK SLOW MELEE: 26
  MOVEMENT SLOW RANGED: 13%
  ATTACK SLOW RANGED: 13
  MAIM DURATION: 5 '
  it.price = 410000
  it.name_es = 'Sange Y Yasha'
  it.legend_es = 'Sange y Yasha, cuando se encuentran en sintonía por la luz de la luna y se utilizan juntas, se convierten en una combinación muy poderosa.'
  it.effect_es = 'En inglés: Sange and Yasha.

  Pasiva: Mutilación Grave - Cada ataque otorga la posibilidad de reducir la velocidad de movimiento y ataque del enemigo durante 5.0 segundos.

  Las bonificaciones de velocidad de movimiento de Yasha no se acumulan.'
  it.stats_es = "+ 16 Daño
  + 16 Fuerza
  + 16 Agilidad
  + 16 Velocidad de ataque
  + 16% Velocidad de movimiento
  POSIBILIDAD DE MUTILACIÓN: 30%
  MOVEMENT SLOW MELEE: 26%
  ATTACK SLOW MELEE: 26
  MOVEMENT SLOW RANGED: 13%
  ATTACK SLOW RANGED: 13
  DURACIÓN DE MUTILACIÓN: 5"
  File.open('/home/pablo/Pictures/dota2_items/sange_and_yasha_lg.png') do |f|
    it.image = f
  end
  it.save
end

unless Item.exists?(name: "Animal Courier")
  it = Item.new
  it.name_en ='Animal Courier'
  it.legend_en = 'Losing the courier is punishable by death.'
  it.effect_en = "Use: Deploy Courier - Deploys a creature to carry items to and from your team's base."
  it.stats_en = ''
  it.price = 10000
  it.name_es = 'Animal Mensajero'
  it.legend_es = 'Perder al mensajero se castiga con la muerte.'
  it.effect_es = 'En inglés: Animal Courier.

  Despliega una criatura que transporta objetos a y desde la base de tu equipo.'
  it.stats_es = ""
  File.open('/home/pablo/Pictures/dota2_items/courier_lg.png') do |f|
    it.image = f
  end
  it.save
end


