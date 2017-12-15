require 'httparty'

response = HTTParty.get('http://bbc.co.uk/news')
puts response.message
puts response.headers.inspect
