class Pricing
	def self.to_dollars
		puts "CALLED FUNCTION!!!"
		return self.to_s ? "$#{self.to_s}" : ""
	end
end
