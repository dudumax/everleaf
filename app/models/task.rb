class Task < ApplicationRecord
    
    
    validates :title,  presence: true, length: { maximum: 30 }
    validates :inquiry, presence: true, length: { maximum: 255 }
    
    scope :deadline, -> { order(deadline: :desc) }
end
