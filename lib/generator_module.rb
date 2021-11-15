module Generator

  def today
    array = []
    current_date = Date.today
    array << current_date.month
    array << current_date.day
    array << current_date.year.to_s[2..3]
    @date = array.join
  end

  def generate_key
    num = []
    5.times do
      num.push(rand(0..9))
    end
    @key = num.join
  end
end
