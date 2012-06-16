# graphicutil.py
# Purpose: Utilities for graphic manipulation.
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

from PIL import Image, ImageTk, ImageFont, ImageDraw, ImageOps

photoImg = None

def create_text_rotate(canvas, text, x, y, degrees=-90, anchor="c"):
	global photoImg

	# Example code from:
	# http://stackoverflow.com/questions/245447/how-do-i-draw-text-at-an-angle-using-pythons-pil
	imgFont = ImageFont.truetype("/usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf", 12)
	imgText = Image.new('L', imgFont.getsize(text))
	imgDraw = ImageDraw.Draw(imgText)
	imgDraw.text((0,0), text, font=imgFont, fill=255)
	w = imgText.rotate(degrees,  expand=1)
	img = Image.new("RGB", (imgText.size[1], imgText.size[0]), "white")
	img.paste( ImageOps.colorize(w, (0,0,0), (0,0,0)), (0,0),  w)

	photoImg = ImageTk.PhotoImage(img)

	canvas.create_image(x, y, image=photoImg, anchor=anchor)
