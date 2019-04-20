# -*- coding:utf-8 -*-
# Last Change : Sun 21 Apr 2019 02:31:38.

# draw Bezier Curve

import os

SIZE = 400
IMG = "bezier.png"

# COLOR = "#88bbff"
# COLOR = ["#2196f3a0", "#88bbff77"]
COLOR = ["#96f32181", "#f321966a", "#2196f3a0"]

options = ["", "", ""]

for i in range(10):
    opt = "-draw \'bezier %d,%d" % (30 + 20 * i, 400)
    opt += " %d,%d" % (0, 200)
    opt += " %d,%d" % (0, 40)
    opt += " %d,%d\' " % (400, 200 + 5 * i)

    options[0] += opt

    opt = "-draw \'bezier %d,%d" % (0, 250 - 7 * i)
    opt += " %d,%d" % (550, 0)
    opt += " %d,%d" % (0, 500)
    opt += " %d,%d\' " % (400, 250 - 20 * i)

    options[1] += opt

    opt = "-draw \'bezier %d,%d" % (0, 300 - 7 * i)
    opt += " %d,%d" % (150, 400)
    opt += " %d,%d" % (300, 200)
    opt += " %d,%d\' " % (300 - 20 * i, 0)

    options[2] += opt


cmd = "convert -size {0}x{0} xc:black -antialias -fill none -stroke \"{1}\" -strokewidth 2 {2} -stroke \"{3}\" -strokewidth 2 {4} -stroke \"{5}\" -strokewidth 2 {6} ~/Pictures/icon/{7}".format(SIZE, COLOR[0], options[0], COLOR[1], options[1], COLOR[2], options[2], IMG)

os.system(cmd)
