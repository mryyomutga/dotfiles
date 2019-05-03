# -*- coding:utf-8 -*-
# Last Change : Mon 29 Apr 2019 23:43:26.

# draw Bezier Curve

import os

SIZE = 400
IMG = "bezier.png"

# COLOR = "#88bbff"
# COLOR = ["#2196f3a0", "#88bbff77"]
COLOR = ["#96f32181", "#f321966a", "#2196f3a0"]

options = ["", "", ""]

for i in range(10):
    opt = "-draw \'bezier {0},{1}".format(30 + 20 * i, 400)
    opt += " {0},{1}".format(0, 200)
    opt += " {0},{1}".format(0, 40)
    opt += " {0},{1}\' ".format(400, 200 + 5 * i)

    options[0] += opt

    opt = "-draw \'bezier {0},{1}".format(0, 250 - 7 * i)
    opt += " {0},{1}".format(550, 0)
    opt += " {0},{1}".format(0, 500)
    opt += " {0},{1}\' ".format(400, 250 - 20 * i)

    options[1] += opt

    opt = "-draw \'bezier {0},{1}".format(0, 300 - 7 * i)
    opt += " {0},{1}".format(150, 400)
    opt += " {0},{1}".format(300, 200)
    opt += " {0},{1}\' ".format(300 - 20 * i, 0)

    options[2] += opt


cmd = "convert -size {0}x{0} xc:black -antialias -fill none -strokewidth 2 -stroke \"{1}\" -strokewidth 2 {2} -stroke \"{3}\" {4} -stroke \"{5}\" {6} ~/Pictures/icons/{7}".format(SIZE, COLOR[0], options[0], COLOR[1], options[1], COLOR[2], options[2], IMG)

os.system(cmd)