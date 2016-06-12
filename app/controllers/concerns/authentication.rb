module Authentication
  extend ActiveSupport::Concern

  def request_token
    request_token ||= OAuth::Consumer.new(Goodreads.configuration[:api_key],Goodreads.configuration[:api_secret],site: "http://www.goodreads.com").get_request_token
    request_token
  end
end