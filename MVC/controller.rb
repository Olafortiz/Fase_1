#Permite cambiar y leer la informacion entre vista y modelo
require_relative 'model'
require_relative 'vista'
#class para manipular los cambios entre el MCV
class Controller
  #Cada vez que se llame la clase recivira un argv que dara el usuario y hara los cambios
  def initialize(argv)
    #crear instancia de la clase Lista de el archivo model
    @list = List.new
    #crear instancia de la clase View del archivo view
    @view = View.new
    #cada vez que se inicialize una clase correra el metodo changes
    changes(argv)
  end
  #metodo para hacer los cambios al csv dependiendo de lo que el usuario introdusca
  def changes(opcion)
    #variable que sera todo lo que el usuario quiera agregar, o el numero a borrar
    #con el join une todo eso y le da un espacio
    task_to_add = opcion[1..-1].join(' ')
    #toma el primer elemento del aray opcion
    case opcion[0]
      #si es add llama al metodo add con el parametro que se agregara
      when "add" then add(task_to_add)
      #Si es delete llama a el metodo delete le da de parametro el task como un numero entero
      when "delete" then delete(task_to_add.to_i)
      #Si es complete llama a el metodo complete le da de parametro el task como un numero entero
      when "complete" then complete(task_to_add.to_i)
        #si es index llama al index para mostrar las tareas
      when "index" then index
    end
  end
  #metodo para saber que agarrar del objeto
  #y que esta clase pueda recibir el metodo add de el model.rb
  def add(task_newest)
    #crea una instancia de tarea que llama al metodo add y crea una tarea nueva con la que el usuario quiera agregar
    @list.add(Task.new(task_newest)) 
    #muestra la tarea que agrego el usuario
    @view.adicion(task_newest)
    # @model.add(task)
  end
  #metodo para borrar una tarea de las tareas que existen
  def delete(id)
    #crea un array con los elementos en el csv
    task_array = @list.index
    #crea una variable que sera la tarea que el usuario quiere borra, tiene el "-1" para que no haya problema con el indice del array
    task_to_delete = task_array[id - 1]
    #elemina la tarea de el array que se creara
    task_array.delete(task_to_delete)
    #llama la instancia del model.rb y le aplica el metodo delete con el array sin la tarea que se queria eliminar
    @list.delete(task_array)
    #muestra que tarea se borro
    @view.suprimir(task_to_delete)
    #salto de linea
    puts
    #muestra el array con los cambios
    @view.index(task_array)
  end
  #metodo para mostrar el indice de las tareas
  def index#(array_task)
    #crea un array con las tareas en el csv
    model_index = @list.index
    #llama a el metodo index del view.rb y le aplica los cambios para mostrar
    @view.index(model_index)
  end
  #Metodo para poner si una tarea ya se completo
  def complete(task_complete)
    #crea un array con los elementos del csv
    task_array = @list.index
    #cambia el valor de la tarea que el usuario haya acabado, le pone el "-1" para que no haya problema con el indice del array. Y cambia ese valor a true
    task_array[task_complete - 1].completado = true
    #llama la instancia de list con el metodo delete para que se sobreescriba el csv con el nuevo valor de la tarea ya completada
    @list.delete(task_array)
  end
end
# el ARGV regresa los valores en un array,
#si hay espacio lo pone como otro elemento de array

Controller.new(ARGV)



