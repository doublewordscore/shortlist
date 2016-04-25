class ShortList
	def initialize(list_title)
		@title = list_title
		@items = Array.new
	end

	attr_accessor :title, :items

	def add_item(new_item, completed_status = false)
		item = Item.new(new_item, completed_status)
		@items.push(item)
	end

	def remove_item(index)
		@items.delete_at(index)
	end

	def change_status(index)
		@items[index].update_completion
	end

	def print_all
		puts "#{@title}"
		puts "=" * @title.length
		@items.each {|item| item.print }
	end

end

class Item
	def initialize(item_description, finished = false)
		@description = item_description
		@completed_status = finished
	end
  
  attr_accessor :description, :completed_status

	def update_completion
		@completed_status = !completed_status
	end

	def print
		puts "#{description}" + " --- Finished Movie: " + "#{completed_status}"
	end

end

# Example of creating a new list, adding new items, changing the status, 
# removing the items, and printing the list

new_list = ShortList.new("Movies to Watch")

new_list.add_item("The Revenant")
new_list.add_item("The Martian")
new_list.add_item("Captain America: Civil War")
new_list.add_item("Zootopia")
new_list.add_item("The Cabin")
new_list.add_item("Cloverfield 12")

new_list.change_status(2)
new_list.change_status(0)
new_list.change_status(5)

new_list.remove_item(4)

new_list.add_item("The Jungle Book")

new_list.print_all

