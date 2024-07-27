class MatrixAddition {
    public static void main(String[] args) {
        int rows = 4;
        int columns = 4;

        int[][] matrix1 = new int[rows][columns];
        int[][] matrix2 = new int[rows][columns];
        int[][] resultantmatrix = new int[rows][columns];

        int value = 1;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                matrix1[i][j] = value;
                value++;
            }
        }

        value = 10;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                matrix2[i][j] = value;
                value = value + 10;
            }
        }

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                resultantmatrix[i][j] = matrix1[i][j] + matrix2[i][j];
            }
        }

        System.out.println("The result of matrix addition is: ");
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                System.out.print(resultantmatrix[i][j] + " ");
            }
            System.out.println();
        }
    }
}
