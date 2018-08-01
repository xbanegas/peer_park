module ApplicationHelper
	def format_currency fig
		number_to_currency(cents_to_dollars(fig))
	end
	def cents_to_dollars fig
		fig = fig.to_f / 100
	end
end
