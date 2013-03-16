# Create new lab entries.
# Copyright 2013 Tom Vincent <http://tlvince.com/contact>

all: new

new:
	@read -p "Title: " title; \
	read -p "Description: " description; \
	url=$$(echo "$$title" | sed \
		-e "s/\(.*\)/\L\1/" \
		-e "s/\&/and/g" \
		-e "s/\s\+/-/g" \
		-e "s/[^a-z0-9-]//g"); \
	out="$$url.yaml"; \
	echo "title: $$title" >> "$$out"; \
	echo "date: $$(date +'%F %T %z')" >> "$$out"; \
	echo "url:" >> "$$out"; \
	echo "description: $$description" >> "$$out"; \
	echo "tags:" >> "$$out"; \

proof:
	aspell --dont-backup check $(doc)
	diction --language en_GB --beginner --suggest $(doc) | less
	style --language en_GB $(doc) | less
