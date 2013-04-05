# Tests used for the telnet server

require 'test/unit'
require 'socket'
require 'telnetd/telnet_server'

class TelnetServerTest < Test::Unit::TestCase

	def test_get_welcome_message
		server = TelnetServer.new
		server.start()

		s = TCPSocket.open("localhost", 23)
		line = s.gets
		s.close

		assert_equal("Welcome to telnetd.\r\n", line)
		server.stop()
	end

end