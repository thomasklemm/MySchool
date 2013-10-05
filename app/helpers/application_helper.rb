module ApplicationHelper
  def timestamp_tag(time, opts={})
    opts[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, opts.merge(:title => time.getutc.iso8601)) if time
  end
end
