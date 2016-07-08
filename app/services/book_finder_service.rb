class BookFinderService
  attr_reader :query, :agent

  def initialize(query)
    @query = query
  end

  def library_search_results
    search_form.term = query
    results.uniq
  rescue NoMethodError
    Rails.logger.info("SEARCH ERROR: HTTP request was unsuccessful. Check interface with Library in Mechanize.")
    false
  end

  private

  def results
    agent.submit(search_form)
         .search('a.mediumBoldAnchor')
         .map{ |result| result.text.gsub(non_breaking_space_regex, '') }
  end

  def search_form
    @search_form ||= page_request.form('search') if page_request
  end

  def page_request
    @page_request ||= agent.get(library_ip)
  rescue => e
    Rails.logger.info("REQUEST ERROR: #{e.inspect}")
    false
  end

  def agent
    Mechanize.new
  end

  def library_ip
    'http://205.154.244.131/ipac20/ipac.jsp?lang=eng'
  end

  def non_breaking_space_regex
    /\A\p{Space}*|\p{Space}*\z/
  end
end