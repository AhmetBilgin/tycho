package example.bundle2;

import example.bundle.foo.Foo;

public class Bar {

    public void test() {
        System.err.println("Hello from Bar test");
        Foo.sayHello();
    }
}