import java.util.Scanner;

class MatrixMultiplication {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Matrix 1\n");
        System.out.print("Enter Number of Rows: ");
        int row1 = sc.nextInt();
        System.out.print("Enter Number of Columns: ");
        int col1 = sc.nextInt();
        int[][] matrix1 = new int[row1][col1];

        System.out.print("Matrix 2\n");
        System.out.print("Enter Number of Rows: ");
        int row2 = sc.nextInt();
        System.out.print("Enter Number of Columns: ");
        int col2 = sc.nextInt();
        int[][] matrix2 = new int[row2][col2];

        System.out.print("Matrix 1\n");
        for (int i = 0; i < row1; i++) {
            for (int j = 0; j < col1; j++) {
                System.out.print("Enter Value at Row-" + i + " Column-" + j + ": ");
                matrix1[i][j] = sc.nextInt();
            }
        }

        System.out.print("Matrix 2\n");
        for (int i = 0; i < row2; i++) {
            for (int j = 0; j < col2; j++) {
                System.out.print("Enter Value at Row-" + i + " Column-" + j + ": ");
                matrix2[i][j] = sc.nextInt();
            }
        }

        int[][] resultant_matrix = new int[row1][col2];
        for (int i = 0; i < row1; i++) {
            for (int j = 0; j < col2; j++) {
                resultant_matrix[i][j] = 0;
                for (int k = 0; k < col1; k++) {
                    resultant_matrix[i][j] += matrix1[i][k] * matrix2[k][j];
                }
            }
        }

        System.out.println("The Resultant Matrix: \n");
        for (int i = 0; i < row1; i++) {
            for (int j = 0; j < col2; j++) {
                System.out.print(resultant_matrix[i][j] + " ");
            }
            System.out.println("\n");
        }
    }
}
