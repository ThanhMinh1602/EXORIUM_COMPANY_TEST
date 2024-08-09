import 'dart:io';

void miniMaxSum(List<int> arr) {
  int totalSum = 0;
  int minValue = arr[0];
  int maxValue = arr[0];

  for (int i = 0; i < arr.length; i++) {
    totalSum += arr[i];

    if (arr[i] < minValue) {
      minValue = arr[i];
    }

    if (arr[i] > maxValue) {
      maxValue = arr[i];
    }
  }

  int minSum = totalSum - maxValue;

  int maxSum = totalSum - minValue;

  print('$minSum $maxSum');
}

void main() {
  List<int> arr = [1, 3, 5, 7, 9];
  miniMaxSum(arr);
}
