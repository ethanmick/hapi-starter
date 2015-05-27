#
# The Make File
# This gives you simple and fast commands to launch your project.
# It also allows new comers to get involved super easily.
#

run:
	PORT=9037 \
	node coffee_bridge.js

unit:
	./node_modules/mocha/bin/_mocha \
	--compilers coffee:coffee-script/register \
	./test/unit

cov:
	WINSTON=error \
	./node_modules/mocha/bin/_mocha \
	--compilers coffee:coffee-script/register \
	--require ./node_modules/blanket-node/bin/index.js \
	-R travis-cov \
	./test/unit ./test/integration

cov-report:
	WINSTON=error \
	./node_modules/mocha/bin/_mocha \
	--compilers coffee:coffee-script/register \
	--require ./node_modules/blanket-node/bin/index.js \
	-R html-cov > coverage.html \
	./test/unit ./test/integration
	open coverage.html

integration:
	./node_modules/mocha/bin/_mocha \
	--compilers coffee:coffee-script/register \
	./test/integration

lint:
	./node_modules/coffeelint/bin/coffeelint \
	./lib ./test

check-dependencies:
	./node_modules/david/bin/david.js

test:
	$(MAKE) unit
	$(MAKE) integration
	$(MAKE) cov
	$(MAKE) lint


.PHONY: test
