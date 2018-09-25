VERSION:=1.6.17

all: aws-sdk-cpp
	mkdir -p aws-sdk-cpp/build
	cd aws-sdk-cpp/build && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_ONLY="s3" -DENABLE_TESTING=OFF ..
	cd aws-sdk-cpp/build && make

install:
	cd aws-sdk-cpp/build && make install

aws-sdk-cpp:
	git clone --depth 1 -b ${VERSION} https://github.com/aws/aws-sdk-cpp.git
