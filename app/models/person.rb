class Person < ActiveRecord::Base

	def days_paired_with pair
		field_of_days_paired_with(pair).count
	end

	def paired_today_with pair
		PairedDay.create(date: Date.today, person: self, pair: pair)
	end

	def delete_last_day pair
		last_day = field_of_days_paired_with(pair).order(date: :desc).first
		if last_day
			last_day.destroy
		end
	end

	def field_of_days_paired_with pair
		PairedDay.where("(person_id = ? AND pair_id = ?) OR (person_id = ? AND pair_id = ?)", self, pair, pair, self)
	end

	def paired_today_with? pair
		days_pared_today = PairedDay.where("((person_id = ? AND pair_id = ?) OR (person_id = ? AND pair_id = ?)) AND date = ?", self, pair, pair, self, Date.today)
		days_pared_today.count > 0
	end


	private :field_of_days_paired_with
end