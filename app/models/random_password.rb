class RandomPassword
  def initialize(length = 32)
    @length = length
  end

  def generate
    (1..@length).map{||
      random_letter
    }.join
  end

  def random_letter
    source_array[rand(source_array.size)]
  end

  def source_array
    @@source_array ||= (("a".."z").to_a + ("A".."Z").to_a)
  end
end
