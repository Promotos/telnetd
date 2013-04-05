# telnetd console runner

require 'telnetd/telnet_server'

class Telnetd

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
