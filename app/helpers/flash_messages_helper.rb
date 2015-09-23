module FlashMessagesHelper

  def flash_messages
    output = ''
    flash.each do |type, message|
      output += flash_message(type, message)
    end

    raw(output)
  end

  def flash_message(type, message)
    color = type == 'notice' ? :success : :error

    raw(content_tag(:div, class: "alert alert-#{color}") do
      content_tag(:a, raw("&times;"), class: 'close', :data => {:dismiss => 'alert'}) +
      message
    end)
  end

end
