package tdt.edu.global;

import java.util.ArrayList;
import java.util.List;

import tdt.edu.model.Product;

public class GlobalData {
    //tao bien toan cuc
    public static List<Product> cart;

    static {
        cart = new ArrayList<>();
    }

}
