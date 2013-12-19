python << endpython
import sys

PLUGIN_PATH = '/home/seiv/.vim/bundle/vim-python-scripting/plugin/'

if PLUGIN_PATH not in sys.path:
    sys.path.append(PLUGIN_PATH )

import vimhelper

endpython

