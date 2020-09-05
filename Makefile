DOCKERPORT=8787
HOSTPORT=8787
VERSION=1.0
CONTAINER=jannetta/rstudioserver
NAME=rstudioserver
HOSTVOLUME=jupyterlab
DOCKERVOLUME=/home

build:
	docker build --force-rm -t $(CONTAINER):$(VERSION) .

run:
	docker run -d --rm --name $(NAME) -p $(HOSTPORT):$(DOCKERPORT) -p 3838:3838 -e PASSWORD=mypassword -e ROOT=TRUE -v $(HOSTVOLUME):$(DOCKERVOLUME) $(CONTAINER):$(VERSION)

stop:
	docker stop $(NAME)

start:
	docker start $(NAME)

exec:
	docker exec -ti $(NAME) bash

tar:
	docker save -o $(NAME)$(VERSION).tar $(CONTAINER):$(VERSION)

install:
	docker load -i $(NAME)$(VERSION).tar

push:
	git push --atomic origin master $(VERSION)
