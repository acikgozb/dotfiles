.PHONY: setup init-test run-test ssh-test
setup:
	ansible-galaxy collection install -r requirements.yml;
	ansible-playbook playbook.yml -i inventory.ini --connection=local --ask-become-pass

init-test:
	cd ./test;USER=vagrant vagrant up; cd -

run-test:
	cd ./test;USER=vagrant vagrant provision --provision-with test; cd -

ssh-test:
	cd ./test; vagrant ssh; cd -
