require './connect_db.rb'
connect_db!

class Todo < ActiveRecord::Base

    def show
        todos = Todo.all

        todos.each do |todo|
            puts todo.todo_text
        end
    end

end

obj = Todo.new
obj.show
