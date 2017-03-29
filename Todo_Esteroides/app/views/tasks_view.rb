class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def index(tasks)
    tasks.each_with_index do |task, index|
  
     if task.complete == true
       mark = "X" 
     else
       mark = " "
     end
     puts "#{index + 1}. [#{mark}] #{task.task}" 
    end 
	end

  def create(task)
     puts "You have added #{task}"
  end

  def delete(task)
    puts "You have deleted #{task}"
  end

  def update(task)
    puts "You have completed #{task}"
  end

  def error
    puts "You have mispelled something"
  end

end
