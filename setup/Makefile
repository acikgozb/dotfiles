setup:
	ansible-playbook playbook.yml -i inventory.ini --connection=local --ask-become-pass

.PHONY: run-test
init-test:
	cd ./test;USER=vagrant vagrant up; cd -

run-test:
	cd ./test;USER=vagrant vagrant provision --provision-with test; cd -
