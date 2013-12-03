class Event < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false}
	validates :description, presence: true, length: { maximum: 400 }
	validates :event_start, presence: true
	validates :event_end, presence: true
	validate  :date_must_not_have_passed
	validate  :end_must_be_after_start

def date_must_not_have_passed
	return unless errors.blank?
		errors.add(:event_start, "must be a current or future date") unless
		self.event_start >= DateTime.current
end

def end_must_be_after_start
	return unless errors.blank?
	errors.add(:event_end, "must be a time after the start of the event") unless
	self.event_start <= self.event_end
	end

end