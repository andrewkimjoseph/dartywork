import 'dart:io';

void main(List<String> args) {
  calculate();
}

void calculate() {
  // THE MAIN-MAIN FUNCTION
  print(
      "\nWelcome to Andrew Kim's CLI Calculator\n"); // Message for better UX on CLI
  sleep(const Duration(seconds: 2)); // delay to smoothen the program
  var calculating = true; // if 'false', the calculator will stop running
  while (calculating) {
    // entire CLI app runs here
    displayOperations(); // function to call the different operations
    int theChoice = validateChoice(); // user picks the specific operation
    List theOperands = getNums(); // programs gets operands (numbers) to be used
    operate(
        theChoice, theOperands); // takes choice, operands, perform operation
    bool toContinue = operateAgain();
    if (toContinue) {
      calculating = true;
      print("\x1B[2J\x1B[0;0H");
    } else {
      calculating = false;
    }
  }
}

// ----------------------- OPERATIONS ------------------------------- //
void add(double firstNum, double secondNum) {
  // adds firstNum to secondNum
  print("${firstNum} + ${secondNum} = ${firstNum + secondNum}");
}

void subtract(double firstNum, double secondNum) {
  // subtracts secondNum from firstNum
  print("${firstNum} - ${secondNum} = ${firstNum - secondNum}");
}

void multiply(double firstNum, double secondNum) {
  // multiplies firstNum by secondNum
  print("${firstNum} * ${secondNum} = ${firstNum * secondNum}");
}

void max(double firstNum, double secondNum) {
  // multiplies firstNum by secondNum
  if (firstNum == secondNum) {
    print("${firstNum} & ${secondNum} = EQUAL NUMBERS");
  } else if (firstNum > secondNum) {
    print("${firstNum} & ${secondNum}, MAX NUMBER: ${firstNum}");
  } else if (secondNum > firstNum) {
    print("${firstNum} & ${secondNum}, MAX NUMBER: ${secondNum}");
  }
}

void min(double firstNum, double secondNum) {
  // multiplies firstNum by secondNum
  if (firstNum == secondNum) {
    print("${firstNum} & ${secondNum}, EQUAL NUMBERS");
  } else if (firstNum < secondNum) {
    print("${firstNum} & ${secondNum}, MIN NUMBER: ${firstNum}");
  } else if (secondNum < firstNum) {
    print("${firstNum} & ${secondNum}, MIN NUMBER: ${secondNum}");
  }
}
// ------------------------------------------------------------------ //

void divide(double firstNum, double secondNum) {
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

void displayOperations() {
  // displays all operations
  // if operation is added, operation function must be created too
  print("Available Operations:\n");
  print("1. Addition (x + y)\n");
  print("2. Subtraction (x - y)\n");
  print("3. Multiplication (x * y)\n");
  print("4. Division (x / y)\n");
  print("5. Maximum Number (x > y)\n");
  print("6. Minimum Number (x < y)\n");
}

int validateChoice() {
  // prompt user to enter a choice for the operation they want
  List<String> choices = ["1", "2", "3", "4", "5", "6"];
  String theChoice = "0";
  var correctChoice = false;
  while (correctChoice == false) {
    print("\nChoose Your Operation [Enter Number]:");
    String? yourChoice = stdin.readLineSync();
    if (choices.contains(yourChoice)) {
      theChoice = yourChoice as String;
      break;
    } else {
      print("\nEnter a Valid Choice ${choices}:");
      continue;
    }
  }
  return int.parse(theChoice);
}

List getNums() {
  // prompts user to enter the two operands required for each operation
  var correctNums = false;
  String theFirstNum = "";
  String theSecondNum = "";
  while (correctNums == false) {
    print("\nEnter First Number (x): ");
    String? firstNum = stdin.readLineSync();
    print("\nEnter Second Number (y): ");
    String? secondNum = stdin.readLineSync();
    if (double.tryParse(firstNum!) == null ||
        double.tryParse(secondNum!) == null) {
      print("\nOne or More Number(s) is Invalid,\nKindly Re-Enter...");
      sleep(const Duration(seconds: 1));
      correctNums = false;
    } else {
      theFirstNum = firstNum;
      theSecondNum = secondNum;
      correctNums = true;
    }
  }
  return [double.parse(theFirstNum), double.parse(theSecondNum)];
}

void operate(int yourChoice, List operands) {
  switch (yourChoice) {
    // depending on user choice, program triggers operation functions
    // program users operands as arguments for operation fucntions
    case 1:
      add(operands[0], operands[1]);
      break;
    case 2:
      subtract(operands[0], operands[1]);
      break;
    case 3:
      multiply(operands[0], operands[1]);
      break;
    case 4:
      divide(operands[0], operands[1]);
      break;
    case 5:
      max(operands[0], operands[1]);
      break;
    case 6:
      min(operands[0], operands[1]);
      break;
  }
}

bool operateAgain() {
  // if true, operation repeats
  // program ends if false
  bool operateAgainValue = false;
  List<String> toContinue = ["Y", 'y', "N", "n"];
  sleep(const Duration(seconds: 1)); // delay

  while (true) {
    print("\nDo You Wish to Do Another Operation [Y or N]? ");
    String yesOrNo = stdin.readLineSync()!;
    if (toContinue.contains(yesOrNo)) {
      if (yesOrNo == 'Y' || yesOrNo == 'y') {
        operateAgainValue = true;
        break;
      } else if (yesOrNo == 'N' || yesOrNo == 'n') {
        operateAgainValue = false;
        break;
      }
    } else {
      print("\nWrong Choice, Pick ${toContinue}:");
      continue;
    }
  }
  return operateAgainValue;
}
