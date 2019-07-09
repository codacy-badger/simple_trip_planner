module ApplicationHelper
  def flash_class(key)
    case key
    when 'notice', 'success'
      'success'
    when 'error', 'alert'
      'danger'
    else
      'primary'
    end
  end
end
