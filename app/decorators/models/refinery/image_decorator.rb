Refinery::Image.class_eval do
  def version
    area = self.image_width * self.image_height
    if area <= 22500
      return 'small'
    elsif area <= 140000
      return 'medium'
    else
      return 'large'
    end
  end
end
