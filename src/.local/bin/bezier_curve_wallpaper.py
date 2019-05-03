# -*- coding:utf-8 -*-
# Last Change : Wed 01 May 2019 21:03:05.
# drawing background image

import os

IMG = "~/Pictures/wallpapers/background.png"

COLOR = ["#a8af5c9b", "#43f36581", "#f321966a", "#2196f3a0"]

options = ["", "", "", ""]

for i in range(10):
    opt = "-draw \'bezier {0},{1}".format(0 + i * 20, 0)
    opt += " {0},{1}".format(420, 1080 - i * i)
    opt += " {0},{1}".format(840 + 25 * i, 0)
    opt += " {0},{1}\' ".format(1920 - i * 10, 1080)

    options[0] += opt

    opt = "-draw \'bezier {0},{1}".format(430 + 20 * i, 1080)
    opt += " {0},{1}".format(0, 540)
    opt += " {0},{1}".format(0, 140)
    opt += " {0},{1}\' ".format(1920, 200 - 5 * i)

    options[1] += opt

    opt = "-draw \'bezier {0},{1}".format(0, 235 - 7 * i)
    opt += " {0},{1}".format(2000, 0)
    opt += " {0},{1}".format(0, 1180)
    opt += " {0},{1}\' ".format(1920, 954 - 20 * i)

    options[2] += opt

    opt = "-draw \'bezier {0},{1}".format(0, 960 - 7 * i)
    opt += " {0},{1}".format(150, 1080)
    opt += " {0},{1}".format(1280, 920)
    opt += " {0},{1}\' ".format(1500 - 25 * i, 0)

    options[3] += opt

cmd = "convert -size 1920x1080 xc:black -antialias -fill none -strokewidth 2 -stroke \"{0}\" {1} -stroke \"{2}\" {3} -stroke \"{4}\" {5} -stroke \"{6}\" {7} {8}".format(COLOR[0], options[0], COLOR[1], options[1], COLOR[2], options[2], COLOR[3], options[3], IMG)

os.system(cmd)