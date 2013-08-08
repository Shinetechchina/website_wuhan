require 'active_support/concern'

module Taggable
  extend ActiveSupport::Concern

  module ClassMethods
    def order_by_tag(tag)
      if tag.present?
        order("tags @> '{#{tag}}' desc")
      else
        scoped
      end
    end
  end

  def tags=(value)
    if value.blank?
      value = []
    elsif value.is_a?(String)
      value = value.split(/\s*,\s*/)
    end
    write_attribute(:tags, value)
  end
end
