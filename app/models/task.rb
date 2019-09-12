class Task < ApplicationRecord
    belongs_to :user
    
    validates :title,  presence: true, length: { maximum: 30 }
    validates :inquiry, presence: true, length: { maximum: 255 }
    validates :deadline,  presence: true
    validates :priority,  presence: true
    validates :status,  presence: true
     

    
    enum status: { Not_started: 0, Undertaking: 1, Completed: 2 }
    enum priority: {high: 0, medium: 1, low: 2}
    
    scope :sort_expired, -> { order(deadline: :asc) }
    scope :search_title, ->(title) { where("title LIKE ?", "%#{ title }%") }
    scope :search_status, ->(status) { where("status = ?", status) }
    scope :sort_priority, ->{order(priority: asc)}
    
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
