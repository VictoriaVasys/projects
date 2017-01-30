## pseudocode
# ** want to do things with the first 10 digits of the cc # to make sure they relate to the last digits
# 1. Parse out the string into separate digits
# 2. Put the digits into an array as integers & pop out last digit
# 3. Iterate over the array from the end (array.reverse), multiplying every other by 2
  # if the number is > 9, split it
# 4. Sum the array with "reduce"
# 5. If (the popped number + the sum % 10) == 10, the card is valid!


class CreditCheck
  attr_reader :acct_num, :check_num
  def initialize(acct_num)
    @acct_num = acct_num
  end

  def is_valid?
    if partial_sum % 10 + @check_num == 10 || partial_sum % 10 + @check_num == 0
      "The number is valid!"
    else
      "The number is invalid!"
    end
  end
  
  def partial_sum
    partial_digits_manipulated.flatten.reduce(:+)
  end

  def partial_digits_manipulated
    @check_num = acct_digits.pop
    @partial_digits_manipulated = []
    @acct_digits.reverse.each_with_index do |digit, index|
      if index.even?
        digit *= 2
        if digit > 9
          digit = digit.to_s.split(//).map(& :to_i)
        end
      end
      @partial_digits_manipulated << digit
    end
    @partial_digits_manipulated
  end
  
  def acct_digits
    @acct_digits = @acct_num.split(//).map do |string| 
      string.to_i # found out this enumeration can be shortened to.map(& :to_i); used it above
    end
  end
end

test_1 = CreditCheck.new("5541801923795240")
puts test_1.is_valid?
test_2 = CreditCheck.new("4024007106512380")
puts test_2.is_valid?
test_3 = CreditCheck.new("6011797668868728")
puts test_3.is_valid?
test_4 = CreditCheck.new("5541808923795240")
puts test_4.is_valid?
test_5 = CreditCheck.new("4024007136512380")
puts test_5.is_valid?
test_6 = CreditCheck.new("6011797668867828")
puts test_6.is_valid?

