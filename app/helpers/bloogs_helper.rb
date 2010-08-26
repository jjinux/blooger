module BloogsHelper
  def format_body(body)
    markdown(body).html_safe
  end
end
