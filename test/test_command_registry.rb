require 'test/unit'
require 'telnetd/command_registry'

module Telnetd
# Tests for the Command Registry
class TestCommandRegistry < Test::Unit::TestCase
	
	#Test the strip of the command
	def test_strip_cmd
		cr = CommandRegistry.new
		assert_equal("abc", cr.send("strip_cmd", "abc  "))
	end
end
end
