# traceparser.py
# Purpose: Parses the trace data.
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

from xydataset import *
from tracedataset import *

class TraceParser:
	def __init__(self, traceFileName, mapFileName):
		self.traceFileName = traceFileName
		self.mapFileName = mapFileName

	def getPowerDataSet(self):
		file = open(self.traceFileName, 'r')
		data = []

		for line in file:
			words = line.split()
			if len(words) > 1:
				if line[0][0] == "p":
					try:
						time = float(words[0][1:-2])
						power = float(words[1][0:-2])
						data.append( (time, power) )
					except ValueError:
						print "Error: getPowerDataSet could not parse line: ", line
		
		file.close()
		return XyDataSet(data)

	def getMap(self):
		file = open(self.mapFileName, 'r')
		map = {}

		for line in file:
			words = line.split()
			if len(words) == 3:
				map[words[0]] = (words[1], words[2])
			elif len(words) == 2:
				map[words[0]] = (words[1], None)

		file.close()
		return map
				
	def getTraceDataSet(self):
		file = open(self.traceFileName, 'r')
		map = self.getMap()
		data = []

		for line in file:
			words = line.split()
			if len(words) > 1:
				if words[0][:2] == "0x":
					try:
						address = words[0][2:]
						time = float(words[1])/1000000
						(name, value) = map[address]
						data.append( (time, name, value) )
					except KeyError:
						print "Error: address not found:", line
		file.close()
		return TraceDataSet(data)
