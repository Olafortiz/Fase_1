class TasksController

  def initialize(input)
    puts "*" * 50
    @command = input[0]
    @view = TasksView.new
    menu(input) 
  end

  def menu(input)
    task = input[1..-1].join(' ')
    case @command
      when "add" then add(task)
      when "index" then index
      when "delete" then delete(task)
      when "complete" then complete(task)
      when "update" then update(task)
      else 
        error
    end
  end

  def add(task)
    Task.create(task: task)
    @view.create(task)
  end

  def index
   tasks = Task.all
   @view.index(tasks)
  end

  def delete(input)
    Task.all.each_with_index do |task, index|
      if input.to_i == index + 1
        var = task.destroy
        @view.delete(var.task)
      end
    end

  end

  def complete(input)
   Task.all.each_with_index do |task, index|
      if input.to_i == index + 1
        task.update_attributes(complete: true)
        @view.update(task.task)
      end
    end
  end

  def error
    @view.error
  end

end
