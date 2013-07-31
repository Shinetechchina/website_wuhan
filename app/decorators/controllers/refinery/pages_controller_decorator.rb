Refinery::PagesController.class_eval do
  # Fix refinerycms issue - 404 page can not use "render_with_templates?"
  # This issue is solved in master branch
  public :render_with_templates?

  layout -> (controller) { controller.request.xhr? ? false : 'application' }

  skip_before_filter :find_page, only: [:home, :blog]

  def home
    @clients = Refinery::Shinetech::Client.limit(3)
    @services = Refinery::Services::Service.limit(3)

    @technologies = Refinery::Technologies::Technology.limit(3)
    @staffs = Refinery::Staffs::Staff.order('name').limit(3)

    if has_tag?
      @technologies = @technologies.tagged_with(tag, any: true)
      @staffs = @staffs.tagged_with(tag, any: true)
    end

    if request.xhr?
      render layout: false
    end
  end

  def blog
    @blogs = Blog.all
  end
end
