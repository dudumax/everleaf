class TasksController < ApplicationController
    def index
        @tasks=Task.all
    end 
    
    def show
         @task=Task.find(params[:id])
    end 
    
    def new
        @task=Task.new
    end 
    
    def create
          @task=Task.new(params[:id])
        
        if @task.save
            redirect_to tasks_path, :notice=> "Your task was saved"
        else 
            render 'new'
        end
        
    end 
    
    def edit 
        @task=Task.find(params[:id])
    end 
    
    def update
        @task= Task.find(params[:id])
        if @task.update_attributes(params[:post])
            redirect_to tasks_path , :notice => "Your user has been Updated"
        else
            render 'edit'
        end
    end 
    
    def destroy
        @task=Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path, :notice=> "Your task has been deleted"
        
    end 

end
