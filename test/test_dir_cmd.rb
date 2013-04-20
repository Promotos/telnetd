
require 'test/unit'
require 'telnetd/client_context'
require 'telnetd/cmd/dir_cmd'

# Tests for the dir command
class TestDirCmd < Test::Unit::TestCase

	# Test if the dir listing contains expected folder and files.
	def test_dir_listing
		dir = DirCmd.new
		assert(dir.format(ClientContext.new).include?("cmd"))
		assert(dir.format(ClientContext.new).include?("telnet_client.rb"))
		assert(dir.format(ClientContext.new).include?("telnet_server.rb"))
	end

end