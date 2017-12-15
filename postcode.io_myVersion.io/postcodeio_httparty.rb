require 'httparty'
require 'json'

class Postcodesio
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcode_array)
    JSON.parse(self.class.post('/postcodes', body: {"postcodes" => postcode_array}).body)
  end
end

x = Postcodesio.new
# puts x.get_multiple_postcodes(['ha01ng','nw27jy'])['result'][1]['result']['eastings'].class
puts x.get_single_postcode('nw27jy')
# puts x.get_multiple_postcodes.length
# puts x.get_multiple_postcodes(['nw27jy','ha01ng','nw98du'])
