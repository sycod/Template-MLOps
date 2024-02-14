# MLOps template : todo

- Dev containers (Docker)
- Github Actions
- MLFlow example

# Python version management

With **pyenv** :

```shell
pyenv install 3.11.6
pyenv local 3.11.6 # creates .python-version file, already included
pyenv versions # lists all installed python versions
python --version # check 
```

# Environment management

With **venv** :

``` shell
python -m venv env # to do if new, creates env folder (already git-ignored)
source env/Scripts/activate # activate environment
```

Restart VSCode for automatic environment activation.

> To check usage of requested Python version, use `which python` 
> or `which pip` for Pip.

# Packages management

`pip freeze` is too verbose and can lead to interferences.  
Use `pipreqs` for python files and `pipreqsnb` for notebooks.  

> To fix encoding issue, use `pipreqs --encoding utf-8`

With **pipreqsnb** :

``` shell
# once env activated
python -m pip install --upgrade pip # update pip
pip install -r requirements.txt # install required packages
pipreqsnb --encoding utf-8 --force # updates requirements.txt from notebook needs
```

# CLI, deployment & distribution

First, check `setup.py` file at folder root as is :

``` python
from setuptools import setup, find_packages

setup(
    name="my_package",
    version="0.0.1",
    description="My incredibly concise description",
    install_requires=["click", "another_requirement"], # click for CLI
    entry_points="""
    [console_scripts]
    cli_command=package_folder.file:function
    """,
    author="me, myself and I",
    author_email="donotreply@free_provider.com",
    packages=find_packages(),
)
```

Don't forget `__init__.py` files in packages folders.  

``` shell
# /!\ IN ENV /!\ at folder root
pip install -e . # -e is for --editable
# once ready for distribution:
pip uninstall my_package
pip install . # still at folder root
# for distribution
pip wheel .
```

Useful concise practice [here](https://brandonrozek.com/blog/pipeditable/) and more distribution documentation [here](https://pip.pypa.io/en/stable/cli/pip_wheel/).
