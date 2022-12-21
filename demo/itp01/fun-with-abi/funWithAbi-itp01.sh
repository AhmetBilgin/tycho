#!/usr/bin/bash

#!/usr/bin/bash
baseDir=/d/dev/repos/tycho/demo/itp01
tmpDir=$baseDir/fun-with-abi/tmp
mkdir -p $tmpDir

fooJava=$baseDir/tycho.demo.itp01/src/tycho/demo/itp/Foo.java
fooClass=$baseDir/tycho.demo.itp01/target/classes/tycho/demo/itp/Foo.class
barClass=$baseDir/tycho.demo.itp01/target/classes/tycho/demo/itp/Bar.class
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