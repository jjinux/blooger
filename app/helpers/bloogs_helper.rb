module BloogsHelper
  def format_body(body)
    sanitize(markdown(body)).html_safe
  end
end
