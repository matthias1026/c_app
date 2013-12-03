require 'spec_helper'

describe "Event Pages" do
	
	subject { page }

	describe "create_event page" do
		before { visit newevent_path }

		it { should have_content ('Create Event')}
	end

	describe "event_profile page" do
		let(:event) { FactoryGirl.create(:event) }
		before { visit event_path(event) }

		it { should have_content(event.name) }
		it { should have_content(event.description) }
		it { should have_content(event.event_start) }
		it { should have_content(event.event_end) }
	end

	describe "create_event" do
		before { visit newevent_path }

		let(:submit) { "Create Event" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(Event, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name",			with: "The Great Hooplah!"
				fill_in "Description", 	with: "this event is a joke"
				fill_in "Event Start",	with: "2013-11-20"
				fill_in "Event End",	with: "2013-11-21"
			end

			it "should create an event" do
				expect { click_button submit }.to change(Event, :count).by(1)
			end
		end
	end
end