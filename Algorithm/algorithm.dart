import 'dart:io';

void miniMaxSum(List<int> arr) {
  // Khởi tạo biến cho tổng, giá trị nhỏ nhất và giá trị lớn nhất
  int totalSum = 0;
  int minValue = arr[0];
  int maxValue = arr[0];

  // Tính tổng của mảng và tìm giá trị nhỏ nhất, lớn nhất
  for (int i = 0; i < arr.length; i++) {
    totalSum += arr[i];

    if (arr[i] < minValue) {
      minValue = arr[i];
    }

    if (arr[i] > maxValue) {
      maxValue = arr[i];
    }
  }

  // Tính tổng tối thiểu (loại bỏ giá trị lớn nhất)
  int minSum = totalSum - maxValue;

  // Tính tổng tối đa (loại bỏ giá trị nhỏ nhất)
  int maxSum = totalSum - minValue;

  // In kết quả
  print('$minSum $maxSum');
}

void main() {
  List<int> arr = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  miniMaxSum(arr);
}
