module ApplicationHelper


  private

  def options_for(record)
    record.map { |r| parse_record(r) }
  end

  def parse_record(object)
    return object.klass if object.is_a?(Ransack::Search)
    object
  end

  def html_option_for(option, search)
    return option.to_s if option.present?
    "#{search.klass.to_s.underscore}_search"
  end

  def extract_search_and_routing_proxy(search)
    return [search[1], search[0]] if search.is_a?(Array)
    [search, nil]
  end

  def url(routing_proxy, options_for_url)
    if routing_proxy && respond_to?(routing_proxy)
      send(routing_proxy).url_for(options_for_url)
    else
      url_for(options_for_url)
    end
  end
end
