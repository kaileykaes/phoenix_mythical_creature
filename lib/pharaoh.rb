class Pharaoh
  attr_reader :name, 
              :reputation,
              :dynastic_period,
              :phoenix, 
              :age, 
              :death

  attr_accessor  :health
  
  def initialize(name, reputation, dynastic_period, phoenix)
    @name = name
    @reputation = reputation
    @dynastic_period = dynastic_period
    @phoenix = phoenix
    @health = true
    @age = 0
    @death = false
  end

  def healthy? 
    @health
  end

  def ages
    @age += 1
    @health = false if @age >= 18
  end

  def dead? 
    @death
  end

  def dies
    @phoenix.rebirth
    @death = true
  end

  def takes_action(action)
    @phoenix.feels_emotion(action) 
  end
end
