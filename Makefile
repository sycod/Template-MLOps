install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv mon_fichier.py

format:
	black *.py

lint:
	pylint --disable=R,C mon_fichier.py

all:
	install lint test format