module ApplicationHelper

  # Сохдание картинки род lazy load jQuery plugin
  def lazy_image_tag(source, options = {})
    class_name = options.delete(:class) || ''

    options = options.deep_merge 'data-original' => path_to_image(source), :class => "#{class_name} lazy"

    image_tag 'loader.gif', options
  end

end
