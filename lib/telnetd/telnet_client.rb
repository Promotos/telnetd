# Represent a telnet client. 
# This class is used to be executed in a single thread

class TelnetClient

	# Create a new instance of the telnet client
	# ==== Arguments
	# *+client+ The socket client connection to be wrapped. Must be connected.
	def initialize(client)
		raise ArgumentError, "Client not connected" if client.closed?
		@client = client

		@port, @ip = Socket.unpack_sockaddr_in(client.getpeername)
	end

	# Starts the client processing by sending the welcome message.
	# Also enter the processing loop to handle client commands
	def handle()
		welcome_message()
		promt()
		while line = @client.gets
			process_cmd(line)
  			promt()
		end
	end

	# Close the client connection with sending a bye message and close the socket.
	def close()
  		@client.print "\r\nClosing the connection. Bye!"
  		@client.close
	end

private

	def process_cmd(cmd)
		puts cmd
	end

	def promt
		@client.print "\r\n>>"
	end

	def welcome_message
		@client.print "Welcome to telnetd.\r\n"
		@client.print "===================\r\n"
		@client.print "Type 'help' to get a list of all commands or 'exit' to end the session.\r\n"
	end

end