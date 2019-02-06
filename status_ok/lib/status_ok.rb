# frozen_string_literal: true

# A Rack application that responds to HTTP GET requests "OK"
# Learn more about the Rack library at https://rack.github.io/
class StatusOK
  # Constructor
  # @param [String] body The body of the HTTP response when OK
  def initialize(body = 'OK')
    @body = body
  end

  # Reads the Rack-parsed HTTP Request and returns a response for Rack.
  # @param [Hash] env The environment hash given to the handler.
  # @return An array with HTTP response code, hash of headers, an enumerable body
  def call(env)
    # puts env.inspect
    if env[REQUEST_METHOD] == GET && env['PATH_INFO'] == PATH
      ['200', HEADERS, [@body]]
    elsif env[REQUEST_METHOD] == GET
      ['404', HEADERS, ['Not Found']]
    else
      ['405', HEADERS, ['Not Found']]
    end
  end

  GET = 'GET'
  PATH = '/'
  REQUEST_METHOD = 'REQUEST_METHOD'
  HEADERS = { 'Content-Type' => 'text/html' }
end
