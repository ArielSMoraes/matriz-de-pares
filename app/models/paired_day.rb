class PairedDay < ActiveRecord::Base
  belongs_to :person, :class_name => "Person"
  belongs_to :pair, :class_name => "Person"
end
