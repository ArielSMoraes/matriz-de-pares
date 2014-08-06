require 'rails_helper'

RSpec.describe Person, :type => :model do
	
	it "run tests plz" do
		expect(Person.all.count).to be(10)
	end

end
