export PATH := /usr/local/bin:$(PATH)

default: compile

compile:
	zephir compile

install:
	zephir install

clean:
	zephir fullclean
