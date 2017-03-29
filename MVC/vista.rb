#Class para visualizar los cambios a el csv
class View
  #metodo para poner cuando se añada una tarea
  def adicion(tarea)
    puts "Has añadido la tarea: #{tarea}"
  end
  #Metodo para pones cuando se borre una tarea∫  
  def suprimir(tarea)
    puts "Has borrado la tarea: #{tarea.tarea}" 
  end
  #Mostrar las tareas con su indice
  def index(array_task)
    #itera dentro de cada elemento y su indice para mostra el array en orden y con estado.
    array_task.each_with_index do |task, index|
      #compara el valor de la tarea, debe ser en string porque el csv lo cambia
      if task.completado == "true"
        #si es true pone esto
        puts "#{index + 1}. [X] #{task.tarea}"
      #si es false pone esto
      else
        puts "#{index + 1}. [ ] #{task.tarea}"
      end
    end
  end

end