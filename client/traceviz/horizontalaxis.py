# horizontalaxis.py
# Purpose: Draws a horizontal axis.
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

class HorizontalAxis(Chart):
	def __init__(self, label, domainMin, domainMax, xMin=0, yMin=0, xMax=0, yMax=0, minTick=None, maxTick=None, tickInterval=None):
		domainMax = domainMax - domainMin
		domainMin = 0
		domainMax *= 1000
		self.label = label
		self.domainMin = domainMin
		self.domainMax = domainMax	
		self.xMin = xMin
		self.yMin = yMin
		self.xMax = xMax
		self.yMax = yMax	
		if minTick == None:
			self.minTick = int(math.ceil(domainMin))
		else:
			self.minTick = int(minTick)
		if maxTick == None:
			self.maxTick = int(math.floor(domainMax))
		else:
			self.maxTick = int(maxTick)
		if tickInterval == None:
			self.tickInterval = int(math.floor( (self.maxTick-self.minTick)/5.0 ))
		else:
			self.tickInterval = int(tickInterval)
		if self.tickInterval < 1:
			self.tickInterval = 1

	def draw(self, canvas):
		# draw vertical line
		canvas.create_line(self.xMin, self.yMin, self.xMax, self.yMin)

		# draw ticks and labels
		for tick in range(self.minTick, self.maxTick, self.tickInterval):
			x = self.getX(tick)
			canvas.create_line(x, self.yMin+3, x, self.yMin)
			
			canvas.create_text(x, self.yMin+4, text=str(tick), anchor=N)

		# draw axis label
		canvas.create_text( self.xMin + (self.xMax-self.xMin)/2, self.yMin+15, text=self.label, anchor=N)
