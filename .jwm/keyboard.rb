#!/usr/bin/env ruby
def keyboard
	if `skb 1`.chop! == "Rus" then
		puts "Рус"
	else
		puts "Eng"
	end
end
keyboard