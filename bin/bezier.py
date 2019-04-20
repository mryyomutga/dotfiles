import os
import pprint

SIZE = 400
IMG = "bezier.png"

# COLOR = "#88bbff"
COLOR = ["#2196f3a0", "#88bbff77"]

options = ["", ""]

for i in range(10):
    opt = "-draw \'bezier %d,%d" % (30 + 20 * i, 400)
    opt += " %d,%d" % (0, 200)
    opt += " %d,%d" % (0, 40)
    opt += " %d,%d\' " % (400, 200 + 5 * i)

    options[0] += opt

    opt = "-draw \'bezier %d,%d" % (0, 300 - 7 * i)
    opt += " %d,%d" % (150, 400)
    opt += " %d,%d" % (300, 200)
    opt += " %d,%d\' " % (300 - 20 * i, 0)

    options[1] += opt


cmd = "convert -size {0}x{0} xc:black -antialias -fill none -stroke \"{1}\" -strokewidth 2 {2} -stroke \"{3}\" -strokewidth 2 {4} {5}".format(SIZE, COLOR[0], options[0], COLOR[1], options[1], IMG)

os.system(cmd)
