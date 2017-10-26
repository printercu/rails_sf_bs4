# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'btn btn-default'
  config.boolean_label_class = nil

  # Helpers
  wrapper_options = {class: 'form-group', error_class: 'has-error'}
  label_class = 'control-label'

  horizontal_label_class = "col-sm-3 #{label_class}"
  horizontal_right_class = 'col-sm-9'
  horizontal_right_offset_class = 'offset-sm-3'


  basic_input = ->(b, type = :basic) do
    b.use :html5
    b.use :placeholder
    break if type == :boolean
    b.optional :maxlength
    b.optional :minlength
    unless type == :file
      b.optional :pattern
      b.optional :min_max
    end
    b.optional :readonly
  end

  error_and_hint = ->(b) do
    b.use :error, wrap_with: {tag: 'span', class: 'invalid-feedback'}
    b.use :hint,  wrap_with: {tag: 'small', class: 'form-text text-muted'}
  end
  # /Helpers

  config.wrappers :vertical_form, **wrapper_options do |b|
    basic_input.call(b)
    b.use :label, class: label_class
    b.use :input, class: 'form-control'
    error_and_hint.call(b)
  end

  config.wrappers :vertical_file_input, **wrapper_options do |b|
    basic_input.call(b, :file)
    b.use :label, class: label_class
    b.use :input
    error_and_hint.call(b)
  end

  config.wrappers :vertical_boolean, **wrapper_options do |b|
    basic_input.call(b, :boolean)
    b.wrapper class: 'checkbox' do |ba|
      ba.use :label_input
    end
    error_and_hint.call(b)
  end

  config.wrappers :vertical_radio_and_checkboxes, **wrapper_options do |b|
    basic_input.call(b, :boolean)
    b.use :label, class: label_class
    b.use :input
    error_and_hint.call(b)
  end

  config.wrappers :horizontal_form, **wrapper_options do |b|
    basic_input.call(b)
    b.use :label, class: horizontal_label_class
    b.wrapper class: horizontal_right_class do |ba|
      ba.use :input, class: 'form-control'
      error_and_hint.call(ba)
    end
  end

  config.wrappers :horizontal_file_input, **wrapper_options do |b|
    basic_input.call(b, :file)
    b.use :label, class: horizontal_label_class
    b.wrapper class: horizontal_right_class do |ba|
      ba.use :input
      error_and_hint.call(ba)
    end
  end

  config.wrappers :horizontal_boolean, **wrapper_options do |b|
    basic_input.call(b, :boolean)
    b.wrapper class: "#{horizontal_right_class} #{horizontal_right_offset_class}" do |wr|
      wr.wrapper class: 'checkbox' do |ba|
        ba.use :label_input
      end
      error_and_hint.call(wr)
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, **wrapper_options do |b|
    basic_input.call(b, :boolean)
    b.use :label, class: horizontal_label_class
    b.wrapper class: horizontal_right_class do |ba|
      ba.use :input
      error_and_hint.call(ba)
    end
  end

  config.wrappers :inline_form, **wrapper_options do |b|
    basic_input.call(b)
    b.use :label, class: 'sr-only'
    b.use :input, class: 'form-control'
    error_and_hint.call(b)
  end

  config.wrappers :multi_select, **wrapper_options do |b|
    basic_input.call(b, :boolean)
    b.use :label, class: label_class
    b.wrapper class: 'form-inline' do |ba|
      ba.use :input, class: 'form-control'
      error_and_hint.call(ba)
    end
  end
  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :vertical_form
  config.wrapper_mappings = {
    check_boxes: :vertical_radio_and_checkboxes,
    radio_buttons: :vertical_radio_and_checkboxes,
    file: :vertical_file_input,
    boolean: :vertical_boolean,
    datetime: :multi_select,
    date: :multi_select,
    time: :multi_select
  }
end
