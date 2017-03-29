class Horno 

 @@oven_time = 0
  
  def initialize(tortas) 
    @tortas = tortas
  end

 def time_in_oven
    
    @tortas.each do |torta|
      time_torta = torta.time
      puts name_torta = torta.type

        while @@oven_time < 11

          if @@oven_time == 0
           p "cruda"
         elsif @@oven_time < time_torta
           p "casi lista"
         elsif @@oven_time == time_torta
           p "lista"
         elsif @@oven_time > time_torta
           p "quemada"
          end 
         @@oven_time += 1
       end
       @@oven_time = 0
     end
     p
   end

end

class Torta

  attr_accessor :time, :type

  def initialize(type)
    @type = type
    if type == "jamon"
      @time = 5
    elsif type == "milanesa"
      @time = 7
    elsif type == "pastor"
      @time = 9
    end
        
  end

end

# p tortas_1 = Tortas.new("jamon")
# p tortas_2 = Tortas.new("milanesa")
# p tortas_3 = Tortas.new("pastor")
horno = Horno.new([Torta.new("jamon"), Torta.new("milanesa"), Torta.new("pastor")])
# p tortas_1.torta_jamon
# p tortas_2.torta_pastor
# p tortas_3.tortas_milanesa
puts horno.time_in_oven