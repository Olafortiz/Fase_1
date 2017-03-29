require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end

# Este es un ejemplo de test ya que los nombres de los chefs son aleatorios, este test muy probablemente fallará
# assert chef[:first_name] == 'Ferran'
# assert chef[:last_name] == 'Adria'

Meal.all
Chef.all

chef = Chef.create(first_name: "Eduard", last_name: "Fernández", email:"eduardo@gmail.com", phone:"930-028-2908 x7555", birthday:Time.now)
meal = Meal.create(name:"Crispy Decepcion", chef_id:"18", created_at:Time.now, updated_at:Time.now)
Meal.where('chef_id = 14')
Chef.where('first_name = "Athena"')

Chef.find(12)
Meal.find(3)

Chef.new(first_name:'Panchita', last_name:'Guacamole', birthday:'1987-02-01', email:'panchita@fresky.com', phone:'546-434-433', created_at:Time.now, updated_at:Time.now).save
Meal.new(name:'Frustration with guacamole', chef_id:'24', created_at:Time.now, updated_at:Time.now).save


puts "finished"
