require 'json'

class HotReads

	def initialize(link)
		send_link_to_hot_reads(link)
	end

	def send_link_to_hot_reads(link)
		conn = Faraday.new(:url => 'http://0.0.0.0:3000/urls')
		# https://hot-reads.herokuapp.com

		conn.post do |req|
		  req.body = link.to_json
		end
	end

end
