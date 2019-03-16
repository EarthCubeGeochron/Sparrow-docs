all: dist/schema.html

dist:
	mkdir -p $@

dist/schema.html: Sparrow/backend/sparrow/sql/02-create-tables.sql | dist
	cat $^ \
	| bin/sql-to-markdown \
	| pandoc --standalone -f markdown -o $@
