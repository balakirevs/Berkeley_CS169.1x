class CartesianProduct
  include Enumerable
  
  def initialize arry1, arry2
  	@arry1, @arry2 = arry1, arry2
  end

  def each
    unless @arry1.empty? && @arry2.empty?
      resulting_array = []
      @arry1.each do |a1|
      	resulting_array << @arry2.each { |a2| yield [a1] << a2 }
      end
    end
  end

end



# => TEST CASES

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
puts
c = CartesianProduct.new([:a,:b], (1..5).to_a)
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
puts
c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty