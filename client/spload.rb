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
	opts.on('-u', '--upload [file]', 'Uploads to spload.') do |file|
		Spload.new.upload file
	end

	opts.on('-d', '--download [url|id]', 'Downloads from spload.') do |ident|
		Spload.new.download ident
	end

	opts.on('-h', '--help', 'Display this screen') do
		puts opts
		exit
  end
end
optparse.parse!
