let val;

//Number(원형,Original)
val =5;
//Output
console.log(val);
console.log(typeof val);
console.log(val.length);

//Number to String
//String으로 형변환 방법 : String(변환할 값 또는 변수명);
val_Conversion=String(val);
//Output
console.log(val_Conversion);
console.log(typeof val_Conversion);
console.log(val_Conversion.length);


//형변환 전 소괄호 내의 작업을 완료후 처리됨을 보여주는 예제.
val2 = String(4+4);//String으로 변환전에 내부의 수학식은 계산된후 String형변환된다.
console.log(val2);
console.log(typeof val2);
console.log(val2.length);


//Date -> String으로 변환
val3 = String(new Date());
console.log(val3);
console.log(typeof val3);
console.log(val3.length);


//Array -> String으로 변환.
val4 = String([1,2,3,4]);
console.log(val4);
console.log(typeof val4);
console.log(val4.length);

//toString()을 활용하여 String형으로 변환.
val5 = (5).toString();
val6 = (true).toString();
console.log(val5);
console.log(typeof val5);
console.log(val6);
console.log(typeof val6);

//Number형으로 형변환.
val7= Number('5');
val8 = Number(true);
val9 = Number(false);
val10 = Number(null);
val11 = Number('hello');
val12 = Number([1,2,3]);
//output
console.log(val7);
console.log(typeof val7);
console.log(val8);
console.log(typeof val8);
console.log(val9);
console.log(typeof val9);
console.log(val10);
console.log(typeof val10);
console.log(val11);
console.log(typeof val11);
console.log(val12);
console.log(typeof val12);

val13 = parseInt('100.30');
//output
