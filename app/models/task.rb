class Task < ApplicationRecord
    paginates_per 3
    belongs_to :user
    
    validates :title,  presence: true, length: { maximum: 30 }
    validates :inquiry, presence: true, length: { maximum: 255 }
    validates :deadline,  presence: true
    validates :priority,  presence: true
    validates :status, presence: true
    validates :user_id, presence: true
     

    
    enum status: { Not_started: 0, Undertaking: 1, Completed: 2 }
    enum priority: {high: 0, medium: 1, low: 2}
    
   
    
  
    
end
