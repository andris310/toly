module ApplicationHelper

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes['style'] = 'display: none'
    end
    content_tag('div', attributes, &block)
  end

  def is_active?(page_name)
    "active" if params[:action] == page_name
  end

end
