  class UsersController < ApplicationController
  
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end
    
    def show
        @user = User.find(params[:id])
        @posts = @user.posts.order('created_at DESC')
        @comment = Comment.new
    end

    def create
        @user = User.new(user_params)

        respond_to do |format|
      if @user.save

        MyMailer.tester_email(@user).deliver_later

        format.html { redirect_to users_path, notice: 'User was successfully created. Please sign in below.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

        # if User.create(user_params).valid?
        #     flash["alert-success"] = "You have been registered"
        #     redirect_to users_path
        # else
        #     flash["alert-warning"] = "Unable to register you"
        #     redirect_to new_user_path
        # end
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update
  #       respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  # end
        @user = User.find(params[:id])
        if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation))
            redirect_to users_path
        else 
            render :edit
    end
    end

    def destroy
        @user.destroy
        respond_to do |format|
        format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
        end
        # @user = User.find(params[:id])
        # @user.destroy
        # redirect_to users_path
    end

private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
