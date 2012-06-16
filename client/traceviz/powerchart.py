# powerchart.py
# Purpose: Draws a chart of power consumption.
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

class PowerChart(Chart):
	def __init__(self, xyDataSet=None, domainMin=None, rangeMin=None, domainMax=None, rangeMax=None, xMin=0, yMin=0, xMax=0, yMax=0):
		self.dataSet = xyDataSet
		if domainMin == None:
			self.domainMin = xyDataSet.domainMin
		else:
			self.domainMin = domainMin
		if domainMax == None:
			self.domainMax = xyDataSet.domainMax
		else:
			self.domainMax = domainMax
		if rangeMin == None:
			self.rangeMin = xyDataSet.rangeMin
		else:
			self.rangeMin = rangeMin
		if rangeMax == None:
			self.rangeMax = xyDataSet.rangeMax
		else:
			self.rangeMax = rangeMax
		self.xMin = xMin
		self.yMin = yMin
		self.xMax = xMax
		self.yMax = yMax

	def draw(self, canvas):
		lastX = None
		lastY = None
		for point in self.dataSet.data:
			if point[0] < self.domainMin:
				continue

			x = self.getX(point[0])
			y = self.getY(point[1])

			if lastX != None:
				canvas.create_line(lastX, lastY, x, y)

			lastX = x
			lastY = y
