package Converter;

public class ASCIIToDecToBi {
    public static void main(String[] args) {
        // loops through all 255 characters and displays decimal and binary values.
        for (int i = 0; i < 255; i++) {
            System.out.println("ASCII = " + (char)i + " Decimal = " + i + " Binary = " + Integer.toBinaryString(i));
        }
    }
}
