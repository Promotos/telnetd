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
		@server_thread = Thread.new do
			begin
			server = TCPServer.open(23)
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
			rescue Interrupt => e
				puts "Server is interrupted"
			ensure
				close_all()
			end
		end
	end

	def stop
		raise ArgumentError, "Server has not be started." if @server_thread.nil? or @server_thread.alive? == false
		@server_thread.exit
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