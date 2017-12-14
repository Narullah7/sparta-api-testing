require 'spec_helper'

describe 'Testing my API system' do
  before(:each) do
    @postcodes = Postcodesio.new
  end

  it 'Single postcodes should be in HASH form' do
    expect(@postcodes.get_single_postcode('nw27jy')).to be_kind_of(Hash)
  end

  it 'Multiple postcodes should be in hash form' do
    expect(@postcodes.get_multiple_postcodes(['nw27jy','ha01ng'])).to be_kind_of(Hash)
  end

  it 'Status should be 200 for single postcode(relating to ok)' do
    expect(@postcodes.get_single_postcode('nw27jy')['status']).to eq(200)
  end

  it 'Status should be 200 for multiple postcodes' do
    expect(@postcodes.get_multiple_postcodes(['nw27jy','ha01ng'])['status']).to eq(200)
  end

  it 'the postcode should have 2 main keys e.g. status and result' do
    expect(@postcodes.get_single_postcode('hao1ng').length).to eq(2)
  end

  it 'For multiple postcodes, it should have 2 main keys e.g. status and result' do
    expect(@postcodes.get_multiple_postcodes(['hao1ng','nw27jy']).length).to eq(2)
  end

  it 'The result array should contain 23 attributes' do
    expect(@postcodes.get_single_postcode('nw27jy')['result'].length).to eq (23)
  end

  it 'for multiple postcodes, results array should contain 23 characters' do
    (0..2).each do |i|
      expect(@postcodes.get_multiple_postcodes(['ha01ng','nw27jy','nw98du'])['result'][i]['result'].length).to eq (23)
    end
  end

  it 'easting and northings in results key should be both Integers' do
    expect(@postcodes.get_single_postcode('nw27jy')['result']['northings']).to be_kind_of(Integer)
    expect(@postcodes.get_single_postcode('nw27jy')['result']['eastings']).to be_kind_of(Integer)
  end

  it 'for multiple postcodes northings and eastings in results key should be both integers' do
    (0..2).each do |i|
      expect(@postcodes.get_multiple_postcodes(['ha01ng','nw27jy','nw98du'])['result'][i]['result']['eastings']).to be_kind_of(Integer)
      expect(@postcodes.get_multiple_postcodes(['nw27jy','ha01ng','nw98du'])['result'][i]['result']['northings']).to be_kind_of(Integer)
    end
  end

  it 'for multiple postcodes northing and easting should both contain 6 numbers each' do
    (0..2).each do |i|
      expect(@postcodes.get_multiple_postcodes(['nw27jy','ha01ng','nw98du'])['result'][i]['result']['eastings'].to_s.size).to eq(6)
      expect(@postcodes.get_multiple_postcodes(['nw27jy','ha01ng','nw98du'])['result'][i]['result']['northings'].to_s.size).to eq(6)
    end
  end

  it "easting and northings should both contain 6 numbers each" do
    expect(@postcodes.get_single_postcode('nw27jy')['result']['northings'].to_s.size).to eq(6)
    expect(@postcodes.get_single_postcode('nw27jy')['result']['northings'].to_s.size).to eq(6)
  end

  it 'longitude and latitude should return a FLOAT' do
    expect(@postcodes.get_single_postcode('nw27jy')['result']['longitude']).to be_kind_of(Float)
    expect(@postcodes.get_single_postcode('nw27jy')['result']['latitude']).to be_kind_of(Float)
  end

  it 'for multiple postcodes, longitude and latitude should return a float' do
    (0..2).each do |i|
      expect(@postcodes.get_multiple_postcodes(['nw27jy','ha01ng','nw98du'])['result'][i]['result']['longitude']).to be_kind_of(Float)
      expect(@postcodes.get_multiple_postcodes(['nw27jy','ha01ng','nw98du'])['result'][i]['result']['latitude']).to be_kind_of(Float)
    end
  end

  it 'testing the post code we put in displays same postcode in the HASH' do
    expect(@postcodes.get_single_postcode('nw27jy')['result']['postcode']).to eq("NW2 7JY")
    expect(@postcodes.get_single_postcode('ha01ng')['result']['postcode']).to eq("HA0 1NG")
  end

  it 'for the multiple postcodes, the postcode we put should display the same postcode in 7 characters' do
    (0..2).each do |i|
      expect(@postcodes.get_multiple_postcodes(['nw27jy','ha01ng','nw98du'])['result'][i]['result']['postcode'].size).to eq(7)
    end
  end

  it 'for the codes hash inside result hash, it should contain 7 attributes' do
    expect(@postcodes.get_single_postcode('nw27jy')['result']['codes'].count).to eq(7)
  end








end
