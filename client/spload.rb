require 'rubygems'
require 'optparse'
require 'rest_client'

class Spload
	def upload(file)
		resp = RestClient.post('http://127.0.0.1:8888/write.php', 
										:upload => File.new(file, 'rb'))
		puts resp.to_str
	end

	def download(ident)

	end
end

optparse = OptionParser.new do |opts|
	opts.on('-u', '--upload [FILE]', 'Uploads to spload.') do |file|
		Spload.new.upload file
	end
end
optparse.parse!
