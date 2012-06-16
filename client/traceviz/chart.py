# chart.py
# Purpose: Represents dimensions of a chart.
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

class Chart:
	def __init__(self, domainMin=0, rangeMin=0, domainMax=0, rangeMax=0, xMin=0, yMin=0, xMax=0, yMax=0):
		self.domainMin = domainMin
		self.domainMax = domainMax
		self.rangeMin = rangeMin
		self.rangeMax = rangeMax
		self.xMin = xMin
		self.xMax = xMax
		self.yMin = yMin
		self.yMax = yMax

	def getX(self, domain):
		return self.xMin + (self.xMax - self.xMin) / (self.domainMax - self.domainMin) * (domain - self.domainMin)

	def getY(self, range):
		return self.yMax - (self.yMax - self.yMin) / (self.rangeMax - self.rangeMin) * (range - self.rangeMin)
