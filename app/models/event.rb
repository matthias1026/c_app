class Event < ActiveRecord::Base
	before_save { self.name = name.downcase }
	validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false}
	validates :description, presence: true, length: { maximum: 400 }
	validates :time, presence: true
	validates :event_date, presence: true
	validate  :date_must_not_have_passed

def date_must_not_have_passed
	return unless errors.blank?
		errors.add(:event_date, "must be a current or future date") unless
		self.event_date.month >= Date.current.month && self.event_date.month >= Date.current.month
end

end