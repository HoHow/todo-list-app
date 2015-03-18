class TodosController < ApplicationController
  before_action :authenticate_todo!
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if@todo.save
    redirect_to :action => 'index'
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])

  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
 
    redirect_to todos_path
  end

  def index
    @todos = Todo.all 
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  def abc

  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit_multiple
    @todos = Todo.find(params[:id])
  end

  def destroy_multiple
    
      Todo.destroy(params[:todos])

     respond_to do |format|
       format.html{redirect_to todos_path}
       format.json{ head :no_content} 
    end
  end

  def calender
    
  end

  

  private

  def todo_params
    params.require(:todo).permit(:item)
  end

end
