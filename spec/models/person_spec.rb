require 'rails_helper'

RSpec.describe Person, :type => :model do
	
	before(:each) do
		@ariel = Person.where(name: "Ariel").first
    @patricia = Person.where(name: "Patrícia").first
    @aline = Person.where(name: "Aline").first
    @lucas = Person.where(name: "Lucas").first
	end

	it "insert one day of pairing to Ariel with Patricia" do
		days_paired = @ariel.days_paired_with(@patricia)

		@ariel.paired_today_with(@patricia)

		ariel_days_bd_paired = @ariel.days_paired_with(@patricia)
		expect(ariel_days_bd_paired).to be(1)
	end

	it "get the number of times that one person paired with ariel" do
		@ariel.paired_today_with(@aline)
		@ariel.paired_today_with(@aline)
		@ariel.paired_today_with(@aline)
		@ariel.paired_today_with(@aline)

		days_paired = @ariel.days_paired_with(@aline)

		expect(days_paired).to be(4)
	end

	it "reflect pair, when ariel pairing with lucas, both can are changed" do
		@ariel.paired_today_with(@lucas)
		@ariel.paired_today_with(@lucas)
		@ariel.paired_today_with(@lucas)

		days_paired = @lucas.days_paired_with(@ariel)

		expect(days_paired).to be(3)
	end

	it "delete the last day of paring of one pair" do
		@ariel.paired_today_with(@lucas)
		@ariel.paired_today_with(@lucas)
		@ariel.paired_today_with(@lucas)

		@ariel.delete_last_day(@lucas)
		days_paired = @ariel.days_paired_with(@lucas)

		expect(days_paired).to be(2)
	end

end
