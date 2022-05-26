class TodosController < ApplicationController
  before_action :find_todo_list, only: [:index, :create]
  before_action :find_todo, only: [:show, :update, :destroy]

  def index
    @todos = @todo_list.todos

    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.todo_list = @todo_list
    @todo.save

    render json: @todo
  end

  def show
    render json: @todo
  end

  def update
    @todo.update(todo_params)

    render json: @todo
  end

  def destroy
    @todo.destroy

    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:content, :order)
  end

  def find_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def find_todo
    @todo = Todo.where(todo_list_id: params[:todo_list_id], id: params[:id]).first

    if @todo.nil?
      render json: { message: "Record not found!" }, status: 404
    end
  end
end
