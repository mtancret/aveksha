# tracechart.py
# Purpose: Draws a chart of the execution trace.
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

from Chart import *

COLOR_SCHEME = ["red", "gray50", "orange", "magenta", "purple"]
STARTING_COLOR_SCHEME = ["blue", "cyan"]
STARTED_COLOR_SCHEME = ["green", "blueviolet"]
STOPPED_COLOR_SCHEME = ["black", "gray50"]
ON_COLOR_SCHEME = ["green", "blue"]
OFF_COLOR_SCHEME = ["black"]

class TraceChart(Chart):
	def __init__(self, traceDataSet=None, domainMin=None, domainMax=None, xMin=0, yMin=0, xMax=0, yMax=0):
		self.traceDataSet = traceDataSet
		if domainMin == None:
			self.domainMin = traceDataSet.domainMin
		else:
			self.domainMin = domainMin
		if domainMax == None:
			self.domainMax = traceDataSet.domainMax
		else:
			self.domainMax = domainMax
		self.numNames = len(traceDataSet.getNames())
		self.xMin = xMin
		self.yMin = yMin
		self.xMax = xMax
		self.yMax = yMax

	def draw(self, canvas):
		y = self.yMin
		for name in self.traceDataSet.getNames():
			data = self.traceDataSet.getData(name)
			values = self.traceDataSet.getValues(name)

			#assign colors
			colorMap = {}
			startingIdx = 0
			startedIdx = 0
			stoppedIdx = 0
			onIdx = 0
			offIdx = 0
			otherIdx = 0
			for i in range(len(values)):
				if values[i].endswith("STARTED"):
					color = STARTED_COLOR_SCHEME[startedIdx]
					startedIdx += 1
				elif values[i].endswith("STARTING"):
					color = STARTING_COLOR_SCHEME[startingIdx]
					startingIdx += 1
				elif values[i].endswith("STOPPED"):
					color = STOPPED_COLOR_SCHEME[stoppedIdx]
					stoppedIdx += 1
				elif values[i].endswith("ON"):
					color = ON_COLOR_SCHEME[onIdx]
					onIdx += 1
				elif values[i].endswith("OFF"):
					color = OFF_COLOR_SCHEME[offIdx]
					offIdx += 1
				else:
					color = COLOR_SCHEME[otherIdx]
					otherIdx += 1

				colorMap[values[i]] = color

			lastX = self.xMin
			lastColor = COLOR_SCHEME[0]
			for (time, value) in data:
				#if time < self.domainMin:
				#	continue

				x = int(self.getX(time))
				if value == None:
					color = "white"
				else:
					color = colorMap[value]		
				if values == [] and time >= self.domainMin:
					#canvas.create_rectangle(x, y+1, x, y+11, fill=color)
					canvas.create_line(x, y+1, x, y+11)
				else:
					#if x <= lastX:
					#	x = lastX+1
					if lastX != None and time >= self.domainMin:
						canvas.create_rectangle(lastX, y+1, x, y+11, outline=lastColor, fill=lastColor)
						lastX = x
					lastColor = color
			if values != []:
				canvas.create_rectangle(lastX, y+1, self.xMax, y+11, outline=lastColor, fill=lastColor)

			y += 14

			if values != []:
				xText = self.xMin
				i = 0
				for value in values:
					canvas.create_text(xText, y+5, text=value, fill=colorMap[value])	
					xText += 250
					i += 1
					if i%2 == 0:
						xText = self.xMin
						y += 14
				y += 14
