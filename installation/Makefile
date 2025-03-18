.PHONY: install
install:
	if ! [[ -e ./vars/user_vars.yml ]]; then \
		cp ./vars/user_vars.sample.yml ./vars/user_vars.yml; \
	fi 
	ansible-galaxy collection install -r requirements.yml;
	ansible-playbook playbook.yml -i inventory.ini --connection=local --ask-become-pass
