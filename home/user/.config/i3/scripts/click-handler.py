#!/usr/bin/python2

import json
import sys
import os
import subprocess

def execute(command, callback=None):
	proc = subprocess.Popen(command, stdout=subprocess.PIPE)
	stdout = ""

	while True:
		line = proc.stdout.readline().strip()
		if len(line) == 0:
			break

		stdout += "%s\n"%line

		if callback != None:
			callback(line)

	return stdout

def yad(callback, text, value, geometry, orientation="vertical"):
	if orientation != "vertical":
		orientation = "horizontal"

	options = ["--scale", "--no-buttons", "--text-align=center", "--print-partial"]

	return execute(["yad", "--text=%s"%text, "--%s"%orientation, "--geometry=%dx%d+%d+%d"%geometry] + options, callback)


def shutdown():
	os.system('i3-nagbar -m "Really?" -t warning -b "Shutdown" "poweroff" > /dev/null')

def suspend():
	os.system("systemctl suspend")

def fan(value):
	os.system("fanspeed %s"%value)

def calendar(): 
	os.system("gsimplecal")

def wallpaper():
	os.system("$HOME/.config/i3/random-wallpaper.sh")

if __name__ == "__main__" and len(sys.argv) == 2:
	data = sys.argv[1].strip(",")
	data = json.loads(data)
	name = data["name"]
	x = int(data["x"])

	if name == "shutdown":
		shutdown()
	elif name == "suspend":
		suspend()
	elif name == "system":
		yad(fan, "fan speed", 0, (0, 200, x - 50, 25))
	elif name == "calendar": 
		calendar()
	elif name == "wallpaper":
		wallpaper()
