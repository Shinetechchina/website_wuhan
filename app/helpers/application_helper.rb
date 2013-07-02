module ApplicationHelper
  def render_liquid_page_body(page, context)
    Liquid::Template.parse(page.content_for(:body)).render(context).html_safe
  end
end
