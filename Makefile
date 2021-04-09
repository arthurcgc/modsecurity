build-latest:
	docker build . -t arthurcgc/modsecurity:latest
push-latest:
	docker push arthurcgc/modsecurity:latest