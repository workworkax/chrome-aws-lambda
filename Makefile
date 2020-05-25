%.zip:
	mkdir -p nodejs/node_modules/chrome-aws-lambda/
	cd nodejs/ && npm install lambdafs@~1.3.0 puppeteer-core@~3.1.0 --no-bin-links --no-optional --no-package-lock --no-save --no-shrinkwrap && cd -
	npm pack
	tar --directory nodejs/node_modules/chrome-aws-lambda/ --extract --file chrome-aws-lambda-*.tgz --strip-components=1
	rm chrome-aws-lambda-*.tgz
	mkdir -p $(dir $@)
	mkdir fonts
	wget  -O fonts/NotoColorEmoji.ttf https://raw.githack.com/googlei18n/noto-emoji/master/fonts/NotoColorEmoji.ttf
	wget  -O fonts/NotoSansCJKhk-Regular.otf https://rawcdn.githack.com/googlei18n/noto-cjk/cf29231ab8029678af4bbc1a9480e2b296a5b2d3/NotoSansCJKhk-Regular.otf
	zip -9 --filesync --move --recurse-paths $@ nodejs/ fonts/
