package example.bundle2;

import org.junit.jupiter.api.Test;

public class BarIT {

    @Test
    public void test() {
        System.err.println("Hello from BarIT test");
        Bar bar = new Bar();
        bar.test();
    }
}