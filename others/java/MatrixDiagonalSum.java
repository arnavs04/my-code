import java.util.Scanner;

class MatrixDiagonalSum {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Size: ");
        int size = sc.nextInt(); 

        int[][] matrix = new int[size][size];

        System.out.print("Matrix\n");
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                System.out.print("Enter Value at Row-" + i + " Column-" + j + ": ");
                matrix[i][j] = sc.nextInt();
            }
        }

        int diagonal_sum_1 = 0;
        int diagonal_sum_2 = 0;
        for (int i = 0; i < size; i++) {
            diagonal_sum_1 += matrix[i][i];
            diagonal_sum_2 += matrix[i][size - i - 1];
        }

        System.out.println("The Sum of Elements along Diagonal 1: " + diagonal_sum_1 + "\n");
        System.out.println("The Sum of Elements along Diagonal 2: " + diagonal_sum_2 + "\n");
    }
}
