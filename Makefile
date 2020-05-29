install:
	pip3 install -r requirements.txt

test:
	# tests step

lint:
	# linter for Dockerfiles
	hadolint Dockerfile
	# pylint test for app.py
	pylint --disable=R,C,W1203,W1309 app.py

all: install lint test
