APP ?= go-toolbox
IMG ?= sko00o/$(APP)

build:
	docker build --rm -t $(IMG) .

publish: build
	docker push $(IMG)

buildx:
	docker buildx build \
	--push \
	--platform linux/amd64,linux/arm64 \
	--tag $(IMG):latest \
	.
