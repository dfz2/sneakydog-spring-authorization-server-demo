package dog.sneaky.demo.service.impl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

public class TestService {

    public static void main(String[] args) {

        List<Demo> demos = new ArrayList<Demo>(){{
            add(new Demo().setA(1).setB(3));
            add(new Demo().setA(1).setB(2));
            add(new Demo().setA(1).setB(1));
        }};


        Demo maxDemo = new Demo();
        for (Demo demo : demos) {
            int tempA = demo.getA();
            int tempB = demo.getB();
            if (tempA == maxDemo.getA()) {
                if (tempB > maxDemo.getB()) {
                    maxDemo = demo;
                }
            } else if (tempA > maxDemo.getA()) {
                maxDemo = demo;
            }
        }

        System.out.println(maxDemo);
    }



    @Data
    @ToString
    @AllArgsConstructor
    @NoArgsConstructor
    @Accessors(chain = true)
    public static class Demo {
        private int a;
        private int b;
    }
}
