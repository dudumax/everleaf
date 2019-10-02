class TasksController < ApplicationController
     

    def index
        @q=Task.ransack(params[:q])
        @tasks= @q.result
        
    end 
    
    def show 
      @task=Task.find(params[:id])   
    end 
    
    def new
        @task=Task.new
    end 
    
    def create
          @task=current_user.tasks.build(task_params)
          @task.user= User.find(params[:id])
        
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
        
        if @task.update_attributes(task_params)
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
    
    
    private
    
    def task_params
       params.require(:task).permit(:attribute, :title, :inquiry, :deadline,:search, :status)
    end
    
     

end
