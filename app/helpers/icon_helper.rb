module IconHelper
  # Returns a FontAwesome icon tag
  def icon_tag(types, text=nil, fixed_width=false)
    klasses = [types].flatten.map { |type| "icon-#{ type }" }
    klasses << "icon-fixed-width" if fixed_width
    icon = content_tag :i, '', class: klasses.join(' ')
    icon + ' ' + text
  end
end
