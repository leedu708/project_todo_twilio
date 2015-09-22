class TodosController < ApplicationController

  def home

  end

  def index

    @todos = Todo.order('due_date IS NULL, due_date ASC')
    @todo = Todo.new

  end

  def create

    @todo = Todo.new(whitelisted_todo_params)

    if @todo.save
      flash[:success] = "New Todo Created!"
      redirect_to todos_path
    else
      flash[:danger] = "Failed to create Todo, please try again."
      render todos_path
    end

  end

  def destroy

    @todo = Todo.find(params[:id]).destroy!
    flash[:warning] = "Todo deleted."
    redirect_to todos_path

  end

  def edit

    @todo = Todo.find(params[:id])

  end

  def update

    @todo = Todo.find(params[:id])

    if @todo.update(whitelisted_todo_params)
      flash[:success] = "Todo updated!"
      redirect_to todos_path
    else
      flash.now[:danger] = "Failed to update todo, please try again."
      render :edit
    end

  end

  def complete

    @todo = Todo.find(params[:id])

    if @todo.update(whitelisted_complete_params)
      flash[:success] = "Todo completed!"
      redirect_to todos_path
    else
      flash.now[:warning] = "Failed to mark as complete, please try again."
      render todos_path
    end

  end

  def whitelisted_todo_params

    params.require(:todo).permit(:tast, :due_date, :completion_date)

  end

end
