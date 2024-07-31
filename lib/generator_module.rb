module Generator

  # convert date into an integer
  # def date_to_num
  #   date.to_s
  #   date = date.day.to_s + date.month.to_s + date.
  #   binding.pry
  # end

  # take the integer form of date then square it, then turn to string
  def squared
    (today * today).to_s
  end

  # create today's date if date is not given
  def today
    array = []
    current_date = Date.today
    # array << current_date.month
    array << current_date.month.to_s.rjust(2, '0')
    # array << current_date.dayDate.today
    array << current_date.day.to_s.rjust(2, '0')
    array << current_date.year.to_s[2..3]
    @date = array.join.to_i
  end

  # generate a key if key is not given
  def generate_key
    date_to_num = []
    5.times do
      date_to_num.push(rand(0..9))
    end
    @key = date_to_num.join
  end


  # combine key and date values together to create the A, B, C, D shifts
  def total_shift(key)
     @shifts[:a_shift] = (key.a_key.to_i + @offset.a_offset.to_i)
     @shifts[:b_shift] = (key.b_key.to_i + @offset.b_offset.to_i)
     @shifts[:c_shift] = (key.c_key.to_i + @offset.c_offset.to_i)
     @shifts[:d_shift] = (key.d_key.to_i + @offset.d_offset.to_i)
     @shifts
   end
end
