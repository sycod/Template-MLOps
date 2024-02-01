from setuptools import setup, find_packages

setup(
    name="patient_info",
    version="0.0.1",
    description="API test module",
    install_requires=["click"],
    entry_points="""
    [console_scripts]
    patient_info=patient_info.patient:pid
    """,
    author="JL",
    author_email="j@l.com",
    packages=find_packages(),
)