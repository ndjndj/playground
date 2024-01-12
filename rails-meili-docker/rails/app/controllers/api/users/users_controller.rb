class Api::Users::UsersController < ApplicationController

  def index
    query = params[:q]
    query = "" if query.blank?

    user = User.ms_search(query)

    render json: user,
           root: 'data',
           adapter: :json
  end

  def create
    user = User.create!(required_params)
    render json: user,
           root: 'data',
           adapter: :json
  end

  def update
    render json: {message: "update"}, status: :ok
  end

  def delete

    render json: {message: "delete"}, status: :ok
  end

  private
    def required_params
      params.require(:user).permit(:name, :name_ruby, :url)
    end
end
