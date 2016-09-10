class Transaction < ActiveRecord::Base
	belongs_to :print
	belongs_to :transaction_type
end
