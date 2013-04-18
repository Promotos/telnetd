require 'telnetd/command_registry'

# Represent a telnet client. 
# This class is used to be executed in a single thread
class TelnetClient

	# Read access to the command registry
	attr_reader :command_registry

	# Create a new instance of the telnet client
	# ==== Arguments
	# *+client+ The socket client connection to be wrapped. Must be connected.
	def initialize(client)
		raise ArgumentError, "Client not connected" if client.closed?
		@client = client
		@command_registry = CommandRegistry.new

		@port, @ip = Socket.unpack_sockaddr_in(client.getpeername)
	end

	# Starts the client processing by sending the welcome message.
	# Also enter the processing loop to handle client commands
	def handle()
		welcome_message()
		promt()
		while line = @client.gets
			process_cmd(line)

			if @client.closed?
				return
			end

  			promt()
		end
	end

	# Close the client connection with sending a bye message and close the socket.
	def close()
  		print("\r\nClosing the connection. Bye!")
  		@client.close unless @client.closed?
	end

	# Used to print the content to the client socket.
	# ==== Arguments
	# *+content+ The content to be send to the client
	def print(content)
		@client.print(content) unless @client.closed?
	end

	# Used to print the content to client and add a cariage return '\r' and newline '\n'
	# at the end of the content.
	# *+content+ The content to be send to the client
	def println(content)
		print("#{content}\r\n")
	end

private

	def process_cmd(cmd)
		@command_registry.handle(self, cmd)
	end

	def promt
		print("\r\n>>")
	end

	def welcome_message
		println("Welcome to telnetd.")
		println("===================")
		println("Type 'help' to get a list of all commands or 'exit' to end the session.")
	end

end