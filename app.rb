require 'hue'
require 'dashed'

client = Hue::Client.new

light = client.lights[0]

Dashed::Button.new('aa:bb:cc:dd:ee:ff', 'wlan0').on_press do
  light.on? ? light.off! : light.on!
end
