#!/usr/bin/env ruby
sink = `pacmd list-sinks | grep -e '* index'`.scan(/\d/)
a =  sink[0]
b = `sh /home/strike/.jwm/volume`.chop!.chop!
c = b.to_i

def ivolume(c, a)
	if c < 100 then
		s = "pactl set-sink-mute #{a} false ; pactl set-sink-volume #{a} +5%"
		`#{s}`
	end
end

ivolume(c, a)