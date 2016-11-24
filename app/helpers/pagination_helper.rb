module PaginationHelper

  def load_more(collection, url)
    unless collection.last_page?
      content_tag :div, class: 'load-more center dark pad4y' do
        concat link_to 'Load more',
                       url,
                       class: 'btn btn-default btn-wide ladda-button',
                       remote: true,
                       data: { style: 'slide-left' }
      end
    end
  end
end
