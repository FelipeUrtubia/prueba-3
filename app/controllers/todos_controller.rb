class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end


  def create
    todo = Todo.new(todo_params)
    todo.completed = false
    if todo.save
      redirect_to todos_path, notice: 'El registro se guardó con exito!'
    else
      redirect_to todos_new_path, notice: 'No se pudo crear el ToDo...'
    end
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path, notice: 'El ToDo se ha actualizado de forma exitosa!'
    else
      redirect_to edit_todo_path(@todo), notice: 'No se ha podido actualizar...'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path, notice: 'El registro se ha eliminado exitosamente'
  end

  def complete
    @todo = Todo.find(params[:id])
    if @todo.completed == false
      @todo.completed = true
      redirect_to todos_path, notice: 'El estado se ha cambiado a completado!'
    else
      @todo.completed = false
      redirect_to todos_path, notice: 'El estado se ha cambiado a pendiente!'
    end
    @todo.save
  end

  def list
    @todos = Todo.all
  end

  private
    def todo_params
      params.require(:todo).permit(:description)
    end
end
