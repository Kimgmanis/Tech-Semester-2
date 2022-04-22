package Converter;

import java.util.Scanner;

public class DecimalToBinary {
    public static void main(String[] args) {
        System.out.println("Welcome to my decimal to binary converter!");
        System.out.println("Please enter your decimal below");
        // Created Scanner obj
        Scanner sc = new Scanner(System.in);

        int decimal = sc.nextInt();

        System.out.println(Integer.toBinaryString(decimal));
    }
}
