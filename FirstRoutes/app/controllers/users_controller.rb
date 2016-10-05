class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
      json: user.errors.full_messages, status: :unprocessable_entity
      # If something has gone wrong, use a non-200 code to indicate this. In this case, we will return a status code of 422.
      )
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params) #update with user_params to do a mass-assignment update and save.
      render json: user
    else
      render json: user.errors.full_messages, status: unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

end
