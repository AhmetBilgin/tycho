#!/usr/bin/bash
baseDir=/d/dev/repos/tycho/demo/itp04-rcp
tmpDir=$baseDir/fun-with-abi/tmp
mkdir -p $tmpDir

fooJava=$baseDir/example-bundle/src/example/bundle/foo/Foo.java
fooClass=$baseDir/example-bundle/target/classes/example/bundle/foo/Foo.class
barClass=$baseDir/example-bundle-2/target/classes/example/bundle2/Bar.class
fooVoid=$baseDir/fun-with-abi/FooVoid.java
fooInt=$baseDir/fun-with-abi/FooInt.java

function toVoid(){
	cp -v $fooVoid $fooJava
}

function toInt(){
	cp -v $fooInt $fooJava
}

function cleanVerify(){
	pushd .
	cd $baseDir
	mvn clean verify
	ls -la $fooClass $barClass
	javapOutput $fooClass
	javapOutput $barClass
	popd
}

function verify(){
	pushd .
	cd $baseDir
	mvn verify
	ls -la $fooClass $barClass
	javapOutput $fooClass
	javapOutput $barClass
	popd
}

function javapOutput() {
	local filename=$(basename "$1")
	javap -v $1 > $tmpDir/$filename-javap.log
	echo "Written output of javap -v $filename to $tmpDir/$filename-javap.log"
}