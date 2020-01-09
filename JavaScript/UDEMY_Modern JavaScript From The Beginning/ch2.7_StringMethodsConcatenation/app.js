const firstName = 'William';
const lastName = 'Johnson';
const age = 36;
const str = 'Hello there, my name is Brad';
const tags = 'web design, web developer,programming';

let val;


//Concatenation
val = firstName+' '+lastName;
console.log(val);

//Append
val = 'Bred';
val +=' Traversy';
console.log(val);
val = 'Hello, My name is '+ firstName +' and I am'+age;
console.log(val);

//Escaping
val = "That's awesome, I can't wait' ";
console.log(val);

//length
val = firstName.length;
console.log(val);

//concat
val = firstName.concat(' ',lastName);

//change case
val = firstName.toUpperCase();
console.log(val);
val = firstName.toLowerCase();
console.log(val);

val = firstName[2];

//indexOf()
val = firstName.indexOf('a');
console.log(val);//indexOf에 해당되는 글자가 없다면 -1(없다는 의미)가 리턴된다.

//charAt()
val = firstName.charAt('2');
console.log(val);

//Get last char
val = firstName.charAt(firstName.length -1);
console.log(val);


//slice()
val = firstName.slice(0,4);
console.log(val);


//split()
val = str.split(' ');
console.log(val);
val = str.split(',');
console.log(val);

//const str = 'Hello there, my name is Brad';

//repalce()
val = str.replace('Brad','Jack');

//includes()
val = str.includes();