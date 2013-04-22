require 'pathname'

module Telnetd
# Client context instance.
# Used to handle all informations relevant for a connected client
# A class instance is valid as long the associated client is conntected.
class ClientContext

	# Read the client connection start timestamp.
	attr_reader :start_time

	# Read the current working directory of the client
	attr_reader :path

	# Create a new instance of the context
	def initialize
		@start_time = Time.now
		@path = Pathname.new(application_path)
	end

	# Used to list the folders of the current working directory
	def list_folders
		result = []
		@path.each_child { |path|
			result << path if File::directory?(path)
		}
		return result
	end

	# Used to list the files of the current working directory
	def list_files
		result = []
		@path.each_child { |path|
			result << path if File::file?(path)
		}
		return result
	end

	# Change the dirctory to the path of the argument
	# ==== Argument
	# *+arg+ The path argument. May contain '..' to navigate to the parent folder
	# ==== Result
	# * An error message if the requested path does not exists
	def cd(arg)
		newpath = @path.join(Pathname.new(arg))
		return "Path does not exists." unless newpath.exist?
		@path = newpath
	end

private
	# Get the application startup path
	def application_path
		 return File.dirname(__FILE__)
	end
end
end