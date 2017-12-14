require 'spec_helper'

describe 'Requesting info on a single postcode works correctly' do

  before(:all) do
    @postcodesio = Postcodesio.new.single_postcode_service
    @postcodesio.get_single_postcode('nw27jy')
  end

  it "Should respond with a status message of 200" do
    expect(@postcodesio.get_status_code_from_body_response).to eq(200)
  end

  it "Should respond with a HASH" do
    expect(@postcodesio.get_result).to be_kind_of(Hash)
  end


end
