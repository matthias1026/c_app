require 'spec_helper'

describe Event do
	
	before do
		@event = Event.new(name: "Example Event", event_start: DateTime.new(2013, 11, 20, 12, 0),
			event_end: DateTime.new(2013, 11, 21, 12, 0), description: "Ex Desc")
	end

	subject { @event }

	it { should respond_to(:name) }
	it { should respond_to(:event_start) }
	it { should respond_to(:event_end) }
	it { should respond_to(:description) }

	it { should be_valid }

	describe "when name is not present" do
		before { @event.name = " " }
		it { should_not be_valid }
	end

	describe "when description is not present" do
		before { @event.description = " " }
		it { should_not be_valid }
	end

	describe "when time is not present" do
		before { @event.event_start = nil }
		it { should_not be_valid }
	end

		describe "when event_date is not present" do
		before { @event.event_end = nil }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @event.name = "a"*51 }
		it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
			event_with_same_name = @event.dup
			event_with_same_name.name = @event.name.upcase
			event_with_same_name.save
		end

		it { should_not be_valid }
	end

	describe "when day already passed" do
		before do
			@event.event_date = DateTime.new(11,16,2013)
		end

		it { should_not be_valid }
	end

end
