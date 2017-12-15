require 'httparty'
require 'json'

class SinglePostcodeService
  include HTTParty

  attr_accessor :single_postcode_data

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_data = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_northings
    @single_postcode_data['result']['northings']
  end

  def get_eastings
    @single_postcode_data['result']['eastings']
  end

  def get_result
    @single_postcode_data['result']
  end

  def get_status_code_from_body_response
    @single_postcode_data['status']
  end

  def get_longitude
    @single_postcode_data['result']['longitude']
  end

  def get_latitude
    @single_postcode_data['result']['latitude']
  end

  def get_postcode_from_result
    @single_postcode_data['result']['postcode']
  end

  def get_codes_from_result
    @single_postcode_data['result']['codes']
  end
end
