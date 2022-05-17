.PHONY: all

all: .installed.cfg

py3/bin/pip:
	python3 -m venv py3 || virtualenv -p python3 --no-site-packages --no-setuptools py3 || virtualenv -p python3 --no-setuptools py3

py3/bin/buildout: py3/bin/pip requirements.txt
	./py3/bin/pip install -IUr requirements.txt

buildout_cfgs := $(wildcard *.cfg config/*.cfg profiles/*.cfg custom.cfg)
.installed.cfg: py3/bin/buildout $(buildout_cfgs)
	./py3/bin/buildout

