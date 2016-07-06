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

    def sidebar_item(title, url, &block)
      if block_given?
        content_tag :li do
          html = link_to("#{title} <i class='fa fa-chevron-right'></i>".html_safe, url, data: { toggle: 'collapse' })
          html << content_tag(:ul, class: 'submenu collapse', id: url.delete('#')) do
            yield
          end
          html.html_safe
        end
      else
        "<li>#{link_to title, url}</li>".html_safe
      end
    end  end
end
