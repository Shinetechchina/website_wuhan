module Refinery
  module ImageExt
    extend ActiveSupport::Concern
    included do
      liquid_methods :image_url, :has_image?
    end

    def has_image?
      !image.blank?
    end

    # return box size's image url
    def image_url
      self.image.try(:box_size_url)
    end

  end
end
