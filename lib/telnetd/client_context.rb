# Client context instance.
# Used to handle all informations relevant for a connected client
# A class instance is valid as long the associated client is conntected.

class ClientContext

	# Read the client connection start timestamp.
	attr_reader :start_time

	attr_reader :path

	# Create a new instance of the context
	def initialize
		@start_time = Time.now
		@path = application_path
	end

private
	def application_path
		 return File.dirname(__FILE__)
	end
end