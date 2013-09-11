class Icon < ActiveRecord::Base
  attr_accessible :staff_id, :title
  validates_presence_of :staff_id, :title
  validates_uniqueness_of :title, scope: :staff_id
  belongs_to :refinery_staff, foreign_key: :staff_id, class_name: 'Refinery::Staffs::Staff'
end
