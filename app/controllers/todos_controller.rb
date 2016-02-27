class TodosController < ApplicationController
	before_action :set_todo, only: [:update, :destroy, :show]
	
	def index
		@users = current_user.admin == true ? User.all : [current_user]
	end

	def create
    user_id = current_user.admin == true ? params[:user_id] : current_user.id
    @todo = Todo.create(user_id: user_id, description: params[:description])
    render 'show', :layout => false
  end

	def update
		if @todo.update_attributes(todo_params)
			render json: {status: 'OK'}
		else
			render json: {status: 'ERROR'}
		end
	end

	def show
	end

	def destroy
		@todo.destroy
		render json: {status: 'OK'}	
	end

	private
	def set_todo
		@todo = Todo.find(params[:id])
	end

	def todo_params
		params.require(:todo).permit(:description, :user_id, :finalized)
	end
end
