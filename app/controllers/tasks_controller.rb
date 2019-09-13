class TasksController < ApplicationController
    

    def index
        
    if params[:search]
     @tasks = Task.search(params[:task][:title], params[:task][:status])
    elsif params[:sort_expired]
     @tasks=Task.sort_expired
    elsif params[:sort_priority]
     @tasks=Task.sort_priority
    elsif
     @tasks= Task.all
    end
    
    @tasks=Task.page(params[:page]).per(3)
    end 
    
    def show 
      @task=Task.find(params[:id])   
    end 
    
    def new
        @task=Task.new
    end 
    
    def create
          @task=current_user.tasks.build(task_params)
        
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
