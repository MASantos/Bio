from modeller.automodel import *

env = environ()
a = automodel(env, alnfile='naipKYDIRV_1i3oEF-mult.ali',
              knowns=('1i3oE','1i3oF'), sequence='NAIP')
a.starting_model = 1
a.ending_model = 20
a.make()
