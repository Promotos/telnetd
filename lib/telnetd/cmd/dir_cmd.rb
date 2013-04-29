require 'pathname'

module Telnetd
# Dir command implementation
class DirCmd

	# Handle the dir command. 
	# Shows the folder and files of the present working directory.
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+command+ The command string content
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
		context.list_folders.each { |folder|
			result +=  "\r\n\t%-40s  \t %-10s" % [Pathname.new(folder).basename, "<DIR>"]
		}
		return result
	end

	def files(context)
		result = ""
		context.list_files.each { |file|
			result +=  "\r\n\t%-40s \t %-10s" % [File.basename(file), as_size(File.size(file))]
		}
		return result		
	end

	def as_size(s)
  		units = %W(B KiB MiB GiB TiB)
  		size, unit = units.reduce(s.to_f) do |(fsize, _), utype|
    			fsize > 512 ? [fsize / 1024, utype] : (break [fsize, utype])
  		end
  		"#{size > 9 || size.modulo(1) < 0.1 ? '%d' : '%.1f'} %s" % [size, unit]
	end

end
end
