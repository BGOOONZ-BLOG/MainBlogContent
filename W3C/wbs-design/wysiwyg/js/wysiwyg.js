!function(e){"use strict";"function"==typeof define&&define.amd?define([],function(){return e(window,document)}):"undefined"!=typeof exports?module.exports=e(window,document):window.wysiwyg=e(window,document)}(function(e,t){"use strict";var n=function(e,t,n){var r;return function(){if(r){if(!n)return;clearTimeout(r)}var i=this,o=arguments;r=setTimeout(function(){r=null,e.apply(i,o)},t)}},r=function(t,n,r,i){t.addEventListener?t.addEventListener(n,r,i?!0:!1):t.attachEvent?t.attachEvent("on"+n,r):t!=e&&(t["on"+n]=r)},i=function(t,n,r,i){t.removeEventListener?t.removeEventListener(n,r,i?!0:!1):t.detachEvent?t.detachEvent("on"+n,r):t!=e&&(t["on"+n]=null)},o=function(e,n,r,i){if(t.createEvent){var o=t.createEvent("Event");o.initEvent(n,void 0!==r?r:!0,void 0!==i?i:!1),e.dispatchEvent(o)}else if(t.createEventObject){var o=t.createEventObject();e.fireEvent("on"+n,o)}else"function"==typeof e["on"+n]&&e["on"+n]()},a=function(e){return e.preventDefault?e.preventDefault():e.returnValue=!1,e.stopPropagation?e.stopPropagation():e.cancelBubble=!0,!1},l="undefined"!=typeof Node?Node.ELEMENT_NODE:1,u="undefined"!=typeof Node?Node.TEXT_NODE:3,f=function(e,t){for(var n=t;n;){if(n===e)return!0;n=n.parentNode}return!1},c=function(e,t){if(e.firstChild)return e.firstChild;for(;e;){if(e==t)return null;if(e.nextSibling)return e.nextSibling;e=e.parentNode}return null},s=function(n){if(e.getSelection){var r=e.getSelection();if(r.rangeCount>0)return r.getRangeAt(0)}else if(t.selection){var r=t.selection;return r.createRange()}return null},d=function(n,r){if(r)if(e.getSelection){var i=e.getSelection();i.removeAllRanges(),i.addRange(r)}else t.selection&&r.select()},p=function(){if(e.getSelection){var n=e.getSelection();if(!n.rangeCount)return!1;var r=n.getRangeAt(0).cloneRange();if(r.getBoundingClientRect){var i=r.getBoundingClientRect();if(i&&i.left&&i.top&&i.right&&i.bottom)return{left:parseInt(i.left),top:parseInt(i.top),width:parseInt(i.right-i.left),height:parseInt(i.bottom-i.top)};for(var o=r.getClientRects?r.getClientRects():[],a=0;a<o.length;++a){var i=o[a];if(i.left&&i.top&&i.right&&i.bottom)return{left:parseInt(i.left),top:parseInt(i.top),width:parseInt(i.right-i.left),height:parseInt(i.bottom-i.top)}}}}else if(t.selection){var n=t.selection;if("Control"!=n.type){var r=n.createRange();if(r.boundingLeft||r.boundingTop||r.boundingWidth||r.boundingHeight)return{left:r.boundingLeft,top:r.boundingTop,width:r.boundingWidth,height:r.boundingHeight}}}return!1},g=function(n){if(e.getSelection){var r=e.getSelection();return r.isCollapsed?!0:!1}if(t.selection){var r=t.selection;if("Text"==r.type){var i=t.selection.createRange(),o=t.body.createTextRange();return o.moveToElementText(n),o.setEndPoint("EndToStart",i),0==i.htmlText.length}if("Control"==r.type)return!1}return!0},v=function(n){if(e.getSelection){var r=e.getSelection();if(!r.rangeCount)return[];for(var i=[],o=0;o<r.rangeCount;++o)for(var a=r.getRangeAt(o),u=a.startContainer,s=a.endContainer;u;){if(u!=n){var d=!1;if(r.containsNode)d=r.containsNode(u,!0);else{var p=t.createRange();p.selectNodeContents(u);for(var o=0;o<r.rangeCount;++o){var a=r.getRangeAt(o);if(a.compareBoundaryPoints(a.END_TO_START,p)>=0&&a.compareBoundaryPoints(a.START_TO_END,p)<=0){d=!0;break}}}d&&i.push(u)}u=c(u,u==s?s:n)}return 0==i.length&&f(n,r.focusNode)&&r.focusNode!=n&&i.push(r.focusNode),i}if(t.selection){var r=t.selection;if("Text"==r.type){for(var i=[],g=r.createRangeCollection(),o=0;o<g.length;++o)for(var a=g[o],v=a.parentElement(),u=v;u;){var p=a.duplicate();if(p.moveToElementText(u.nodeType!=l?u.parentNode:u),p.compareEndPoints("EndToStart",a)>=0&&p.compareEndPoints("StartToEnd",a)<=0){for(var h=!1,m=0;m<i.length;++m)if(i[m]===u){h=!0;break}h||i.push(u)}u=c(u,v)}return 0==i.length&&f(n,t.activeElement)&&t.activeElement!=n&&i.push(t.activeElement),i}if("Control"==r.type){for(var i=[],a=r.createRange(),o=0;o<a.length;++o)i.push(a(o));return i}}return[]},h=function(){if(e.getSelection){var n=e.getSelection();if(!n.isCollapsed)try{n.collapseToEnd()}catch(r){}}else if(t.selection){var n=t.selection;if("Control"!=n.type){var i=n.createRange();i.collapse(!1),i.select()}}},m=function(n,r,i){if(e.getSelection){var o=e.getSelection();if(o.modify){for(var a=0;r>a;++a)o.modify("extend","backward","character");for(var a=0;i>a;++a)o.modify("extend","forward","character")}else{var l=o.getRangeAt(0);l.setStart(l.startContainer,l.startOffset-r),l.setEnd(l.endContainer,l.endOffset+i),o.removeAllRanges(),o.addRange(l)}}else if(t.selection){var o=t.selection;if("Control"!=o.type){var l=o.createRange();l.collapse(!0),l.moveStart("character",-r),l.moveEnd("character",i),l.select()}}},y=function(n){if(g(n))return null;if(e.getSelection){var r=e.getSelection();if(r.rangeCount){for(var i=t.createElement("div"),o=r.rangeCount,a=0;o>a;++a){var l=r.getRangeAt(a).cloneContents();i.appendChild(l)}return i.innerHTML}}else if(t.selection){var r=t.selection;if("Text"==r.type){var u=r.createRange();return u.htmlText}}return null},T=function(n,r){if(e.getSelection){var i=e.getSelection();if(f(n,i.anchorNode)&&f(n,i.focusNode))return!0;if(!r)return!1;var o=t.createRange();o.selectNodeContents(n),o.collapse(!1),i.removeAllRanges(),i.addRange(o)}else if(t.selection){var i=t.selection;if("Control"==i.type){var o=i.createRange();if(0!=o.length&&f(n,o(0)))return!0}else{var a=t.body.createTextRange();a.moveToElementText(n);var o=i.createRange();if(a.inRange(o))return!0}if(!r)return!1;var o=t.body.createTextRange();o.moveToElementText(n),o.setEndPoint("StartToEnd",o),o.select()}return!0},b=function(n,r){if(e.getSelection){var i=e.getSelection();if(i.getRangeAt&&i.rangeCount){var o=i.getRangeAt(0),a=t.createElement("div");a.innerHTML=r;for(var l,u,c=t.createDocumentFragment();l=a.firstChild;)u=c.appendChild(l);f(n,o.commonAncestorContainer)?(o.deleteContents(),o.insertNode(c)):n.appendChild(c),u&&(o=o.cloneRange(),o.setStartAfter(u),o.collapse(!0),i.removeAllRanges(),i.addRange(o))}}else if(t.selection){var i=t.selection;if("Control"!=i.type){var s=i.createRange();s.collapse(!0);var o=i.createRange();if(f(n,o.parentElement()))o.pasteHTML(r);else{var d=t.body.createTextRange();d.moveToElementText(n),d.collapse(!1),d.select(),d.pasteHTML(r)}o=i.createRange(),o.setEndPoint("StartToEnd",s),o.select()}}},E=function(E){E=E||{};var C=E.element||null;"string"==typeof C&&(C=t.getElementById(C));var R=E.onKeyDown||null,S=E.onKeyPress||null,L=E.onKeyUp||null,N=E.onSelection||null,A=E.onPlaceholder||null,x=E.onOpenpopup||null,w=E.onClosepopup||null,M=E.hijackContextmenu||!1,I=E.readOnly||!1,H="TEXTAREA"==C.nodeName||"INPUT"==C.nodeName;if(H){var k="contentEditable"in t.body;if(k){var O=navigator.userAgent.match(/(?:iPad|iPhone|Android).* AppleWebKit\/([^ ]+)/);O&&420<=parseInt(O[1])&&parseInt(O[1])<534&&(k=!1)}if(!k){var P=C,D=function(e){return e.replace(/<br[ \/]*>\n?/gi,"<br>\n")};P.value=D(P.value);var B=function(){return this},j=function(){return null};return{legacy:!0,getElement:function(){return P},getHTML:function(){return P.value},setHTML:function(e){return P.value=D(e),this},getSelectedHTML:j,sync:B,readOnly:function(e){return void 0===e?P.hasAttribute?P.hasAttribute("readonly"):!!P.getAttribute("readonly"):(e?P.setAttribute("readonly","readonly"):P.removeAttribute("readonly"),this)},collapseSelection:B,expandSelection:B,openPopup:j,closePopup:B,removeFormat:B,bold:B,italic:B,underline:B,strikethrough:B,forecolor:B,highlight:B,fontName:B,fontSize:B,subscript:B,superscript:B,align:B,format:B,indent:B,insertLink:B,insertImage:B,insertHTML:B,insertList:B}}}var P=null,K=null;if(H){P=C,P.style.display="none",K=t.createElement("DIV"),K.innerHTML=P.value;var X=P.parentNode,W=P.nextSibling;W?X.insertBefore(K,W):X.appendChild(K)}else K=C;I||K.setAttribute("contentEditable","true");var Y=t.all&&!t.addEventListener?t:e,_=null;if(H){var F=K.innerHTML;_=function(){var e=K.innerHTML;e!=F&&(P.value=e,F=e,o(P,"change",!1))}}var V;if(A){var q=!1;V=function(){for(var e=!0,t=K;t;)if(t=c(t,K)){if(t.nodeType==l){if("IMG"==t.nodeName){e=!1;break}}else if(t.nodeType==u){var n=t.nodeValue;if(n&&-1!=n.search(/[^\s]/)){e=!1;break}}}else;q!=e&&(A(e),q=e)},V()}var z=null,U=null,G=null;N&&(U=function(t,n,r){var i=g(K),o=v(K),a=null===t||null===n?null:{left:t,top:n,width:0,height:0},u=p();if(u&&(a=u),a){if(K.getBoundingClientRect){var f=K.getBoundingClientRect();a.left-=parseInt(f.left),a.top-=parseInt(f.top)}else{var c=K,s=0,d=0,h=!1;do s+=c.offsetLeft?parseInt(c.offsetLeft):0,d+=c.offsetTop?parseInt(c.offsetTop):0,"fixed"==c.style.position&&(h=!0);while(c=c.offsetParent);a.left-=s-(h?0:e.pageXOffset),a.top-=d-(h?0:e.pageYOffset)}a.left<0&&(a.left=0),a.top<0&&(a.top=0),a.width>K.offsetWidth&&(a.width=K.offsetWidth),a.height>K.offsetHeight&&(a.height=K.offsetHeight)}else if(o.length)for(var m=0;m<o.length;++m){var c=o[m];if(c.nodeType==l){a={left:c.offsetLeft,top:c.offsetTop,width:c.offsetWidth,height:c.offsetHeight};break}}N(i,a,o,r)},G=n(U,1));var J=null,Q=function(t){if(!t)var t=e.event;var n=t.target||t.srcElement;n.nodeType==u&&(n=n.parentNode),f(J,n)||$()},Z=function(){if(J)return J;r(Y,"mousedown",Q,!0),J=t.createElement("DIV");var e=K.parentNode,n=K.nextSibling;return n?e.insertBefore(J,n):e.appendChild(J),x&&x(),J},$=function(){J&&(J.parentNode.removeChild(J),J=null,i(Y,"mousedown",Q,!0),w&&w())};r(K,"focus",function(){P&&o(P,"focus",!1)}),r(K,"blur",function(){_&&_(),P&&o(P,"blur",!1)});var ee=null;if(V||_){var te=_?n(_,250,!0):null,ne=function(e){V&&V(),te&&te()};ee=n(ne,1),r(K,"input",ee),r(K,"DOMNodeInserted",ee),r(K,"DOMNodeRemoved",ee),r(K,"DOMSubtreeModified",ee),r(K,"DOMCharacterDataModified",ee),r(K,"propertychange",ee),r(K,"textInput",ee),r(K,"paste",ee),r(K,"cut",ee),r(K,"drop",ee)}var re=function(t,n){if(!t)var t=e.event;var r=t.which||t.keyCode,i=String.fromCharCode(r||t.charCode),o=t.shiftKey||!1,l=t.altKey||!1,u=t.ctrlKey||!1,f=t.metaKey||!1;if(1==n){if(R&&R(r,i,o,l,u,f)===!1)return a(t)}else if(2==n){if(S&&S(r,i,o,l,u,f)===!1)return a(t)}else if(3==n&&L&&L(r,i,o,l,u,f)===!1)return a(t);if((2==n||3==n)&&(z=null,G&&G(null,null,!1)),2==n&&ee)switch(r){case 33:case 34:case 35:case 36:case 37:case 38:case 39:case 40:break;default:ee()}};r(K,"keydown",function(e){return re(e,1)}),r(K,"keypress",function(e){return re(e,2)}),r(K,"keyup",function(e){return re(e,3)});var ie=function(t,n){if(!t)var t=e.event;var r=null,o=null;t.clientX&&t.clientY?(r=t.clientX,o=t.clientY):t.pageX&&t.pageY&&(r=t.pageX-e.pageXOffset,o=t.pageY-e.pageYOffset),t.which&&3==t.which?n=!0:t.button&&2==t.button&&(n=!0),i(Y,"mouseup",ie),z=null,(M||!n)&&G&&G(r,o,n)};r(K,"mousedown",function(e){i(Y,"mouseup",ie),r(Y,"mouseup",ie)}),r(K,"mouseup",function(e){ie(e),ee&&ee()}),r(K,"dblclick",function(e){ie(e)}),r(K,"selectionchange",function(e){ie(e)}),M&&r(K,"contextmenu",function(e){return ie(e,!0),a(e)});var oe=function(n,r,i){if(d(K,z),!T(K,i))return!1;if(e.getSelection)try{return t.queryCommandSupported&&!t.queryCommandSupported(n)?!1:t.execCommand(n,!1,r)}catch(o){}else if(t.selection){var a=t.selection;if("None"!=a.type){var l=a.createRange();try{return l.queryCommandEnabled(n)?l.execCommand(n,!1,r):!1}catch(o){}}}return!1},ae=null,le=function(){(t.all||e.MSInputMethodContext)&&(ae=t.createElement("DIV"),K.appendChild(ae))},ue=function(e){ae&&(K.removeChild(ae),ae=null),ee&&ee(),e?(h(),z=null):z&&(z=s(K))};return{getElement:function(){return K},getHTML:function(){return K.innerHTML},setHTML:function(e){return K.innerHTML=e,ue(!0),this},getSelectedHTML:function(){return d(K,z),T(K)?y(K):null},sync:function(){return _&&_(),this},readOnly:function(e){return void 0===e?K.hasAttribute?!K.hasAttribute("contentEditable"):!K.getAttribute("contentEditable"):(e?K.removeAttribute("contentEditable"):K.setAttribute("contentEditable","true"),this)},collapseSelection:function(){return h(),z=null,this},expandSelection:function(e,t){return d(K,z),T(K)?(m(K,e,t),z=s(K),this):this},openPopup:function(){return z||(z=s(K)),Z()},closePopup:function(){return $(),this},removeFormat:function(){return oe("removeFormat"),oe("unlink"),ue(),this},bold:function(){return oe("bold"),ue(),this},italic:function(){return oe("italic"),ue(),this},underline:function(){return oe("underline"),ue(),this},strikethrough:function(){return oe("strikeThrough"),ue(),this},forecolor:function(e){return oe("foreColor",e),ue(),this},highlight:function(e){return oe("hiliteColor",e)||oe("backColor",e),ue(),this},fontName:function(e){return oe("fontName",e),ue(),this},fontSize:function(e){return oe("fontSize",e),ue(),this},subscript:function(){return oe("subscript"),ue(),this},superscript:function(){return oe("superscript"),ue(),this},align:function(e){return le(),"left"==e?oe("justifyLeft"):"center"==e?oe("justifyCenter"):"right"==e?oe("justifyRight"):"justify"==e&&oe("justifyFull"),ue(),this},format:function(e){return le(),oe("formatBlock",e),ue(),this},indent:function(e){return le(),oe(e?"outdent":"indent"),ue(),this},insertLink:function(e){return oe("createLink",e),ue(!0),this},insertImage:function(e){return oe("insertImage",e,!0),ue(!0),this},insertHTML:function(e){return oe("insertHTML",e,!0)||(d(K,z),T(K,!0),b(K,e)),ue(!0),this},insertList:function(e){return le(),oe(e?"insertOrderedList":"insertUnorderedList"),ue(),this}}};return E});