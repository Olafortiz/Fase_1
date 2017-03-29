#llamar al csv para crear un archivo con las tareas que se haran
require 'csv'
#class para crear objetos tarea
class Task
  #permitir cambiar el valor de la tarea y de el estado
  attr_accessor :tarea, :completado
  #metodo para que cada vez que se cree un objeto tengo el nombre de la tarea con un estado false de que aun no se ha completado
  def initialize(tarea, completado=false)
    @tarea = tarea
    @completado = completado
  end

end
#Class list para manipular el csv
class List
  #Crea el csv tareas y cada vez que se agregue una tarea nueva la pone abajo del el archivo gracias a el a+
  def add(task)
    CSV.open("Tareas.csv", "a+") do |csv| 
      #mete los objetos tarea con su parametro de completado
      csv << [task.tarea, task.completado]
    end
  end
  #muestra el index solo con las tareas a el usuario y las regresa en un array
  def index
    #array empty to introduce the row of the csv
    homework = []
     CSV.foreach('Tareas.csv') do |row|
      #Mete cada elemento a un array
      homework << Task.new(row[0], row[1])
    end
    #regresar el array lleno
    homework
  end
  #Metodo para sobreescribir el csv sin el elemento del array que el usuario haya querido borrar
  def delete(array_tasks)
    #se sobreescribira el csv en el mismo archivo y recibira el array con las tareas que tengas
    CSV.open('Tareas.csv', 'wb') do |csv|
      #itera dentro del array para meter las tareas a el csv y sobreescribirlo
      array_tasks.each do |task|
        #Meter cada elemento del array con su estatus a el csv y lo sobreescribira
        csv << [task.tarea, task.completado]
      end
    end
  end

end
# 
# task = Task.new("Programar")
# iteration = Iteration.new
# iteration.add(task)