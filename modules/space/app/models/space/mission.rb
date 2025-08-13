module Space
  class Mission < ApplicationRecord
    has_many :crew_members, class_name: 'Space::CrewMember', dependent: :destroy
    has_many :equipment, class_name: 'Space::Equipment', dependent: :destroy
    belongs_to :location, class_name: 'Space::Location', optional: true
    
    validates :name, presence: true
    validates :description, presence: true
    validates :launch_date, presence: true
    validates :status, presence: true
    
    enum status: { planning: 0, active: 1, completed: 2, cancelled: 3 }
    
    scope :active, -> { where(status: :active) }
    scope :upcoming, -> { where('launch_date > ?', Time.current) }
    
    def duration_days
      return nil unless launch_date && end_date
      (end_date.to_date - launch_date.to_date).to_i
    end
    
    def is_active?
      status == 'active'
    end
  end
end 