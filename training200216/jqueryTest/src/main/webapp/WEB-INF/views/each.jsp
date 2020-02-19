<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 20.02.19 hw1풀이->each -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이쿼리 2일차 퀴즈(숙제) - 선생님의 풀이</title>
<script src="<c:url value='/resources/jquery-3.4.1.js' /> "> </script>
<script>
/*제이쿼리로 가져온 문서객체는 자바스크립트의 문서객체를 배열 형태로 가져온 것.
$(":checked") 라는 제이쿼리 명령문을 실행하면
jQuery.fn.init(2) [input, input, prevObject: jQuery.fn.init(1)]0: input1: inputaccept: ""alt: ""autocomplete: ""defaultChecked: falsechecked: truedirName: ""disabled: falseform: nullfiles: nullformAction: "http://localhost:8888/test/each"formEnctype: ""formMethod: ""formNoValidate: falseformTarget: ""height: 0indeterminate: falselist: nullmax: ""maxLength: -1min: ""minLength: -1multiple: falsename: "hobby"pattern: ""placeholder: ""readOnly: falserequired: falsesize: 20src: ""step: ""type: "checkbox"defaultValue: "독서"value: "독서"valueAsDate: nullvalueAsNumber: NaNwidth: 0willValidate: truevalidity: ValidityState {valueMissing: false, typeMismatch: false, patternMismatch: false, tooLong: false, tooShort: false, …}validationMessage: ""labels: NodeList []selectionStart: nullselectionEnd: nullselectionDirection: nullalign: ""useMap: ""webkitdirectory: falseincremental: falsewebkitEntries: []title: ""lang: ""translate: truedir: ""hidden: falseaccessKey: ""draggable: falsespellcheck: trueautocapitalize: ""contentEditable: "inherit"isContentEditable: falseinputMode: ""offsetParent: bodyoffsetTop: 37offsetLeft: 127offsetWidth: 13offsetHeight: 13style: CSSStyleDeclaration {alignContent: "", alignItems: "", alignSelf: "", alignmentBaseline: "", all: "", …}innerText: ""outerText: ""oncopy: nulloncut: nullonpaste: nullonabort: nullonblur: nulloncancel: nulloncanplay: nulloncanplaythrough: nullonchange: nullonclick: nullonclose: nulloncontextmenu: nulloncuechange: nullondblclick: nullondrag: nullondragend: nullondragenter: nullondragleave: nullondragover: nullondragstart: nullondrop: nullondurationchange: nullonemptied: nullonended: nullonerror: nullonfocus: nulloninput: nulloninvalid: nullonkeydown: nullonkeypress: nullonkeyup: nullonload: nullonloadeddata: nullonloadedmetadata: nullonloadstart: nullonmousedown: nullonmouseenter: nullonmouseleave: nullonmousemove: nullonmouseout: nullonmouseover: nullonmouseup: nullonmousewheel: nullonpause: nullonplay: nullonplaying: nullonprogress: nullonratechange: nullonreset: nullonresize: nullonscroll: nullonseeked: nullonseeking: nullonselect: nullonstalled: nullonsubmit: nullonsuspend: nullontimeupdate: nullontoggle: nullonvolumechange: nullonwaiting: nullonwheel: nullonauxclick: nullongotpointercapture: nullonlostpointercapture: nullonpointerdown: nullonpointermove: nullonpointerup: nullonpointercancel: nullonpointerover: nullonpointerout: nullonpointerenter: nullonpointerleave: nullonselectstart: nullonselectionchange: nullonanimationend: nullonanimationiteration: nullonanimationstart: nullontransitionend: nulldataset: DOMStringMap {}nonce: ""autofocus: falsetabIndex: 0enterKeyHint: ""onformdata: nullonpointerrawupdate: nullnamespaceURI: "http://www.w3.org/1999/xhtml"prefix: nulllocalName: "input"tagName: "INPUT"id: ""className: ""classList: DOMTokenList [value: ""]slot: ""part: DOMTokenList [value: ""]attributes: NamedNodeMap {0: type, 1: name, 2: value, type: type, name: name, value: value, length: 3}shadowRoot: nullassignedSlot: nullinnerHTML: ""outerHTML: "<input type="checkbox" name="hobby" value="독서">"scrollTop: 0scrollLeft: 0scrollWidth: 12scrollHeight: 12clientTop: 0clientLeft: 0clientWidth: 13clientHeight: 13attributeStyleMap: StylePropertyMap {size: 0}onbeforecopy: nullonbeforecut: nullonbeforepaste: nullonsearch: nullelementTiming: ""previousElementSibling: inputnextElementSibling: brchildren: HTMLCollection []firstElementChild: nulllastElementChild: nullchildElementCount: 0onfullscreenchange: nullonfullscreenerror: nullonwebkitfullscreenchange: nullonwebkitfullscreenerror: nullnodeType: 1nodeName: "INPUT"baseURI: "http://localhost:8888/test/each"isConnected: trueownerDocument: documentparentNode: bodyparentElement: bodychildNodes: NodeList []firstChild: nulllastChild: nullpreviousSibling: textnextSibling: textnodeValue: nulltextContent: ""__proto__: HTMLInputElementlength: 2prevObject: jQuery.fn.init(1)0: documentlength: 1__proto__: Object(0)__proto__: Object(0)jquery: "3.4.1"constructor: ƒ ( selector, context )length: 0toArray: ƒ ()get: ƒ ( num )pushStack: ƒ ( elems )each: ƒ ( callback )map: ƒ ( callback )slice: ƒ ()first: ƒ ()last: ƒ ()eq: ƒ ( i )end: ƒ ()push: ƒ push()sort: ƒ sort()splice: ƒ splice()extend: ƒ ()find: ƒ ( selector )filter: ƒ ( selector )not: ƒ ( selector )is: ƒ ( selector )init: ƒ ( selector, context, root )has: ƒ ( target )closest: ƒ ( selectors, context )index: ƒ ( elem )add: ƒ ( selector, context )addBack: ƒ ( selector )parent: ƒ ( until, selector )parents: ƒ ( until, selector )parentsUntil: ƒ ( until, selector )next: ƒ ( until, selector )prev: ƒ ( until, selector )nextAll: ƒ ( until, selector )prevAll: ƒ ( until, selector )nextUntil: ƒ ( until, selector )prevUntil: ƒ ( until, selector )siblings: ƒ ( until, selector )children: ƒ ( until, selector )contents: ƒ ( until, selector )ready: ƒ ( fn )data: ƒ ( key, value )removeData: ƒ ( key )queue: ƒ ( type, data )dequeue: ƒ ( type )clearQueue: ƒ ( type )promise: ƒ ( type, obj )show: ƒ ( speed, easing, callback )hide: ƒ ( speed, easing, callback )toggle: ƒ ( speed, easing, callback )on: ƒ ( types, selector, data, fn )one: ƒ ( types, selector, data, fn )off: ƒ ( types, selector, fn )detach: ƒ ( selector )remove: ƒ ( selector )text: ƒ ( value )append: ƒ ()prepend: ƒ ()before: ƒ ()after: ƒ ()empty: ƒ ()clone: ƒ ( dataAndEvents, deepDataAndEvents )html: ƒ ( value )replaceWith: ƒ ()appendTo: ƒ ( selector )prependTo: ƒ ( selector )insertBefore: ƒ ( selector )insertAfter: ƒ ( selector )replaceAll: ƒ ( selector )css: ƒ ( name, value )fadeTo: ƒ ( speed, to, easing, callback )animate: ƒ ( prop, speed, easing, callback )stop: ƒ ( type, clearQueue, gotoEnd )finish: ƒ ( type )slideDown: ƒ ( speed, easing, callback )slideUp: ƒ ( speed, easing, callback )slideToggle: ƒ ( speed, easing, callback )fadeIn: ƒ ( speed, easing, callback )fadeOut: ƒ ( speed, easing, callback )fadeToggle: ƒ ( speed, easing, callback )delay: ƒ ( time, type )attr: ƒ ( name, value )removeAttr: ƒ ( name )prop: ƒ ( name, value )removeProp: ƒ ( name )addClass: ƒ ( value )removeClass: ƒ ( value )toggleClass: ƒ ( value, stateVal )hasClass: ƒ ( selector )val: ƒ ( value )trigger: ƒ ( type, data )triggerHandler: ƒ ( type, data )serialize: ƒ ()serializeArray: ƒ ()wrapAll: ƒ ( html )wrapInner: ƒ ( html )wrap: ƒ ( html )unwrap: ƒ ( selector )load: ƒ ( url, params, callback )ajaxStart: ƒ ( fn )ajaxStop: ƒ ( fn )ajaxComplete: ƒ ( fn )ajaxError: ƒ ( fn )ajaxSuccess: ƒ ( fn )ajaxSend: ƒ ( fn )offset: ƒ ( options )position: ƒ ()offsetParent: ƒ ()scrollLeft: ƒ ( val )scrollTop: ƒ ( val )innerHeight: ƒ ( margin, value )height: ƒ ( margin, value )outerHeight: ƒ ( margin, value )innerWidth: ƒ ( margin, value )width: ƒ ( margin, value )outerWidth: ƒ ( margin, value )blur: ƒ ( data, fn )focus: ƒ ( data, fn )focusin: ƒ ( data, fn )focusout: ƒ ( data, fn )resize: ƒ ( data, fn )scroll: ƒ ( data, fn )click: ƒ ( data, fn )dblclick: ƒ ( data, fn )mousedown: ƒ ( data, fn )mouseup: ƒ ( data, fn )mousemove: ƒ ( data, fn )mouseover: ƒ ( data, fn )mouseout: ƒ ( data, fn )mouseenter: ƒ ( data, fn )mouseleave: ƒ ( data, fn )change: ƒ ( data, fn )select: ƒ ( data, fn )submit: ƒ ( data, fn )keydown: ƒ ( data, fn )keypress: ƒ ( data, fn )keyup: ƒ ( data, fn )contextmenu: ƒ ( data, fn )hover: ƒ ( fnOver, fnOut )bind: ƒ ( types, data, fn )unbind: ƒ ( types, fn )delegate: ƒ ( selector, types, data, fn )undelegate: ƒ ( selector, types, fn )Symbol(Symbol.iterator): ƒ values()__proto__: Object
   와 같이 자료를 갖고 온다. 이때 배열 형태로 갖고 온다.라고 표현을 하는 것이다.
*/

$(function() {
	var temp = ['가','나','다','라'];
	//each는 2종류가 있습니다.
	//유형[1] 이벤트를 걸어 작업하는 경우
	$("#btn1").click(function(){
		$.each(temp, function(index,item){
			//temp의 배열값을 1개씩 가져온다. 
			//index-> 0,1,2,3
			//item ->'가','나','다','라'
			alert(item);//2번째 매개변수로 index,item 를 받고 이를 팝업창으로 표현하고자 한다.
		});
	});

	//유형[] 이벤트를 걸어 작업하는 경우
	$("#btn2").click(function(){
			$.each($(":checked"), function(index,item){
			alert(item.value);
			alert($(item).val()); //alert(item.value);와 같은 명령입니다.
			});						
	});


	//제이쿼리의 배열 생성과 동시에 반복 작업 실시(=제이쿼리 배열밖에 못씁니다)
	$("#btn3").click(function(){
		$(":checked").each(function(index,item){//배열 생성과 동시에 각 배열을 each를 통해 생성
		alert(item.value);
		alert($(item).val()); //alert(item.value);와 같은 명령입니다.
		});						
	});
	
});
</script>
</head>
<body>
	<input type="button" id="btn1" value="test"><br>
	<input type="button" id="btn2" value="취미확인"><br>
	<input type="button" id="btn3" value="취미확인2"><br>
	
	<input type="checkbox" name="hobby" value="운동">운동
	<input type="checkbox" name="hobby" value="영화">영화	
	<input type="checkbox" name="hobby" value="독서">독서<br>
		
</body>
</html>