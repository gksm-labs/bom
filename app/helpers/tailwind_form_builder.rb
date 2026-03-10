class TailwindFormBuilder < ActionView::Helpers::FormBuilder
  def tailwind_input(method, type: :text_field, collection: nil, required: true, **options)
    has_error = @object.errors[method].any?

    css_classes = @template.class_names(
      "rounded-md border px-3 py-2 text-slate-900 outline-none bg-white w-full transition-all",
      options[:class],
      "border-red ring-1 ring-red/30": has_error,
      "border-slate-300 focus:border-primary": !has_error,
      "cursor-pointer": type == :select
    )

    input_options = options.merge(class: css_classes, required: required)

    input_html = if type == :select
                   select(method, collection, { prompt: I18n.t("helpers.select.prompt", default: "Vyberte...") }, input_options)
    else
                   public_send(type, method, input_options)
    end

    wrap_field(method, required, has_error) { input_html }
  end

  def tailwind_check_box(method, required: true, **options)
    has_error = @object.errors[method].any?

    label_html = label(method, class: "flex items-start gap-3 cursor-pointer") do
      check_box(method, options.merge(class: "mt-1 h-4 w-4 accent-red shrink-0", required: required)) +
        @template.tag.span(class: "text-sm leading-relaxed text-slate-700") do
          "#{object.class.human_attribute_name(method)}#{' *' if required}"
        end
    end

    @template.tag.div(class: "grid gap-1.5") do
      label_html + error_message_html(method, has_error)
    end
  end

  private

  def wrap_field(method, required, has_error, &block)
    @template.tag.div(class: "flex flex-col justify-start gap-1") do
      label(method, class: "text-sm font-medium text-slate-700") do
        "#{object.class.human_attribute_name(method)}#{' *' if required}"
      end +
        yield +
        error_message_html(method, has_error)
    end
  end

  def error_message_html(method, has_error)
    return nil unless has_error

    icon = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="h-4 w-4 shrink-0"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-5a.75.75 0 01.75.75v4.5a.75.75 0 01-1.5 0v-4.5A.75.75 0 0110 5zm0 10a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd" /></svg>'.html_safe

    @template.tag.div(class: "mt-0.5 flex items-center gap-1.5 rounded bg-red/10 px-2.5 py-1.5 text-xs font-semibold text-red border border-red/20") do
      icon + @template.tag.span(@object.errors[method].first)
    end
  end
end
