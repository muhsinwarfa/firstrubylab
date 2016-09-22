class RegexTester
	def initialize(pattern = nil )
		@pattern = pattern unless pattern.nil?
	end

	attr_accessor :pattern

	def statements=(arr)
		begin
			raise TypeError unless arr.class == Array
			raise RuntimeError if arr.empty?
			@statements = arr
		rescue RuntimeError
			STDERR.puts "You need to have at leasr one statement to test against the pattern"
			add_insult
			exit
		rescue TypeError
			STDERR.puts "You must enter an ARRAY of statements to use this regex_tester."
			add_insult
			exit
		end
	end

	def statements
		@statements
	end

	def test
		@statements.each do |item|

			if pattern_matches? item
				puts "Match: #{item}"
			else
				STDERR.puts "NO MATCH: #{item}"
			end
		end
	end

	private

	def pattern_matches? statements
		statements.match(@pattern) != nil
	end

	def add_insult
		STDERR.puts "-------------------------"
		STDERR.puts "As a coding infidel, you are hereby sentenced to death.
					The firing squad will be here shortly to carry out the execution.
					Please remain seated until they arrive.Thank you for your cooperation"

	end
end

# regex = RegexTester.new
# regex.pattern = /^(http:\/\/)?www\.\w+\.(com|edu|org)$/ 
# # from test_arrays.rb
# puts regex.pattern
# regex.statements = "http://www.google.com"
# puts regex.statement
# puts "----------------------"
# regex.test
# regex.statements = %w[http://www.google.com apidock.com www.microsoft.com
# http://www.heimann-family.org http://www.kli.org
# http://www.acac.net http://www.cmu.edu http://is.hss.cmu.edu
# www.amazon.co.uk]

# regex.test(%w[http://www.google.com apidock.com www.microsoft.com
# http://www.heimann-family.org http://www.kli.org
# http://www.acac.net http://www.cmu.edu http://is.hss.cmu.edu
# www.amazon.co.uk])

cc = RegexTester.new
cc.statements = %w[1234567890123456 1234-5678-9012-3456 1234\ 5678\ 9012\ 3456
1234567890 #1234567890123456 1234|5678|9012|3456]
# cc.pattern = /^\d{16}$/
# cc.test

# cc.pattern = /^\d{16}$|^(\d{4}-\d{4}-\d{4}-\d{4})$/
# cc.test

# cc.pattern = /^\d{16}$|^((\d{4}-?){4})$/
# cc.test

cc.pattern = /^(\d{4}[ -]?){4}$/
cc.test



