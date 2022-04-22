package Converter;

import java.util.Scanner;

public class BinaryToDecimal {
    public static void main(String[] args) {
        System.out.println("Welcome to my binary to decimal converter!");
        System.out.println("Please enter your binary number below");
        // Created Scanner obj
        Scanner sc = new Scanner(System.in);

        String binary = sc.nextLine();

        System.out.println(Integer.parseInt(binary,2));
    }
}
