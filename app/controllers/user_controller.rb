class UserController < ApplicationController
  
  layout false

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new({:url => "http://www.", :key => nil})
  end

  def create
    @user = User.new(user_params)

    if @user.valid?

    	if @user.key.nil? || !User.find_by_key(@user.key).nil?
        @user.save
        @user.key = @user.id.to_s(16)
    	end

    	@user.save

      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def delete
    User.find(params[:user_id]).destroy
    redirect_to(:action => 'index')
  end

  def redirect
  	redirect_to(User.find_by_key(params[:key]).url)
  end

  private

    def user_params
      params.require(:user).permit(:key,:url)
    end

end
