require 'httparty'
require 'json'

class MultiPostcodeService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_multiple_postcodes(postcode_array)
    JSON.parse(self.class.post('/postcodes', body: {"postcodes" => postcode_array}).body)
  end

end
