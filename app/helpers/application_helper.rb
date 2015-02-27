module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

  def context_options
    [ 
      "Direct first line operations (e.g. service delivery, manufacturing, assembly)",
      "Indirect first line operations that support the above (e.g. administration or ICT)",
      "Supervising a small team doing either of the above (e.g. supervisor / team leader role)",
      "Inspecting / auditing",
      "Monitoring financial expenditure and reporting",
      "Managing a department or function",
      "Leading a department or function",
      "Policy making",
      "Leading whole organisation vision and strategy"
    ]
  end
  
end
