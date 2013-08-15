module ApplicationHelper
  def box_tag(box, content_or_options_with_block = nil, options = nil, &block)
    if block_given?
      options = content_or_options_with_block || {}

      options[:id] = "box-#{box.id}"
      options[:data] ||= {}
      options[:class] ||= []
      options[:class].unshift 'box'

      # box id
      options[:data]['box-id'] = box.id

      # boxable
      if box.boxable
        options[:class] << "box-#{box.boxable_type.demodulize.underscore.dasherize}"
        options[:data]['boxable-id'] = box.boxable_id
      end

      # expandable
      expandable = options.delete :expandable
      expand_cols = options.delete :expand_cols
      if expandable
        options[:class] << 'box-expandable'

        options[:data]['expand-cols'] = expand_cols
        if box.expanded?
          options[:class] << 'box-expanded'
          options[:data]['ss-colspan'] = expand_cols
          options[:data]['collapse'] = false
        end
      end

      # cols
      cols = options.delete :cols
      if cols
        options[:data]['ss-colspan'] = cols
      end

      # url
      tag_name = :div
      if box.url.present?
        tag_name = :a
        options[:href] = box.url
        options[:class] << 'route'
      end

      content_tag tag_name, options, &block
    else
      raise 'not complete'
    end
  end
end
