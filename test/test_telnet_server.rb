# Tests used for the telnet server

require 'test/unit'
require 'socket'
require 'telnetd/telnet_server'

class TelnetServerTest < Test::Unit::TestCase

	# Test get the welcome message from the telnet server
	def test_get_welcome_message
		server = TelnetServer.new
		server.start()

		client = TCPSocket.open("localhost", 23)
		line = client.gets()
		client.print("exit\r\n")
		client.close()

		assert_equal("Welcome to telnetd.\r\n", line)
		server.stop()
	end

	#Test if exit command closes the connection
	def test_exit_close
		server = TelnetServer.new
		server.start()

		client = TCPSocket.open("localhost", 23)
		welcome_msg = client.recv(200)
		client.print("exit\r\n")
		bye_msg = client.read
		assert_equal("\r\nClosing the connection. Bye!", bye_msg)

		client.close()
		server.stop()
	end

end