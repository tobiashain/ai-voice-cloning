#!/bin/bash
ulimit -Sn `ulimit -Hn` # ROCm is a bitch
source ./venv/bin/activate
python3 ./src/main.py "$@"
# Deactivate the virtual environment using an interactive Python session
python - <<END
import os
import sys

if sys.prefix != sys.base_prefix:
    os.system('deactivate')

END
