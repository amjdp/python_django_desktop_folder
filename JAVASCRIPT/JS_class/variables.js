a = "10";
document.write(a, "<br><br>");
document.write(typeof a, "<br><br>");

b = 20;
document.write(b, "<br><br>");
document.write(typeof b, "<br><br>");

document.write(a + b + "<br><br>");

c = 40;
document.write(b + c + "<br><br>");

a = "Hai..";
document.write(a, "<br><br>");

a = 5;
document.write(a, "<br><br>");
document.write(typeof a, "<br><br>");

studentId = 10;
admissionNo = 100;
username = "Cybersquare";
marks = [90, 80, 85, 100];
student = { name: "Joseph", age: 20 };

document.write(typeof studentId, "<br><br>");
document.write(typeof admissionNo, "<br><br>");
document.write(typeof username, "<br><br>");
document.write(typeof marks, "<br><br>");
document.write(typeof student, "<br><br>");

outside = "I am global";
var outside_var = "I am also global";
function test_scope(fn_param) {
  //Variable declaration
  inside = "Inside function but global";
  var inside_var = "local to function";
  //Print values inside the function
  console.log("*** Values inside the function ***");
  console.log(outside);
  console.log(outside_var);
  console.log(inside);
  console.log(inside_var);
  console.log(fn_param);
}

test_scope("I am a parameter");
//Print values outside the function
console.log("*** Values outside the function ***");
console.log(outside);
console.log(outside_var);
console.log(inside);
// console.log(inside_var);
// console.log(fn_param);

//MESSAGE BOXES

//Alert dialog box - alert('message')
// alert('Welcome to cybersquare')


//Prompt dialog box - prompt ('message','input Default')
// x = prompt("Enter your Name")
// // c = prompt("Enter your Name","Athira")
// // prompt ("This is a prompt box", "Hello world");
// console.log(x)
// document.write('Enter your Name is  '+x )

//Confirm Dialog Box - confirm('message')
// confirm('Are you sure to delete it')
