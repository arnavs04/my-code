class MatrixTranspose {
    public static void main(String[] args) {
        int rows = 2;
        int columns = 3;
        int[][] matrix = new int[rows][columns];

        System.out.println("The matrix: ");
        int value = 1;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                matrix[i][j] = value;
                System.out.print(matrix[i][j] + " ");
                value++;
            }
            System.out.println("\n");
        }
        System.out.println("\n");

        int[][] matrixtranspose = new int[columns][rows];

        System.out.println("The transpose of matrix: ");
        for (int i = 0; i < columns; i++) {
            for (int j = 0; j < rows; j++) {
                matrixtranspose[i][j] = matrix[j][i];
                System.out.print(matrixtranspose[i][j] + " ");
            }
            System.out.println("\n");
        }
    }
}
