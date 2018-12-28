#!/usr/bin/python2
# encoding=utf-8

THRESHOLD = 50

ICON_DOWN = ""
ICON_LOW  = ""
ICON_FULL = "" 

import subprocess
import re
import sys

if __name__ == "__main__": 
	amixer = subprocess.check_output(["amixer", "get", "Master", "-M"])

	volume = re.findall("(\d{1,3})\%", amixer)
	volume = int(volume[0])

	muted = "[off]" in amixer

	if muted:
		print ICON_DOWN + " muted"
	else:
		volume_str = "   %d"%(volume) + "%  "

		if volume == 0: 
			print ICON_DOWN + volume_str
		elif volume < THRESHOLD:
			print ICON_LOW + volume_str
		else:
			print ICON_FULL + volume_str

