class Phoenix 
  attr_reader :name, 
              :color, 
              :mood, 
              :pharaoh,
              :emotional_awareness
  
  def initialize(name)
    @name = name
    @color = 'golden'
    @mood = 'stoic'
    @pharaoh = nil
    @emotional_awareness = Hash.new(0)
  end

  def feels_emotion(emotion)
    @emotional_awareness[emotion] += 1
    if @emotional_awareness[emotion] == 1
      @mood = 'heated'
      @color = 'amber'
    elsif @emotional_awareness[emotion] == 2
      @color = 'scarlet'
      @mood = 'fiery'
    elsif @emotional_awareness[emotion] == 3
      @color = 'crimson'
      @mood = 'ablaze'
    elsif @emotional_awareness[emotion] == 4
      @color = 'deep violet'
      @mood = 'incandescent'
    elsif @emotional_awareness[emotion] == 5 
      rebirth
    end
  end

  def releases_tear?
    occurences = @emotional_awareness.map do |emotion, occurence|
      occurence
    end
    if occurences.include?(3)
      @pharaoh.health = true if @pharaoh 
      true
    else
      false
    end
  end

  def follows_pharaoh(pharaoh)
    @pharaoh = pharaoh
  end

  #helpers
  def rebirth
    @emotional_awareness.clear
    @color = 'golden'
    @mood = 'stoic'
    @pharaoh = nil
  end
end