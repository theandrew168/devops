.POSIX:
.SUFFIXES:

.PHONY: default
default: lint

.PHONY: lint
lint:
	ansible-lint -x 'no-handler' -x 'no-changed-when' -x 'var-naming[no-role-prefix]' -x 'name[casing]' -x 'yaml[line-length]' -x 'name[play]'

bloggulus:
	ansible-playbook -i hosts -u derz --ask-become-pass bloggulus.yml
