setup: install

install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -a

.PHONY: test