.PHONY: setup
install:
	ansible-galaxy collection install -r requirements.yml;
	ansible-playbook playbook.yml -i inventory.ini --connection=local --ask-become-pass
