package com.mh.Calculator;

public class Calculator {


    public static void main(String args[])  //static method
    {

        int result = 0;

        System.out.println("Hi world");
        Adder adder = new Adder();
        Substractor substractor = new Substractor();
        Multiplier multiplier = new Multiplier();
        Devidor devidor = new Devidor();

        // result = adder.addTwoNumbers(10, 20);
        result = adder.addThreeNumbers(100, 200, 300);
        System.out.println("Result is: " + result);

        result = substractor.substractTwoNumbers(10, 20);
        System.out.println("Result is: " + result);

        result = multiplier.multiplyTwoNumbers(10, 20);
        System.out.println("Result is: " + result);

        result = devidor.devideTwoNumbers(10, 20);
        System.out.println("Result is: " + result);

    }
}
