#!/usr/bin/env ruby
sink = `pacmd list-sinks | grep -e '* index'`.scan(/\d/)
a =  sink[0]
s = "pactl set-sink-mute #{a} false ; pactl set-sink-volume #{a} -5%"
`#{s}`