/*20.01.03 수업내용
<1교시>
1)연산자
2)형 변환

<2교시>


<3교시>
*/
alert(1==0);
console.log(1=="1");
console.log(""==false);			//공란문자열은 flase와 같다.
console.log(undefined ==null);  //자바스크립트에서는 null도 정의안되어있는 형으로 취급.

// === : 자료형까지 동일한지 따지는 '일치 연산자' 라고합니다.
console.log(1==="1");			//자료형이 다르니 거짓취급함.
console.log(""===false);		//자료형이 다르니 거짓취급함.
console.log(undefined ===null); //자료형이 다르니 거짓취급함.
console.log("\n");

console.log(parseInt(3));		//정수를 정수로 형변환하기(#사실의미는 없음)
console.log(parseInt(3.14));	
console.log(parseInt("3"));		//문자열3을 숫자로 변환입니다
console.log(parseInt(true));	 //NaN="자바스크립트로는 나타낼수 없는 숫자입니다" 라는 뜻.
console.log(parseInt(undefined));//NaN을 리턴받음.
console.log(parseInt(null));	 //NaN을 리턴받음.
console.log("\n");


console.log(parseFloat(3));		//왜 3.0이 아닌지는 샘도 모른다고 하심. 걍 자바스크립트가 그런 애라고 하고 넘어가심.
//자바스크립트에서는 나눗셈-몫만 구하는 연산이 없습니다.
// 10/3 = 3.33333... 이런식으로 나온단 애기.
//그래서 parseFloat()를 활용해서 소수점 이하를 날려버립니다.
console.log("\n");


console.log(Number(3));
console.log(Number(3.14));
console.log(Number("3"));
console.log(Number("3.14"));
console.log(Number(true));		//true는 1으로 바뀝니다.
console.log(Number(false));		//false는 0으로 바뀝니다.
console.log(Number(undefined)); //NaN이 출력되어 형변환이 안되었음을 알 수 있다.
console.log(Number(null));		//null도 숫자 0으로 바뀌게 됩니다.
console.log("\n");


//new를 붙이면 Number형이 아니라 오브젝트 객체가 됩니다.

console.log(new Number(3));
console.log(new Number(3.14));
console.log(new Number("3"));
console.log(new Number("3.14"));
console.log(new Number(true));		//true는 1으로 바뀝니다.
console.log(new Number(false));		//false는 0으로 바뀝니다.
console.log(new Number(undefined)); //NaN이 출력되어 형변환이 안되었음을 알 수 있다.
console.log(new Number(null));		//null도 숫자 0으로 바뀌게 됩니다.
