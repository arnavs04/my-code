import java.util.Scanner;

class MatrixRotate {
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

        int[][] matrixtranspose = new int[size][size];
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                matrixtranspose[i][j] = matrix[j][i];
            }
        }

        int[][] resultant_matrix = new int[size][size];
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                resultant_matrix[i][j] = matrixtranspose[size - i - 1][j];
            }
        }

        System.out.println("The Resultant Matrix: ");
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                System.out.print(resultant_matrix[i][j] + " ");
            }
            System.out.println("\n");
        }
    }
}
