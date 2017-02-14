class HotReads

	def initialize(link)
		send_link_to_hot_reads(link)
	end

	def send_link_to_hot_reads(link)
		conn = Faraday.new(:url => 'https://hot-reads.herokuapp.com/urls')
		# https://hot-reads.herokuapp.com

		conn.post do |req|
		  req.params['body'] = link.to_json
		end
	end

end
