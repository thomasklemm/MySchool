module NavigationHelper
  def active_list_item(url_parts, exact=false)
    match = if exact
      request.fullpath == url_for(url_parts)
    else
      request.fullpath.starts_with?(url_for(url_parts))
    end

    content_tag :li, class: ('active' if match) do
      yield
    end
  end
end
