class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_name: params[:user_name], 
      password: params[:password], 
      level: 0.0, 
      birthday: "2010-03-02",
      real_name: params[:real_name], 
      address: params[:address], 
      email: params[:email], 
      gender: params[:gender])

    if @user.save
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update real_name: params[:real_name],
    address: params[:address],
    email: params[:email]

    redirect_to user_url(@user.id)
  end

  #def destroy
  #end
end