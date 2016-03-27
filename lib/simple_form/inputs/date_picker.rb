class DatePickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = null)
    value = object[attribute_name]

    input_html_options[:type] = 'text'

    if value.present?
      format = 'YYYY.MM.DD HH:mm'
      value = I18n.l value, format: '%Y.%m.%d %H:%M'
      input_html_options[:value] = value
      input_html_options[:class] += ['datetimepicker']
      input_html_options["data-date-format"] = format
    end

    super
  end
end
