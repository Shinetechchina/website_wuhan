class Box < ActiveRecord::Base
  attr_accessible :boxable_id, :boxable_type, :position, :template, :tag_id
  belongs_to :boxable, polymorphic: true

  BOXABLE_TYPES = ['Refinery::Staffs::Staff', 'Refinery::Technologies::Technology', 'Refinery::Shinetech::Client', 'Refinery::Services::Service']

  validates_presence_of :template, :position
  validates_uniqueness_of :position
  validates_inclusion_of :boxable_type, in: BOXABLE_TYPES, allow_nil: true

  scope :arranged, where("position IS NOT NULL").order(:position)
  scope :statical, where(boxable_type: nil)

  def boxable_type_name
    if (boxable_type = self.boxable_type).present?
      boxable_type.split('::').last
    else
      nil
    end
  end

  def boxable_title
    if (boxable = self.boxable).present?
      boxable.try(:name)||boxable.try(:title)
    else
      nil
    end
  end

  def add_position
    if Box.last.present?
      self.position = Box.last.position + 1
    else
      self.postion = 1
    end
  end

  def set_template
    template_name = self.boxable_type.split("::").last.downcase
    self.template = "boxes/#{template_name}"
  end

end
