require 'uri'
require 'net/https'
require 'json'

module PostHTTPS
  def self.call(url, hash_json)
    uri = URI.parse(url)
    req = Net::HTTP::Post.new(uri.to_s)
    req.body = hash_json.to_json
    req['Content-Type'] = 'application/json'

    response = https(uri).request(req)

    response.body
  end

  private

  def self.https(uri)
    Net::HTTP.new(uri.host, uri.port).tap do |http|
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
  end
end
