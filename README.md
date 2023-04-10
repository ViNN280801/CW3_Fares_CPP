# Some sorting methods on matrix

## Description

### Rus

Необходимо составить программу для сортировки массива данных методами: пузырьковая, выбором, вставками, Шелла и быстрая. Вывести на экран неупорядоченный (1 раз) и упорядоченные (для каждого из методов) массивы данных. Составить сравнительную таблицу эффективности методов, в которой необходимо указать число сравнений и перестановок переменных в каждом методе сортировки.
Неупорядоченная матрица из N строк и M столбцов задается и заполняется один раз (с клавиатуры, из файла или случайными числами), далее она используется для каждого из методов сортировки.
Реализовать абстрактный базовый класс ISort, содержащий чистый виртуальный метод sort и необходимые счетчики, от которого наследовать подклассы для реализации сортировок.
Упорядочить каждую четную строку по возрастанию, затем каждый четный столбец по возрастанию.

### Eng

It is necessary to create a program for sorting the data array using the following methods: bubble, selection, inserts, Shell and fast. Display unordered (1 time) and ordered (for each of the methods) data arrays. Make a comparative table of the effectiveness of the methods, in which it is necessary to specify the number of comparisons and permutations of variables in each sorting method.
An unordered matrix of N rows and M columns is set and filled in once (from the keyboard, from a file, or with random numbers), then it is used for each of the sorting methods.
Implement an abstract ISort base class containing a pure virtual sort method and the necessary counters from which to inherit subclasses for implementing sorts.
Arrange each even row in ascending order, then each even column in ascending order.

## Program

As the basis of the array or matrix (2d array) were taken std::vector<> and std::vector<std::vector<>> correspondingly. Classes "InsertionSort", "ShellSort" and "QuickSort" use tricky movement - at first, there each of methods converts matrix to an array, sorting it and then converts array back to the matrix.
For example, following lines demonstrates it:

```cpp
arrInt arr(matrixIntToArray(matrix));
qsort(arr, 0, arr.size() - 1);
matrix = arrIntToMatrix(arr, matrix.size(), matrix.at(0).size());
```

"arrInt" is the type alias defined in "sort.hpp" header file, that corresponds to std::vector<int>:

```cpp
using size_t = std::size_t;
using arrInt = std::vector<int>;
using matrixInt = std::vector<std::vector<int>>;
```

## Compiling

Compiling with CMake:

```console
$ cmake .
-- The CXX compiler identification is GNU 12.2.1
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done (0.7s)
-- Generating done (0.0s)
-- Build files have been written to: $PATH

$ cmake --build .
[ 33%] Building CXX object CMakeFiles/main.dir/sort.cpp.o
[ 66%] Building CXX object CMakeFiles/main.dir/main.cpp.o
[100%] Linking CXX executable main
[100%] Built target main

$
```

Command "cmake --build ." can replaced by "make":

```console
$ cmake .
-- The CXX compiler identification is GNU 12.2.1
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done (0.7s)
-- Generating done (0.0s)
-- Build files have been written to: $PATH
$ make
[ 33%] Building CXX object CMakeFiles/main.dir/sort.cpp.o
[ 66%] Building CXX object CMakeFiles/main.dir/main.cpp.o
[100%] Linking CXX executable main
[100%] Built target main
$
```

Or use commands of compiler GNU GCC:

```console
$ gcc -c sort.cpp -o sort.o
$ gcc -c main.cpp -o main.o
$ gcc -lstdc++ -std=c++17 -Wall -Wpedantic -Wextra sort.o main.o -o main
$ ./main
```

## Examples

There is some examples of sorting methods with 1 matrix and summarize results in the table.

#### Original matrix

```
Original matrix:
48	52	57	60	20	23	100	89	41
87	79	52	7	79	71	92	30	46
70	39	89	59	70	43	53	90	70
93	9	84	34	8	87	42	68	6
65	67	47	5	53	77	8	11	55
79	2	36	76	72	26	17	30	95
11	34	85	81	26	93	64	59	100
50	53	67	7	17	85	5	73	37
81	81	99	87	11	1	22	38	72
99	54	53	94	65	38	30	97	63
```

#### Bubble sort

```
After bubble sort:
1	2	5	5	6	7	7	8	8
9	11	11	11	17	17	20	22	23
26	26	30	30	30	34	34	36	37
38	38	39	41	42	43	46	47	48
50	52	52	53	53	53	53	54	55
57	59	59	60	63	64	65	65	67
67	68	70	70	70	71	72	72	73
76	77	79	79	79	81	81	81	84
85	85	87	87	87	89	89	90	92
93	93	94	95	97	99	99	100	100
Count of compares: 1522
Count of substitutions: 1522
```

#### Selection sort

```
After insertion sort:
1	2	5	5	6	7	7	8	8
9	11	11	11	17	17	20	22	23
26	26	30	30	30	34	34	36	37
38	38	39	41	42	43	46	47	48
50	52	52	53	53	53	53	54	55
57	59	59	60	63	64	65	65	67
67	68	70	70	70	71	72	72	73
76	77	79	79	79	81	81	81	84
85	85	87	87	87	89	89	90	92
93	93	94	95	97	99	99	100	100
Count of compares: 1974
Count of substitutions: 89
```

#### Insertion sort

```
After insertion sort:
1	2	5	5	6	7	7	8	8
9	11	11	11	17	17	20	22	23
26	26	30	30	30	34	34	36	37
38	38	39	41	42	43	46	47	48
50	52	52	53	53	53	53	54	55
57	59	59	60	63	64	65	65	67
67	68	70	70	70	71	72	72	73
76	77	79	79	79	81	81	81	84
85	85	87	87	87	89	89	90	92
93	93	94	95	97	99	99	100	100
Count of compares: 1974
Count of substitutions: 89
```

#### Shell sort

```
After Shell sort:
1	2	5	5	6	7	7	8	8
9	11	11	11	17	17	20	22	23
26	26	30	30	30	34	34	36	37
38	38	39	41	42	43	46	47	48
50	52	52	53	53	53	53	54	55
57	59	59	60	63	64	65	65	67
67	68	70	70	70	71	72	72	73
76	77	79	79	79	81	81	81	84
85	85	87	87	87	89	89	90	92
93	93	94	95	97	99	99	100	100
Count of compares: 307
Count of substitutions: 540
```

#### Quick sort

```
After quick sort:
1	2	5	5	6	7	7	8	8
9	11	11	11	17	17	20	22	23
26	26	30	30	30	34	34	36	37
38	38	39	41	42	43	46	47	48
50	52	52	53	53	53	53	54	55
57	59	59	60	63	64	65	65	67
67	68	70	70	70	71	72	72	73
76	77	79	79	79	81	81	81	84
85	85	87	87	87	89	89	90	92
93	93	94	95	97	99	99	100	100
Count of compares: 253
Count of substitutions: 173
```

Sorting was also done with others matrix which sizes was (2x2, 3x3, 5x4, 5x5, 5x6, 7x7, 8x9, 10x9, 10x10). Below is presented performance table which is show how many compares and substitutions did take any one sorting method or another.

### Summarize results

```
-----------------------------------------------------------------------------------------
| Matrix size | Bubble sort | Selection sort | Insertion sort | Shell sort | Quick sort |
-----------------------------------------------------------------------------------------
|Rows     Cols|Comps    Subs|Comps       Subs|Comps       Subs|Comps   Subs|Comps  Subs |
|2           3|14         14|6              6|8              5|6         12|10         6|
|3           3|29         29|10             9|15             8|9         27|16        10|
|5           4|107       107|35            20|94            19|32        80|47        29|
|5           5|147       147|45            25|144           24|58       100|55        33|
|5           6|209       209|63            30|190           29|62       120|68        43|
|7           7|584       584|123           49|653           48|151      245|118       78|
|8           9|1091     1091|196           72|1356          71|197      432|188      128|
|10          9|1522     1522|258           90|1974          89|307      540|253      173|
|10         10|1748     1748|277          100|2380          99|365      600|279      189|
-----------------------------------------------------------------------------------------
* Cols - count of columns in a matrix
** Comps - count of the compares in each type of sort
*** Subs - count of the substitions in each type of sort
```
