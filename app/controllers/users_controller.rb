class UsersController < ApplicationController
    
    def index
        @users=User.all
    end 
    
    def show
        @user=User.find(params[:id])
    end 
    
    def new
        @user= User.new
    end 
    
    
    def create
        @user= User.new(params[:post])
        
        if @user.save
            redirect_to users_path, :notice=> "Your user was saved"
        else
            render 'new'
        end
    end 
    
    
    def edit
        @user=User.find(params[:id])
        
    end 

    
    def update
        @user= User.find(params[:id])
        if @user.update_attributes(params[:post])
            redirect_to users_path , :notice => "Your user has been Updated"
        else
            render 'edit'
        end
    end 
    
    def destroy
        @user=User.find(params[:id])
        @user.destroy
        redirect_to users_path, :notice=> "your user has been deleted"
    end 

end
