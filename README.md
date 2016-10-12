# dash-pi-hue

Control a Philips Hue bulb with an Amazon Dash button.

Runs on a Raspberry Pi

This is just an example of the implementation. All library credit goes to [hue](https://github.com/soffes/hue) & [dashed](https://github.com/kenyonj/dashed).

## Install

> This assumes you are running Raspbian & your dash button is configured for the network.

1. Install dependencies

    ```
    sudo apt-get install libpcap-dev libpq-dev ruby-dev
    gem install hue
    gem install dashed
    ```

2. Install wireshark. Press your Dash button and grab the MAC address when ARP packet is sent.

3. Create a file with the following content replacing the MAC adress with the one from Wireshark

    ```ruby
    require 'hue'
    require 'dashed'

    client = Hue::Client.new

    light = client.lights[0]

    Dashed::Button.new('aa:bb:cc:dd:ee:ff', 'wlan0').on_press do
      light.on? ? light.off! : light.on!
    end
    ```

    > If you have more than one bulb you may need to change the light index.

4. Press the button on the top of the Hue Bridge

5. Run the program `ruby app.rb`

