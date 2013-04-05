# telnetd console runner

require 'telnetd/telnet_server'

class Telnetd

	def self.run
		t = Thread.new do
			TelnetServer.new.start
		end
		STDIN.getc
	end

end
