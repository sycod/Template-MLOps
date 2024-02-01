install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv mon_fichier.py

format:
	black *.py

lint:
	pylint --disable=R,C patient.py

all:
	install lint test format