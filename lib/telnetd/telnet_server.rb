# The Telnet daemon main class. Create a new thread for each client

require 'socket'
require 'telnetd/telnet_client'

class TelnetServer

	# Create a new instance of the Telnet Server class.
	def initialize
		@client_list = []
	end

	# Start the server.
	def start
		begin
		puts "Telnet Server Daemon started."
		server = TCPServer.open(2000)
		loop {
			begin
				client = TelnetClient.new(server.accept)
				@client_list << client
  				t = Thread.new do
  					handleNewClient(client) 
  				end
  			rescue Exception => e 
				puts "Client Error: #{e.message}" 
			end
		}
		ensure
			close_all()
		end
	end

private
	def close_all()
		@client_list.each { |client|
			client.close()
		}
	end

	def handleNewClient(client)
		begin
			client.handle()
  		rescue Exception => e 
			puts "Client Error: #{e.message}" 
		end			
	end

end