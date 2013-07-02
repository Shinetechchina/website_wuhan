Refinery::PagesController.class_eval do
  # Fix refinerycms issue - 404 page can not use "render_with_templates?"
  # This issue is solved in master branch
  public :render_with_templates?
end
