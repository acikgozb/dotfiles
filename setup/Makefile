setup:
	ansible-playbook playbook.yml -i inventory.ini --connection=local --ask-become-pass

.PHONY: test
init-test:
	cd ./test; vagrant up --no-provision; cd -
run-test:
	cd ./test;USER=vagrant vagrant provision --provision-with ansible; cd -
cleanup-test:
	cd ./test; vagrant destroy -f; cd -

test:
	cd ./test; vagrant up; vagrant destroy -f; cd -
