module NavigationHelper
  def active_list_item(url_parts, exact=false)
    content_tag :li, class: ('active' if active_path?(url_parts, exact)) do
      yield
    end
  end

  def list_group_link_to(*args)
    link_to(args[0], args[1], (args[2] || {}).merge(class: "list-group-item #{ 'active' if active_path?(args[1]) }"))
  end

  private

  def active_path?(url_parts, exact=false)
    if exact
      request.fullpath == url_for(url_parts)
    else
      request.fullpath.starts_with?(url_for(url_parts))
    end
  end
end
