require 'telnetd/telnet_server'

module Telnetd
# telnetd console runner
class Telnetd

	# Command line interface wrapper
	def self.run
		telnetd = TelnetServer.new
		telnetd.start
		puts "Telnet server started."
		puts "Press any key to stop."
		STDIN.getc
		telnetd.stop
		puts "Telnet server stopped."
	end
end
end