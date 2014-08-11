require 'active_support/core_ext/date/conversions'

require_relative "./spec_helper.rb"

def s2d(string_date)
  Date.strptime(string_date, "%b-%d-%Y")
end

describe Scheduler do
	let(:sched) {Scheduler.new}
	let(:target_date) {"nov-25-2013"}
	let(:target_date_bin) { s2d(target_date) }

	describe "Single day scheduler"	do
		it "knows date for first event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday], number: 1)
			a_date = sched.event_date_by_index 0
			expect(a_date).to eq target_date_bin
		end

		it "knows date for second event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday] ,number: 2)
			a_date = sched.event_date_by_index 1
			expect(a_date).to eq target_date_bin + 7
		end
	end

	describe "Double day scheduler" do
		it "knows date for first event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday, :tuesday] ,number: 1)
			a_date = sched.event_date_by_index 0
			expect(a_date).to eq target_date_bin
		end

		it "knows date for second event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday, :tuesday] ,number: 2)
			a_date = sched.event_date_by_index 1
			expect(a_date).to eq target_date_bin + 1
		end

		it "knows date for third event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday, :tuesday] ,number: 3)
			a_date = sched.event_date_by_index 2
			expect(a_date).to eq target_date_bin + 7
		end

		it "knows date for fourth event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday, :tuesday] ,number: 4)
			a_date = sched.event_date_by_index 3
			expect(a_date).to eq target_date_bin + 7 + 1
		end
	end

	describe "Tripple day scheduler" do
		it "knows date for first event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday, :wednesday, :friday], number: 1)
			a_date = sched.event_date_by_index 0
			expect(a_date).to eq target_date_bin
		end
		it "knows date for second event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday, :wednesday, :friday], number: 2)
			a_date = sched.event_date_by_index 1
			expect(a_date).to eq target_date_bin + 2
		end

		it "knows date for third event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday, :wednesday, :friday], number: 3)
			a_date = sched.event_date_by_index 2
			expect(a_date).to eq target_date_bin + 4
		end
		it "knows date for fourth event" do
			sched.setup_from_args(start: target_date, weekdays: [:monday, :wednesday, :friday], number: 4)
			a_date = sched.event_date_by_index 3
			expect(a_date).to eq target_date_bin + 7
		end


	end
end


