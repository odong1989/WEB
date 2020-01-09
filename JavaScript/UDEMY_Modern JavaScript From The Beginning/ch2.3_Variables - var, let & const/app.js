// var, let, const
var name = 'John Doe';
console.log(name);
name2 = 'Steve Smith';
console.log(name2);


//Init var
var greeting;
console.log(greeting);
greeting= 'Hello!_by_greeting';
console.log(greeting);


//letters, numbers, _, $
//can not start with number
var $name = 'John';
console.log($name);

//Multi word vars
var firstName  = 'John'; //Camel Case
var first_name = 'sara'; //Underscore
var FirstName  = 'Tom';  //Pascal case
var firstname;
console.log(firstName);
console.log(first_name);
console.log(FirstName);
console.log(firstname);

//이미 있는 변수는 새로 선언이 불가하다.
//const name = 'John';
//console.log(name);

//Can not reassign
//name = 'Sara';
//Have to assign a value
//const greeting;

const person = {
    name : 'John',
    age  : 30
}
console.log(person);

//numbers는 [1,2,3,4,5,6]이 출력된다.
person.name = 'Sara';
person.age = 32;
console.log(person);


//배열
const numbers = [1,2,3,4,5];
console.log(numbers);

//numbers는 [1,2,3,4,5,6]이 출력된다.
numbers.push(6);
console.log(numbers);




