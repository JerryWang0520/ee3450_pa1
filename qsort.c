#include <stdio.h>
#include <stdlib.h>

void swap(int* a, int* b) {
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

int partition(int* arr, int low, int high) {
    int pivot = arr[high];
    int i = low;
    for (int j = low; j < high; j += 1) {
        if (arr[j] < pivot) {
            swap(&arr[i], &arr[j]);
            i += 1;
        }
    }
    swap(&arr[i], &arr[high]);
    return i;
}

void quickSort(int* arr, int low, int high) {
    if (low < high) {
        int pivot = partition(arr, low, high);
        quickSort(arr, low, pivot - 1);
        quickSort(arr, pivot + 1, high);
    }
}

int main(void) {

    int n = 20;
    int arr[20] = {15, 20, 6, 35, 70, 7, 14, 36, 1, 21, 13, 3, 24, 5, 22, 2, 4, 10, 8, 12};

    quickSort(arr, 0, n - 1);

    for (int i = 0; i < 20; i += 1) {
        printf("%d ", arr[i]);
    }

    printf("\n");

    return 0;
}