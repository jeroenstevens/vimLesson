class TodosController < ApplicationController

  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, status: 201
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update_attributes(todo_params)
      render json: @todo, status: 200
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    head :no_content
  end

  private
  def todo_params
    params.require(:todo).permit(:title)
  end
end
