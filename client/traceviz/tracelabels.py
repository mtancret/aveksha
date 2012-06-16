# tracelabels.py
# Purpose: Draws labels for trace chart.
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
from chart import *

class TraceLabels(Chart):
	def __init__(self, traceDataSet, xMin=0, yMin=0, xMax=0, yMax=0):
		self.traceDataSet = traceDataSet
		self.xMin = xMin
		self.yMin = yMin
		self.xMax = xMax
		self.yMax = yMax	

	def draw(self, canvas):
		y = self.yMin+6
		for name in self.traceDataSet.getNames():
			canvas.create_text(self.xMax, y, text=name, anchor="e")

			values = self.traceDataSet.getValues(name)
			extra = 0
			if len(values) > 0:
				extra = 1 + len(values)/2	
			y = y + 14 + (14*extra)
