Refinery::Image.class_eval do
  SMALL_SIZE_MAX = 22500
  MEDIUM_SIZE_MAX = 140000

  scope :small, where("image_width * image_height <= #{SMALL_SIZE_MAX}")
  scope :medium, where("image_width * image_height <= #{MEDIUM_SIZE_MAX}")
  scope :large, where("image_width * image_height > #{MEDIUM_SIZE_MAX}")

  def version
    area = self.image_width * self.image_height
    if area <= SMALL_SIZE_MAX
      return 'small'
    elsif area <= MEDIUM_SIZE_MAX
      return 'medium'
    else
      return 'large'
    end
  end
end
