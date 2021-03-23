class Job < ApplicationRecord
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  def self.search(search)
    		if search
      		#where("title LIKE ?", "%#{search}%")
    			where("title LIKE :search OR description LIKE :search", search: "%#{search}%")
    		else
      		all
      	end
      end

  has_many :resumes

  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }
end
