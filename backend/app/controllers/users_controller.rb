class UsersController < ApplicationController
  before_action :set_user, only: [:index,:show, :update, :destroy]

  # GET /users
  def index
    render json: @user
  end

  # POST /login
  def login

    @user  = User.find_by email: user_login_params["email"]

    unless @user
      return render json: {error: "User not found"}
    end

    unless !@user.authenticate user_login_params["password"]
      return render json: {user: @user, token: encode_token({user_id: @user.id})}
    end

    render json: {error: "incorrect email/password"}
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def user_login_params
      params.require(:user).permit(:email, :password)
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :username, :password, :email)
    end
end
