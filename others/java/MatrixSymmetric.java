import java.util.Scanner;

class MatrixSymmetric {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Size: ");
        int size = sc.nextInt();
        int[][] matrix = new int[size][size];

        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                System.out.print("Enter Value at Row-" + i + " Column-" + j + ": ");
                matrix[i][j] = sc.nextInt();
            }
        }

        int sym = 0;
        outerloop:
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                if (matrix[i][j] != matrix[j][i]) {
                    System.out.print("Not Symmetric");
                    sym = 1;
                    break outerloop;
                }
            }
        }
        if (sym == 0) 
            System.out.print("Symmetric");
    }
}
