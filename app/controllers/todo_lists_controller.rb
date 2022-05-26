class TodoListsController < ApplicationController
  before_action :find_todo_list, only: [:show, :update, :destroy]

  def index
    @todo_lists = TodoList.all

    render json: @todo_lists
  end

  def create
    @todo_list = TodoList.create(todo_list_params)

    render json: @todo_list
  end

  def show
    render json: @todo_list
  end

  def update
    @todo_list.update(todo_list_params)

    render json: @todo_list
  end

  def destroy
    @todo_list.destroy

    render json: @todo_list
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:name)
  end


  def find_todo_list
    @todo_list = TodoList.find(params[:id])
  end
end
