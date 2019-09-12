class Task < ApplicationRecord
    
    
    validates :title,  presence: true, length: { maximum: 30 }
    validates :inquiry, presence: true, length: { maximum: 255 }
     

    
    enum status: { Not_started: 0, Undertaking: 1, Completed: 2 }
    
    
    scope :sort_expired, -> { order(deadline: :asc) }
    scope :search_title, ->(title) { where("title LIKE ?", "%#{ title }%") }
    scope :search_status, ->(status) { where("status = ?", status) }
    
    def self.search(title, status)
    s = status.to_i

    tasks = all

    if title.present?
      tasks = tasks.search_title(title)
    end

    if s.in?(Task.statuses.values)
      tasks = tasks.search_status(s)
    end

    tasks
    end
end
