class Api::Users::UsersController < ApplicationController

  def index
    user = User.ms_search(query_param)
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
    user = User.find(params[:id])
    user.update!(required_params)
    render json: user,
           root: 'data',
           adapter: :json
  end

  def delete
    user = User.find(params[:id])
    user.destroy!
    render json: user,
           root: 'data',
           adapter: :json
  end

  private
    def query_param
      return "" if params[:q].blank?
      params[:q]
    end

    def required_params
      params.require(:user).permit(:user_system_id, :name, :name_ruby, :url)
    end
end
