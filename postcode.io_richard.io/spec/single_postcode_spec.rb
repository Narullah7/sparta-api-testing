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

  it 'postcode should have 2 main categories e.g. status and result' do
    expect(@postcodesio.get_single_postcode('nw27jy').count).to eq(2)
  end

  it 'the results should return 23 attributes' do
    expect(@postcodesio.get_result.length).to eq (23)
  end

  it 'northings in results key should both be integers' do
    expect(@postcodesio.get_northings).to be_kind_of(Integer)
  end

  it 'eastings in results key should both be integers' do
    expect(@postcodesio.get_eastings).to be_kind_of(Integer)
  end

  it "northings in result key should have 6 characters" do
    expect(@postcodesio.get_northings.to_s.size).to eq(6)
  end

  it "eastings in result key should have 6 characters" do
    expect(@postcodesio.get_eastings.to_s.size).to eq(6)
  end

  it 'longitude should return a FLOAT' do
    expect(@postcodesio.get_longitude).to be_kind_of(Float)
  end

  it 'latitude should return a FLOAT' do
    expect(@postcodesio.get_latitude).to be_kind_of(Float)
  end

  it 'testing the post code we put in displays same postcode in the HASH' do
    expect(@postcodesio.get_postcode_from_result).to eq("NW2 7JY")
  end

  it 'for the codes hash inside result hash, it should contain 7 attributes' do
    expect(@postcodesio.get_codes_from_result.count).to eq(7)
  end
end
