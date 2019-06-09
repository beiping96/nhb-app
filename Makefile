
# https://github.com/flutter/flutter_web
# https://dart.dev/guides/libraries/create-library-packages

# Dart 2.2+

# 1. flutter pub global activate webdev
# 2. pub get
# 3. webdev serve

# flutter pub upgrade

default:
	webdev serve

init:
	flutter pub global activate webdev
	pub get

build:
	webdev build

serve:
	webdev serve

clean:
	-rm -rf ./.dart_tool
	-rm .packages
