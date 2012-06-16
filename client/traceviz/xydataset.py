# xydataset.py
# Purpose: Represents a dataset of pairs.
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

class XyDataSet(DataSet):
	def __init__(self, xyPairs):
		self.setData(xyPairs)

	def setData(self, xyPairs):
		self.data = xyPairs

		self.domainMin = None
		self.domainMax = None
		self.rangeMin = None
		self.rangeMax = None
		for pair in xyPairs:
			if self.domainMin == None or pair[0] < self.domainMin:
				self.domainMin = pair[0]
			if self.domainMax == None or pair[0] > self.domainMax:
				self.domainMax = pair[0]
			if self.rangeMin == None or pair[1] < self.rangeMin:
				self.rangeMin = pair[1]
			if self.rangeMax == None or pair[1] > self.rangeMax:
				self.rangeMax = pair[1]
