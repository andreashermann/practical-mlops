install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
lint:
	pylint --disable=R,C hello.py

test:
	python -m pytest -vv --cov=hello test_hello.py

run:
	python main.py

docker_build:
	docker build -t ahermann/practical-mlops .

docker_tag:
	docker tag ahermann/practical-mlops:latest 720210078819.dkr.ecr.eu-central-1.amazonaws.com/ahermann/practical-mlops:latest

docker_login:
	aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 720210078819.dkr.ecr.eu-central-1.amazonaws.com

docker_push:
	docker push 720210078819.dkr.ecr.eu-central-1.amazonaws.com/ahermann/practical-mlops:latest

docker_run:
	docker run -it --rm ahermann/practical-mlops

docker: docker_build docker_tag docker_login docker_push
