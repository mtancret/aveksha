# verticalaxis.py
# Purpose: Draws a vertical axis.
# Author(s): Matthew Tan Creti
#
# Copyright 2011 Purdue University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import math
from Tkinter import *
from chart import *
from graphicutil import *

class VerticalAxis(Chart):
	def __init__(self, label, rangeMin, rangeMax, xMin=0, yMin=0, xMax=0, yMax=0, minTick=None, maxTick=None, tickInterval=None):
		self.label = label
		self.rangeMin = rangeMin
		self.rangeMax = rangeMax	
		self.xMin = xMin
		self.yMin = yMin
		self.xMax = xMax
		self.yMax = yMax	
		if minTick == None:
			self.minTick = int(math.ceil(rangeMin))
		else:
			self.minTick = minTick
		if maxTick == None:
			self.maxTick = int(math.floor(rangeMax))
		else:
			self.maxTick = maxTick
		if tickInterval == None:
			self.tickInterval = int(math.floor( (self.maxTick-self.minTick)/5.0 ))
		else:
			self.tickInterval = tickInterval
		if self.tickInterval == 0:
			self.tickInterval = 1

	def draw(self, canvas):
		# draw vertical line
		canvas.create_line(self.xMax, self.yMin, self.xMax, self.yMax)

		# draw ticks and labels
		for tick in range(self.minTick, self.maxTick, self.tickInterval):
			y = self.getY(tick)
			canvas.create_line(self.xMax-3, y, self.xMax, y)
			
			canvas.create_text(self.xMax-20, y, text=str(tick), anchor=W)

		# draw axis label
		create_text_rotate(canvas, self.label, self.xMax-40, self.yMin+(self.yMax-self.yMin)/2, degrees=-90, anchor="w")
