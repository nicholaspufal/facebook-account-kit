.PHONY: install
install:
	@bundle

.PHONY: test
test:
	@bundle exec rspec

.PHONY: test.%
test.%:
	@bundle exec rspec spec/$*
