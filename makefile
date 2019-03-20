VERSION     = $(shell python version.py)
PROJECT     = jupyter-notebook
REGISTRY	= arvintian

build: Dockerfile requirements.txt
	@echo ====================build====================
	docker build -t $(REGISTRY)/$(PROJECT):${VERSION} .

test: 
	@echo ====================test====================
	docker run --rm -ti --name jupyter-test -p 8000:8000 \
	-e PORT=8000 \
	-e PASSWORD=123456 \
	-e JUPYTER_ENABLE_LAB=yes \
	$(REGISTRY)/$(PROJECT):${VERSION}
	
publish: build
	@echo ====================publish====================
	docker push $(REGISTRY)/$(PROJECT):$(VERSION)

clean:
	docker images | grep -E "($(PROJECT)\s+)" | awk '{print $$3}' | uniq | xargs -I {} docker rmi --force {}