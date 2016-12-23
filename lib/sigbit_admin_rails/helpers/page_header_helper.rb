module SigbitAdminRails
  module PageHeaderHelper
    def page_header(title, *args, &block)
      options = {breadcrumbs_position: 'top'}
      options.merge!(args.extract_options!)
      content_tag :div, class: 'row page-header' do
        html = content_tag(:div, class: "#{options[:class] ||= 'col-xs-12'}") do
          inner = ''
          inner << breadcrumbs(options[:breadcrumbs]) if options[:breadcrumbs].present? && options[:breadcrumbs_position] == 'top'
          inner << content_tag(:h1, title)
          inner << breadcrumbs(options[:breadcrumbs]) if options[:breadcrumbs].present? && options[:breadcrumbs_position] == 'bottom'
          inner.html_safe
        end
        html << capture(&block) if block_given?
        html.html_safe
      end
    end

    private

    def breadcrumbs(arr)
      content_tag(:ol, class: 'breadcrumb') do
        arr.map do |b|
          content_tag(:li, b, class: 'breadcrumb-item')
        end.join.html_safe
      end
    end
  end
end
