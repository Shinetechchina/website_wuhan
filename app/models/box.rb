class Box < ActiveRecord::Base
  attr_accessible :boxable, :boxable_id, :boxable_type, :position, :template, :box_set_id, :url, :expanded
  belongs_to :boxable, polymorphic: true
  belongs_to :box_set

  # if you want to redirct to back, please set url is "#back" or "/#back"
  before_save :improve_url

  BOXABLE_TYPES = ['Refinery::Staffs::Staff',
                   'Refinery::Technologies::Technology',
                   'Refinery::Shinetech::Client',
                   'Refinery::Services::Service',
                   'Refinery::Customs::Custom']

  validates_presence_of :template, :box_set_id
  # validates_uniqueness_of :position, scope: :box_set_id
  # validates_uniqueness_of :boxable_id, scope: :boxable_type, allow_nil: true, message: "box is has already been taken"
  # validates_inclusion_of :boxable_type, in: BOXABLE_TYPES

  scope :arranged, where("position IS NOT NULL").order(:position)

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
      self.position = 1
    end
  end

  def set_template
    template_name = self.boxable_type.split("::").last.downcase
    self.template = template_name
  end

  def template_path
    "boxes/#{template}"
  end

  def improve_url
    url = self.url
    if url.present? and url.first != '/'
      self.url = '/' + url
    end
  end
end
