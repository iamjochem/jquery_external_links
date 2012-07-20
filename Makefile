YEAR			= $(shell date +%Y)
DATE 			= $(shell date +%I:%M%p)
CHECK 			= \033[32m✔\033[39m
HR 				= \#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#


#
# BUILD
#
build: build_start jslint build_js build_end

#
# RUN LINT AND UNIT TESTS
# jshint & phantomjs are required
#
jslint:
	@jshint ./jquery.external_links.js --config ./.jshintrc
	@echo "Running JSHint on JS...                       ${CHECK} Done"

test: jslint
	@node test/server.js &
	@sleep 1
	@$$( \
		phantomjs test/phantom.js "http://localhost:3000/test/index.html"; \
		TEST_EXIT_STATUS="$$?"; \
		kill -9 `cat ./test/pid.txt`; \
		rm test/pid.txt; \
		exit $$TEST_EXIT_STATUS \
	)
	@echo "Running qUnit tests...                        ${CHECK} Done"

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
	@rm -rf ./jquery.external_links.min.js
	@echo "Removing existing minified JS...              ${CHECK} Done"
# gen minified versions of JS files
	@uglifyjs -nc ./jquery.external_links.js > ./jquery.external_links.min.js
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