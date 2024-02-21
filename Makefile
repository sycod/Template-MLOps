bashrc:
	# apply once at VM start
	# alias
	echo "alias ll='ls -alF'" >> ~/.bashrc
	# launch virtual env at startup
	echo "source ~./env/Scripts/activate" >> ~/.bashrc

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C patient.py

test:
	# --cov=my_function test_*.py for details on a function
	# test_*.py → python tests files are prefixed as is
	#  --disable-warnings, if needed
	python -m pytest -vvv

format:
	# --force-exclude '<FILE_OR_FOLDER>' if needed (env, imported, models...)
	black *.py

all:
	install lint test format

# personal and not click-setup-installed commands
api_launch:
	python $(CURDIR)/blueprint_fast_api.py
