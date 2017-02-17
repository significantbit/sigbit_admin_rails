module SigbitAdminRails
  module SidebarHelper
    def sidebar(*args, &block)
      options = args.extract_options!
      if block_given?
        content_tag :div, id: 'sidebar-wrapper' do
          html = link_to '', options[:brand_url], class: 'sidebar-brand hidden-sm-down'
          html << content_tag(:ul, class: 'sidebar-nav') do
            yield
          end
          html.html_safe
        end
      end
    end

    def sidebar_item(title, url = nil, &block)
      if block_given?
        url = "##{(0...20).map { ('a'..'z').to_a[rand(26)] }.join}" unless url.present?

        content_tag :li do
          concat(link_to("#{title} <i class='fa fa-chevron-right'></i>".html_safe, url, data: {toggle: 'collapse'}))
          concat(content_tag(:ul, class: 'submenu collapse', id: url.delete('#')) do
            yield
          end)
        end
      else
        content_tag :li, class: 'nav-item' do
          smart_link_to title, url, class: 'nav-link'
        end
      end
    end

    def smart_link_to(title, url, options = {})
      if defined?(ActiveLinkTo)
        active_link_to(title, url, options)
      else
        link_to title, url, options
      end
    end
  end
end
