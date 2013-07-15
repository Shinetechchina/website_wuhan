module ApplicationHelper
  def render_liquid_page_body(page, context)
    Liquid::Template.parse(page.content_for(:body)).render(context).html_safe
  end

  def fill_with_boxes(num)
    re = ""
    num.times do
      re << content_tag(:div, nil, class: 'box')
    end
    re.html_safe
  end
end
