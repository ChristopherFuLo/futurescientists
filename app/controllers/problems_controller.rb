class ProblemsController < ApplicationController

  def index
end

  def show
    id = params[:id] 
    @problem = Problem.find(id)
    puts @problem
    puts @problem.summary
    user_id = @problem.user_id
    puts user_id
    @user = User.find(user_id)
    puts @user
  end

  def edit

  end

  def destroy

  end

end
