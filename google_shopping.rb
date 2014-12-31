#RUBY!! no more semi-colons... ever.

require 'json'
file = File.read("./products.json")

#Welcome to RUBY we use snake case now
#snake case word_word not camel case wordWord
google_data = JSON.parse(file)

google_array = google_data["items"]


#outputs the full object
# puts google_data.inspect

#outputs the first item's title
# puts google_data["items"][0]["product"]["title"]

# ______________ Start of Assignment _________________

# 1.) The kind of results you're are dealing are shopping#products. 
# Go through the items and find all results that have kind of shopping#product. 
# How many are there? Where else is this count information stored in the search results?

shopping_product_count = 0

google_array.each do |i|
	if i["kind"].include?("shopping#product")
		shopping_product_count += 1
	end
end

puts "Answer 1) There are #{shopping_product_count} items with a kind of 'shopping#product.'"

# 2.) Find all items with a `backorder` availability in `inventories`.

backorder = 0

print "Answer 2) Products on backorder:\n"

google_array.each do |i|
	if i["product"]["inventories"][0]["availability"].include?("backorder")
		backorder += 1
		print "- #{i["product"]["title"]} is currently on backorder.\n"
	end
end

puts "There are #{backorder} items backordered."


# 3.) Find all items with more than one image link.

more_than_one_image = 0

print "Answer 3) These products have more than one image:\n"

google_array.each do |i|
	if i["product"]["images"].length > 1
		more_than_one_image += 1
		print "- #{i["product"]["title"]}\n"
	end
end

puts "There are #{more_than_one_image} items with more than one image."


# 4.) Find all `canon` products in the items (careful with case sensitivity).

canon_count = 0

print "Answer 4) These are Canon products.\n"

google_array.each do |i|
	if i["product"]["brand"].downcase.include?("canon")
		canon_count += 1
		print "- #{i["product"]["title"]} is a Canon camera.\n"
	end
end

puts "There are #{canon_count} Canon products."


# 5.) Find all `items` that have **product** **author** **name** of "eBay" and are brand "Canon".

canon_ebay_count = 0

print "Answer 5) These are Canon products that have an author of eBay:\n"

google_array.each do |i|
	if i["product"]["brand"].downcase.include?("canon") && i["product"]["author"]["name"].split(" ")[0].downcase.include?("ebay")
		canon_ebay_count += 1
		print "- #{i["product"]["title"]} is a Canon product with an author of eBay.\n"
	end
end
puts "There are #{canon_ebay_count} Canon produtcs with an author of eBay."

# 6.) Print all the products with their **brand**, **price**, and a **image link**

print "Answer 6) All products with brand, price, and image link below:\n"

google_array.each do |i|
	brand = i["product"]["brand"]
	price = i["product"]["inventories"][0]["price"]
	image = i["product"]["images"][0]["link"]
	print "- Brand: #{brand}, Price: #{price}\n"
	print "Image: #{image}\n"
end



