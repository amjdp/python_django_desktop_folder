
function sumPrimes(num) {
    var arr = [];
    var sum = 0;
    for (var i = 2; i <= num; i++) {
      arr.push(i);
    }

    for (var j = 0; j < arr.length; j++) {
      document.write(arr[j]);
      if (arr[j] % 2 === 0 && arr[j] > 2) {
        arr.splice(j, 1);
      } else if (arr[j] % 3 === 0 && arr[j] > 3) {
        arr.splice(j, 1);
        document.write(arr);
      } else if (arr[j] % 5 === 0 && arr[j] > 5) {
        arr.splice(j, 1);
      } else if (arr[j] % 7 === 0 && arr[j] > 7) {
        arr.splice(j, 1);
      }
    }
    sum = arr.reduce();
    return sum;
  }

  sumPrimes(10);