require "uri"
require "net/http"

class YodaApi
  def translate(text)
    uri = URI("https://api.funtranslations.com/translate/yoda.json?text=#{URI.encode_www_form_component(text.strip)}")
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      json = JSON.parse(response.body)
      json.dig("contents", "translated")
    else
      nil
    end
  end
end
