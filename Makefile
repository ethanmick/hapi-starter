run:
	node coffee_bridge.js

unit:
	./node_modules/mocha/bin/_mocha --compilers coffee:coffee-script/register ./test/unit


integration:
	-rm nohup.out
	$(MAKE) kill-node
	(NODE_ENV=development nohup node coffee_bridge.js &)
	sleep 3
	./node_modules/mocha/bin/_mocha --compilers coffee:coffee-script/register ./test/integration


test:
	-rm nohup.out
	$(MAKE) unit
	$(MAKE) integration
	$(MAKE) kill-node

kill-node:
	-kill `ps -eo pid,comm | awk '$$2 == "node" { print $$1 }'`

.PHONY: test
