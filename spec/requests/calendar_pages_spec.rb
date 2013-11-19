require 'spec_helper'

describe "CalendarPages" do

	subject { page }

	describe "Calendar page" do
		before { visit root_path }

		it { should have_content('Calendar') }
	end
end
