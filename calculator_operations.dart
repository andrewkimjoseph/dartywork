class CalculatorOperations {
  static void add(double firstNum, double secondNum) {
    // adds firstNum to secondNum
    print("${firstNum} + ${secondNum} = ${firstNum + secondNum}");
  }

  static void subtract(double firstNum, double secondNum) {
    // subtracts secondNum from firstNum
    print("${firstNum} - ${secondNum} = ${firstNum - secondNum}");
  }

  static void multiply(double firstNum, double secondNum) {
    // multiplies firstNum by secondNum
    print("${firstNum} * ${secondNum} = ${firstNum * secondNum}");
  }

  static void max(double firstNum, double secondNum) {
    // multiplies firstNum by secondNum
    if (firstNum == secondNum) {
      print("${firstNum} & ${secondNum} = EQUAL NUMBERS");
    } else if (firstNum > secondNum) {
      print("${firstNum} & ${secondNum}, MAX NUMBER: ${firstNum}");
    } else if (secondNum > firstNum) {
      print("${firstNum} & ${secondNum}, MAX NUMBER: ${secondNum}");
    }
  }

  static void min(double firstNum, double secondNum) {
    // multiplies firstNum by secondNum
    if (firstNum == secondNum) {
      print("${firstNum} & ${secondNum}, EQUAL NUMBERS");
    } else if (firstNum < secondNum) {
      print("${firstNum} & ${secondNum}, MIN NUMBER: ${firstNum}");
    } else if (secondNum < firstNum) {
      print("${firstNum} & ${secondNum}, MIN NUMBER: ${secondNum}");
    }
  }

  static void divide(double firstNum, double secondNum) {
    // divides firstNum by secondNum
    // to prevent division by zero
    // we change it to 1
    if (secondNum == 0) {
      secondNum += 1;
      print("[X DIVISION BY ZERO THROWS A MATH ERROR.");
      print("PROGRAM PERFORMS X/1, RETURNS X.");
    }
    print("${firstNum} / ${secondNum} = ${firstNum / secondNum}");
  }
}
