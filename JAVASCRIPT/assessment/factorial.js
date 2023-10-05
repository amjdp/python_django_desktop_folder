var number = argv[0];

// if number is 0
if (number === 0) {
  document.write(`factorial of ${number} is 1.`);
}

// if number is positive
else {
  let fact = 1;
  for (i = 1; i <= number; i++) {
    fact *= i;
  }
  document.write(`factorial of ${number} is ${fact}.`);
}