# tracedataset.py
# Purpose: Represents trace data.
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

from dataset import *

class TraceDataSet(DataSet):
	def __init__(self, tuples):
		self.setData(tuples)

	# tuple is (time, name, value)
	# assumes tuples in assending order of time
	def setData(self, tuples):
		self.data = tuples

		self.timeMin = tuples[0][0]
		self.timeMax = tuples[-1][0]

		self.names = []
		self.values = {}
		self.namedData = {}
		for tuple in tuples:
			if not tuple[1] in self.names:
				self.names.append(tuple[1])
				self.values[tuple[1]] = []
				self.namedData[tuple[1]] = []

			if tuple[2] != None and not tuple[2] in self.values[tuple[1]]:
				self.values[tuple[1]].append(tuple[2])
				self.values[tuple[1]].sort()

			self.namedData[tuple[1]].append( (tuple[0], tuple[2]) )
		self.names.sort()

	# gets a list of all names
	def getNames(self):
		return self.names

	# gets all values associated with a name
	def getValues(self, name):
		return self.values[name]

	# gets all data for name in tuple form (time, value)
	def getData(self, name):
		return self.namedData[name]
