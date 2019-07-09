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

  def between(start_at, end_at)
    s = if start_at.present?
      l(start_at, format: :long)
    end
    s ||= '---'

    e = if end_at.present?
      l(end_at, format: :long)
    end
    e ||= '---'

    "#{s} - #{e}"
  end
end
