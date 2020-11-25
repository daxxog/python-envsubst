#!/bin/bash
# to use this -->
# source ./env.sh

pyenv install -s
if [ ! -d env ]; then
    python3 -m venv env
fi
source env/bin/activate

if [ ! -d env/lib/*/site-packages/jedi ]; then
    env/bin/pip install --upgrade pip setuptools wheel
    env/bin/pip install -r requirements.dev.txt
fi

test() {
    env/bin/python -m unittest tests/test_envsubst.py
    exit $?
}
