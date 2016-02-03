GITHUB_PAGES_BRANCH = gh-pages
BUILD_PATH = blog/html
COMMIT_MESSAGE = 'generate my blog :honey_pot:'

build:
	tinker -b -q

github: build
	ghp-import -n -b ${GITHUB_PAGES_BRANCH} -m ${COMMIT_MESSAGE} ${BUILD_PATH}
	git push origin ${GITHUB_PAGES_BRANCH}
