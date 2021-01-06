.DEFAULT_GOAL := help

IMAGE = tomcant.github.io:latest
DOCKER = docker run --rm -it -v $(PWD):/app:rw,delegated

.PHONY: build
build:
	docker build -t $(IMAGE) .

.PHONY: start
start: build ## Start the local development environment.
	$(DOCKER) -p 4000:4000 $(IMAGE)

.PHONY: shell
shell: ## Start an interactive shell with access to Ruby/Jekyll.
	$(DOCKER) --entrypoint bash $(IMAGE)

.PHONY: publish
publish: _require_GITHUB_TOKEN ## Trigger a new build/release on GitHub Pages.
	curl -X PUT -H "Authorization: token ${GITHUB_TOKEN}" \
	  https://api.github.com/repos/tomcant/tomcant.github.io/contents/.publish -d \
	  '{ \
	    "message": "Scripted rebuild", \
	    "committer": { \
	      "name": "RebuildBot", \
	      "email": "rebuildbot@tomcant.dev" \
	    }, \
	    "content": "LnB1Ymxpc2gK", \
	    "sha": "3f949857e8ed4cb106f9744e40b638a7aabf647f" \
	  }'

_require_%:
	@_=$(or $($*),$(error "`$*` env var required"))

# https://blog.thapaliya.com/posts/well-documented-makefiles/
.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\n"} /^[a-zA-Z_\\\-\\\/]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
