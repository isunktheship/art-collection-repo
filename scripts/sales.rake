


sale_print_UID	sale_price	shipping	sale_date
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 158368).last.id).last.id, price: 199.00, shipping_cost: 0.0,  transaction_date: "26/5/2013") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 161505).last.id).last.id, price: 165.00, shipping_cost: 0.0,  transaction_date: "26/5/2013") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 150147).last.id).last.id, price: 149.99, shipping_cost: 0.0,  transaction_date: "12/5/2013") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 174443).last.id).last.id, price: 299.99, shipping_cost: 15.0, transaction_date: "3/5/2014")	
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 150893).last.id).last.id, price: 299.00, shipping_cost: 15.0, transaction_date: "3/5/2014")	
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 148625).last.id).last.id, price: 149.99, shipping_cost: 15.0, transaction_date: "3/5/2014")	
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 157600).last.id).last.id, price: 129.99, shipping_cost: 0.0,  transaction_date: "20/1/2014") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 154352).last.id).last.id, price: 299.99, shipping_cost: 0.0,  transaction_date: "3/2/2014") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 150921).last.id).last.id, price: 105.00, shipping_cost: 0.0,  transaction_date: "10/11/2013") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 156769).last.id).last.id, price: 69.99,  shipping_cost: 0.0,  transaction_date: "29/10/2013") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 154093).last.id).last.id, price: 45.00,  shipping_cost: 0.0,  transaction_date: "20/10/2013") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 153395).last.id).last.id, price: 81.00,  shipping_cost: 0.0,  transaction_date: "16/10/2013") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 155074).last.id).last.id, price: 149.00, shipping_cost: 0.0,  transaction_date: "15/10/2013") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 150921).last.id).last.id, price: 103.00, shipping_cost: 0.0,  transaction_date: "9/10/2013") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 150502).last.id).last.id, price: 295.99, shipping_cost: 0.0,  transaction_date: "5/7/2012") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 150145).last.id).last.id, price: 259.99, shipping_cost: 0.0,  transaction_date: "28/6/2011") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 163173).last.id).last.id, price: 399.99, shipping_cost: 0.0,  transaction_date: "28/3/2014") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 156409).last.id).last.id, price: 120.00, shipping_cost: 30.0, transaction_date: "18/5/2015") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 173297).last.id).last.id, price: 150.00, shipping_cost: 20.0, transaction_date: "4/12/2015") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 174458).last.id).last.id, price: 70.00,  shipping_cost: 8.0,  transaction_date: "2/4/2016") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 157601).last.id).last.id, price: 60.00,  shipping_cost: 8.0,  transaction_date: "2/4/2016") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 172011).last.id).last.id, price: 59.99,  shipping_cost: 15.0, transaction_date: "11/4/2016") 
Sale.create(purchase_id: Purchase.where(print_id: Print.where(eb_uid: 157601).last.id).last.id, price: 49.00,  shipping_cost: 15.0, transaction_date: "11/4/2016") 

sale_print_UID
ids = [158368, 161505, 150147, 174443, 150893, 148625, 154352, 157600, 150921, 156769, 154093, 153395, 155074, 150921, 150502, 150145, 163173, 156409, 173297, 174458, 157601, 172011, 157601]
# ids.each {|eb_uid| puts GetPrintDetailsService.new({print_uid: eb_uid}).call }


ids.each {|eb_uid| ImportPrintDetailsService.new({ details: GetPrintDetailsService.new({ print_uid: eb_uid }).call }).call}


Print.where(eb_uid: ids).each do |p|
	Purchase.create(print_id: p.id, price: p.original_price, description: "sale import")
end

Purchase.where(description: "sale import").each do |p|

end