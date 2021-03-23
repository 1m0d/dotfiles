from i3pystatus import Status

status = Status(logfile='/home/domi/i3pystatus.log')


# status.register("text",
        # text = "                                                                                                 ",)
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
# status.register("clock",
    # format = ('%a %b %-d %X', 'Europe/Budapest'),)

status.register("clock",
                on_leftclick = ["brave-browser http://calendar.google.com"],
                on_rightclick = ["brave-browser https://todoist.com/app/"],
                format = ('%a %b %-d %X', 'Europe/Budapest'),)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
#status.register("load")


# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
#status.register("network",
#    interface="enp1s0",
#    divisor=1024,
#    format_up="{bytes_recv}",)

# Note: requires both netifaces and basiciw (for essid and quality)
#status.register("network",
#   interface="wlan0",
#  format_up="{essid} {quality:03.0f}%",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path = "/",
    on_leftclick=["spacefm"],
    format="{used}/{total}G [{avail}G]",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
                format = "♪: {volume} {volume_bar}",)

# Weather
#status.register("weather",
 #   location_code = "HUXX0002:1:HU",
    #colorize = "true",
    #city = 'Budapest',
 #   format = "{current_temp}",)

#status.register(
 #   'weather',
  #  format='{condition} {current_temp}{temp_unit}[ {icon}][ Hi: {high_temp}][ Lo: {low_temp}][ {update_error}]',
   # interval=900,
    #colorize=True,
   # hints={'markup': 'pango'},
   # backend=weathercom.Weathercom(
   #     location_code='47.50,19.08',
   #     units='metric',
   #     update_error='<span color="#ff0000">!</span>',
   # ),
#)

status.register("xkblayout")
# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
                format="{temp:.0f}°C",)

# CPU usage
status.register("cpu_usage",
                format = "{usage}%",)

# Memory usage
status.register("mem",
        color = "#ffbf00",)

status.register("scratchpad")

#battery
status.register("battery",
                format="{status} {remaining:%E%hh:%Mm} \[{consumption:.2f} Watts\]",
    alert=True,
    alert_percentage=5,
    alert_timeout=5,
    status={
        "DIS":  "Discharging",
        "CHR":  "Charging",
        "FULL": "Bat full",
    },)


# Cmus Music Player
#status.register("cmus",
#    format = "{title}{status}",)
# status.register("text",
        # text = " ",)

status.run()
