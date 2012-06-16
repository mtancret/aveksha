# window.py
# Purpose: The main window.
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

from Tkinter import *
from powerchart import *
from tracechart import *
from verticalaxis import *
from horizontalaxis import *
from tracelabels import *
import graphicutil

class Window:
	def __init__(self, powerDataSet, traceDataSet, startTime=None, endTime=None):
		self.powerDataSet = powerDataSet
		self.traceDataSet = traceDataSet
		self.startTime = startTime
		self.endTime = endTime

	def show(self):
		root = Tk()

		canvas = Canvas(root, width=700, height=700, bg="white")
		canvas.pack()
	
		########### power
		powerChart = PowerChart(self.powerDataSet, self.startTime, 0, self.endTime, None, 260, 20, 650, 100)
		powerChartVerticalAxis = VerticalAxis("Power (mW)", powerChart.rangeMin, powerChart.rangeMax, powerChart.xMin-50, powerChart.yMin, powerChart.xMin, powerChart.yMax)
		powerChartHorizontalAxis = HorizontalAxis("Time (ms)", powerChart.domainMin, powerChart.domainMax, powerChart.xMin, powerChart.yMax, powerChart.xMax, powerChart.yMax+50)

		powerChart.draw(canvas)
		powerChartVerticalAxis.draw(canvas)
		powerChartHorizontalAxis.draw(canvas)

		########### trace
		traceChart = TraceChart(self.traceDataSet, powerChart.domainMin, powerChart.domainMax, 260, 130, 650, 230)
		traceLabels = TraceLabels(self.traceDataSet, traceChart.xMin-50, traceChart.yMin, traceChart.xMin, traceChart.yMax)

		traceChart.draw(canvas)
		traceLabels.draw(canvas)

		mainloop()
