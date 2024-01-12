class Api::UsersController < ApplicationController

  def index
    query = params[:q]
    user = User.ms_search(query)

    render json: r,
           root: data,
           adapter: :json
  end

  def create
    render json: {message: "create"}, status: :ok
  end

  def update
    render json: {message: "update"}, status: :ok
  end

  def delete
    render json: {message: "delete"}, status: :ok
  end

end
