Refinery::PagesController.class_eval do
  # Fix refinerycms issue - 404 page can not use "render_with_templates?"
  # This issue is solved in master branch
  public :render_with_templates?

  layout -> (controller) { controller.request.xhr? ? false : 'application' }

  skip_before_filter :find_page, only: [:home, :blog, :boxes]

  caches_action :blog, expires_in: 30.minutes, cache_path: :post_cache_path.to_proc

  def home
    @boxes = Box.arranged
    #@clients = Refinery::Shinetech::Client.limit(3)
    #@services = Refinery::Services::Service.limit(3)
    #@technologies = Refinery::Technologies::Technology.limit(3)
    #@staffs = Refinery::Staffs::Staff.order('name').limit(3)

    if has_tag?
      @technologies = @technologies.order_by_tag(tag)
      @staffs = @staffs.order_by_tag(tag)
    end

    if request.xhr?
      render layout: false
    end
  end

  def blog
    @blogs = Blog.filte_topic('ShineNext')
  end

  def post_cache_path
    if request.xhr?
      "#{request.url}.js"
    else
      "#{request.url}.html"
    end
  end

end
