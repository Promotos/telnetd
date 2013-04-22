require 'socket'
require 'telnetd/telnet_client'

module Telnetd
# The Telnet daemon main class. Create a new thread for each client
class TelnetServer

	# Create a new instance of the Telnet Server class.
	def initialize
		@client_list = []
	end

	# Start the server in a new thread. This method will return immediately after the server thread is running.
	# You must use the same instance of the TelnetServer class to stop an existing server by calling the stop
	# method. Otherwise the socket listening thread could not be stopped.
	# * By default the server creates an socket listening on port 23.
	# * Each new connection on this server will be handled by a separate thread.
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
					puts e.inspect
					puts e.backtrace
				end
			}
			rescue Interrupt => e
				puts "Server is interrupted"
			ensure
				close_all()
				server.close
			end
		end
		@server_thread.abort_on_exception = true
	end

	# Used to stop a running server instance.
	# This method will cause all connected clients to be disconnected.
	# ===== Throws
	# * ArgumentError if server is not running or server thread is not alive. Maybe you miss to start the server first.
	def stop
		raise ArgumentError, "Server has not be started." if @server_thread.nil? or @server_thread.alive? == false
		#@server_thread.exit
		Thread.kill(@server_thread)

		# 100 milliseconds delay needed to realease system resources
		sleep(0.1)
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
			puts e.inspect
			puts e.backtrace 
		end			
	end
end
end