
install:
	#install commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	#format code
	#black *.py mylib/*.py
lint:
	#flake8 or #pylint
	#pylint --disable=R,C *.py mylib/*.py
test:
	#test
	python -m pytest -vv --cov=mylib --cov=main --cov=calCLI test_*.py
build:
	#build container
	docker build -t deploy-fastapi .
run:
	#run docker
	#docker run -p 127.0.0.1:8080:8080 c1a36ab4da9d
deploy:
	#deploy

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor:
	format lint

all: install lint test format deploy