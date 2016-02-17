module ApplicationHelper
  def toastr_flash
    flash_messages = []
    flash.keys.each do |key|
      message = flash[key]
      type = 'success' if key == 'success'
      type = 'info'    if key == 'notice'
      type = 'warning' if key == 'alert'
      type = 'error'   if key == 'error'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
