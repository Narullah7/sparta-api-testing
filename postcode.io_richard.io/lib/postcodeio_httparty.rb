require_relative 'services/single_postcode_service'
require_relative 'services/multiple_postcode_service'

class Postcodesio

  def single_postcode_service
    SinglePostcodeService.new
  end

end

#Created instance on the super class
# postcode_services = Postcodesio.new
# x = postcode_services.single_postcode_service
#
# x.get_single_postcode('nw27jy')
#
# x.print_results
