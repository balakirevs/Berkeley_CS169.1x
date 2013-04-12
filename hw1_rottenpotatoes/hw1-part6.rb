class Numeric

  attr_accessor :base_currency

  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing method_id
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in currency
    target_currency = currency.to_s.gsub( /s$/, '')
    if target_currency != 'dollar'
      self / @@currencies[target_currency]
    else
      self
    end
  end

end

class String
  def palindrome? ; self.gsub(/\W/, '').downcase == self.gsub(/\W/, '').downcase.reverse ; end
end

module Enumerable
  def palindrome?
    arr = [] ; self.each { |e| arr << e } ; arr.flatten.reverse == arr.flatten
  end
end

p 2.rupee.in(:dollar)   # 0.038
p 3.yen.in(:dollar)     # 0.039
p 6.euro.in(:dollar)    # 7.755
p 2.rupees.in(:dollars) # 0.038
p 3.yen.in(:dollars)    # 0.039
p 6.euros.in(:dollars)  # 7.755
p 5.rupees.in(:yen)     # 7.3


puts

p "hello World!".palindrome?    # false

puts

p [1,2,3,2,1].palindrome?       # true
p (1..2).palindrome?            # false
p (1...9).palindrome?           # false