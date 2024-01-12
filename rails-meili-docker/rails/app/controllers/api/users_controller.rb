class Api::UsersController < ApplicationController

  def index
    render json: {message: "index"}, status: :ok
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
