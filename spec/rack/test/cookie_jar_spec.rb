require_relative '../../spec_helper'

describe Rack::Test::CookieJar do
  cookie_value = 'foo;abc'.freeze
  cookie_name = 'a_cookie_name'.freeze

  it '#get_cookie with a populated jar returns full cookie objects' do
    jar = Rack::Test::CookieJar.new
    jar[cookie_name] = cookie_value
    cookie = jar.get_cookie(cookie_name)
    cookie.must_be_kind_of Rack::Test::Cookie
  end

  it '#for returns the cookie header string delimited by semicolon and a space' do
    jar = Rack::Test::CookieJar.new
    jar['a'] = 'b'
    jar['c'] = 'd'

    jar.for(nil).must_equal 'a=b; c=d'
  end
end
