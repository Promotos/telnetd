require 'pathname'

# Dir command implementation
class DirCmd

	# Handle the dir command. 
	# Shows the folder and files of the present working directory.
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+commandtime+ The command string content
	def handle(client, command)
		client.println(format(client.context))
	end

	# Describe the dir command
	def describe
		"Shows the folder and files of the present working directory."
	end

	# Format the content of the path as human readable string
	# ==== Arguments
	# *+context+ The client context to access the present working directory
	def format(context)
		return "#{header(context)}#{folders(context)}#{files(context)}"
	end

private

	def header(context)
		"Content of directory: #{context.path}" + 
		"\r\n-------------------------------------------------------------------" +
		"\r\n\t%-40s \t %-10s" % ["Name", "Size"] + 
		"\r\n-------------------------------------------------------------------"
	end

	def folders(context)
		result = ""

		puts context.list_folders

		context.list_folders.each { |folder|
			result +=  "\r\n\t%-40s  \t %-10s" % [Pathname.new(folder).basename, "<DIR>"]
		}
		return result
	end

	def files(context)
		result = ""
		context.list_files.each { |file|
			result +=  "\r\n\t%-40s \t %10d" % [File.basename(file), File.size(file)]
		}
		return result		
	end
end