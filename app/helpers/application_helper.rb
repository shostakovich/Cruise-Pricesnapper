module ApplicationHelper
  def sortable(column, title =nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    css_class_suffix = sort_direction == "asc" ? "headerSortDown" : "headerSortUp"
    css_class = column == sort_column ? "header " + css_class_suffix : "header"

    content_tag "th", :class => css_class do
      link_to title, :sort => column, :direction => direction
    end
  end

  def form_field(f, field, label=nil)
  	label = label || field
	  content_tag(:div,
	  	f.label(field, label, ) +
	  	content_tag(:div,
	  		f.text_field(field, :class => "span9"),
	  		:class => "input"),
	  	:class => "clearfix")
  end
end
