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


# curl \
#  -X POST http://localhost:3000/api/users \
#  -d '{"user_system_id": "", "name": "post_name", "name_ruby": "post_name", "url": "test@example.com"}' \
#  -H "Content-Type: application/json"

# curl -X DELETE http://localhost:3000/api/users/1000070000 \

# -H "Content-Type: application/json"
