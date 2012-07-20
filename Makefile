YEAR			= $(shell date +%Y)
DATE 			= $(shell date +%I:%M%p)
CHECK 			= \033[32m✔\033[39m
HR 				= \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#


#
# BUILD
#
build: build_start jslint build_js build_end

#
# RUN JSHINT & QUNIT TESTS IN PHANTOMJS
#
jslint:
	@jshint ./jquery.external_links.js --config ./.jshintrc
	@echo "Running JSHint on JS...                       ${CHECK} Done"

test: jslint
	node js/tests/server.js &
	phantomjs js/tests/phantom.js "http://localhost:3000/js/test/index.html"
	kill -9 `cat js/tests/pid.txt`
	rm js/tests/pid.txt
	@echo "Running Phantom.js tests...                   ${CHECK} Done"

#
# VARIOUS BUILD STEPS
# recess & uglifyjs are required
#
build_start:
	@echo "\n"
	@echo "Starting build ..."
	@echo "${HR}\n"

build_end:
	@echo "\n${HR}"
	@echo "Successfully built on ${DATE}."
	@echo "\n"

build_js:
# remove anything from a previous build
	@rm -rf ./.*\.min.js
	@echo "Removing existing minified JS...              ${CHECK} Done"
# gen minified versions of JS files
	@for FILE in ./*.js; do uglifyjs -nc $$FILE > ./`basename "$$FILE" .js`.min.js; done
	@echo "Compiling and minifying JS...                 ${CHECK} Done"

#
# WATCH LESS & JS FILES
#
watch:
	@echo "Watching files ..."; \
	watchr build.watchr

#
# Makefile phonies ... see http://www.gnu.org/savannah-checkouts/gnu/make/manual/html_node/Phony-Targets.html
#
.PHONY: watch jslint build_start build_end build_js