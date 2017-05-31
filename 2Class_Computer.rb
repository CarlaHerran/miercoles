# CLASE COMPUTER --------------------- EJERCICIO 2 ------- MIÉRCOLES
# class Computer 
#   attr_accessor :color
#   def initialize 
#     @color
#   end
#   def self.color
#     @color = color
#   end  
# end

# mac = Computer.new
# #test
# mac.color = "Platinum"
# p mac.color
# #=>"Platinum"

# QUE PROCESADOR TIENE LA COMPU? ------ EJERCICIO 3 ------ MIERCOLES
class Computer
  attr_reader :processor
  def initialize
    @processor = "Intel"
  end
  def self.processor
    @processor = processor
  end
end    

  mac = Computer.new
#test
p mac.processor == "Intel"
#=>"Intel"
p mac.processor == "AMD"
#=>...undefined method `processor='...
