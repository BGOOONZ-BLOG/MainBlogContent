! Utilizaci�n del fichero HTML.trans
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Este archivo puede editarse durante una sesi�n de Amaya. El
! archivo se analiza din�micamente cuando desde el editor se
! solicita la herramienta de transformaci�n. Por tanto, se
! pueden a�adir nuevas transformaciones mientras se est� editando.
!
! Sintaxis del lenguaje de transformaci�n de Amaya
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! Los comentarios empiezan con !
!
! Este archivo puede editarse durante una sesi�n de Amaya. El
! archivo se analiza din�micamente cuando desde el editor se
! solicita la herramienta de transformaci�n. Por tanto, se
! pueden a�adir nuevas transformaciones mientras se est� editando.
!
! Una regla de transformaci�n tiene tres partes: 
!     - un NOMBRE seguido de dos puntos ":"
!     - un PATR�N ORIGEN seguido de punto y coma ";"
!     - y una lista de REGLAS entre llaves "{" "}", cada una de ellas
!       seguida de un punto y coma ";"
!
! a) El NOMBRE aparecer� en el men� de transformaci�n.
!
! b) El PATR�N ORIGEN proporciona una organizaci�n determinada de los
!    elementos a transformar: contiene etiquetas XML/HTML y utiliza una
!    sintaxis similar al SGML para los operadores de composici�n:
!     e1 | e2   elecci�n entre dos elementos e1 y e2
!     e1 , e2   secuencia e1 seguido de e2
!     e+        secuencia de uno o m�s elementos e
!     ?e        elemento opcional e
!     ( )       agrupaci�n de nodos
!    Las llaves "{" "}" definen el contenido de un nodo.
!    El s�mbolo "*" es un comod�n que coincide con cualquier elemento
!    Es posible renombrar una etiqueta escribiendo delante un nombre 
!    seguido de dos puntos ":"
!
! c) Las REGLAS definen las transformaciones a aplicar a los elementos
!    identificados en el patr�n.
!    Cada regla acaba con un punto y coma ";"
!
! - Puede tratarse de una regla de acci�n. En este caso, la regla 
!   comienza por "$" y va seguida de la acci�n de men� a realizar.
!
! - Puede haber una lista de elementos de transformaci�n:
!   Tienen dos partes:
!      - el identificador de fuente: una etiqueta o un nombre que se
!        encuentra en el patr�n y enlaza la regla a los nodos del patr�n
!      - el cuerpo de la regla: controla transformaci�n
!        hay dos tipos de cuerpos de reglas:
!        - a discard rule body is slash and express that the correspoding
!          pattern node does not occuring the transformation result
!        - una regla de generaci�n comienza por
!        - un s�mbolo ">"
!        - y una lista de etiquetas de desstino. La lista se divide en
!          dos partes separadas por dos puntos ":": 
!           * el camino al lugar de generaci�n
!           * y la lista de etiquetas a generar
!   El s�mbolo "." se emplea para bajar en la estructura en �rbol.
!   Si la marca especial estrella ("*") se encuentra al final de la lista
!   de etiquetas a generar, la etiqueta del elemento origen no se cambia,
!   pero el elemento puede desplazarse a otro lugar.
!
!   Las reglas se aplican en el orden en el que se encuentran los 
!   identificadores al recorrer (primero en profundidad) la estructura origen.
!   varias reglas pueden tener el mismo identificador, en ese caso las reglas
!   se aplican en el orden en que est�n definidas.

! Reglas de transformaci�n
!!!!!!!!!!!!!!!!!!!!!!!!!!

Direcci�n:(p{*+})+;
	{
	* > address:*;
	}

P�rrafo:(address{*+});
	{
	* > p:*;
	}

! Entre listas
!!!!!!!!!!!!!!

Lista de definici�n:*{(li{(list:*{(li{li2:(*)+})+}|other:*)+})+};
	{
  li2 > dl:dd.*;
  other > dl:dt;
	}

Lista no ordenada:(dl{(dt|dd{(*)+})+})+;
	{
	dt > ul:li;
	* > ul.li.ul:li.*;
	}

Lista ordenada:(dl{(dt|dd{(*)+})+})+;
	{
	dt > ol:li;
	* > ol.li.ol:li.*;
	}

Lista no ordenada:(ol{(li{(*)+})+})+;
        {
        * > ul:li.*;
        }

Lista ordenada:(ul{(li{(*)+})+})+;
        {
	* > ol:li.*;
        }

Definici�n:dt{(*)+};
	{
	* > dd:*;
	}

T�rmino:dd{(p|*)+};
	{
	dd > :dt;
	p > :dt;
	* > dt:*;
	}

Borrar lista de definici�n:(dl{(dt{(dtc:*)+}|dd{(p|*)+})+})+;
	{
	dtc > h4:*;
	p > p;
	* > p:*;
	}

! Eliminar Encabezados
!!!!!!!!!!!!!!!!!!!!!!

P�rrafos: 
(h1|h2|h3|h4|h5|h6|p|*{(li{(il:*)+})+})+;
	{ 
	h1 > :p;
	h2 > :p;
	h3 > :p;
	h4 > :p;
	h5 > :p;
	h6 > :p;
	p > :p;
	il > :p;
	}

! Encabezados en/desde definiciones
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Lista de definici�n:*,(h1|h2|h3|h4|h5|h6|p)+;
	{
	* > dl:dt;
	h1 > dl:dt;
	h2 > dl:dt;
	h2 > dl:dt;
	h3 > dl:dt;
	h4 > dl:dt;
	h5 > dl:dt;
	h6 > dl:dt;
	p > dl:dd;
	}

Lista de definici�n:(h1,?hr,?(level1:*)+,?(h2,?(level2:*)+,?((h3|h4|h5|h6),(level3:*)+)+)+)+;
	{
	h1 > dl:dt;
	level1>dl.dd:*;
	h2 > dl.dd:dl.dt ;
	level2 > dl.dd.dl.dd:*;
	h3 > dl.dd.dl.dd:dl.dt ;
	h4 > dl.dd.dl.dd:dl.dt ;
	h5 > dl.dd.dl.dd:dl.dt ;
	h6 > dl.dd.dl.dd:dl.dt ;
	level3 > dl.dd.dl.dd.dl.dd:*;
	}

Lista de definici�n:(h2,?hr,?(level1:*)+,(h3,?(level2:*)+,((h4|h5|h6),(level3:*)+)+)+)+;
	{
	h2 > dl:dt;
	level1 > dl.dd:*;
	h3 > dl.dd:dl.dt ;
	level2 > dl.dd.dl.dd:*;
	h4 > dl.dd.dl.dd:dl.dt ;
	h5 > dl.dd.dl.dd:dl.dt ;
	h6 > dl.dd.dl.dd:dl.dt ;
	level3 > dl.dd.dl.dd.dl.dd:*;
	}

Lista de definici�n:(h3,?hr,?(level1:*)+,?(h4,?(level2:*)+,((h5|h6),(level3:*)+)+)+)+;
	{
	h3 > dl:dt;
	level1 > dl.dd:*;
	h4 > dl.dd:dl.dt ;
	level2 > dl.dd.dl.dd:*;
	h5 > dl.dd.dl.dd:dl.dt ;
	h6 > dl.dd.dl.dd:dl.dt ;
	level3 > dl.dd.dl.dd.dl.dd:*;
	}

Lista de definici�n multinivel:(h4,?hr,?(level1:*)+,(h5,?(level2:*)+,((h6)+,(level3:*)+)+)+)+;
	{
	h4 > dl:dt;
	level1 > dl.dd:*;
	h5 > dl.dd:dl.dt ;
	level2 > dl.dd.dl.dd:*;
	h6 > dl.dd.dl.dd:dl.dt ;
	level3 > dl.dd.dl.dd.dl.dd:*;
	}

Encabezados h1:(dl{(dt1:dt|dd{(dl{(dt2:dt|dd{(dl{(dt3:dt|dd{content:*})+}|content:*)+})+}|content:*)+})+}|hr)+;
	{
	dt1 > :h1;
	dt2 > :h2;
	dt3 > :h3;
	content > :*;
	}

Encabezados h2:(dl{(dt1:dt|dd{(dl{(dt2:dt|dd{(dl{(dt3:dt|dd{content:*})+}|content:*)+})+}|content:*)+})+}|hr)+;
	{
	dt1 > :h2;
	dt2 > :h3;
	dt3 > :h4;
	content > :*;
	}

Encabezados h3:(dl{(dt1:dt|dd{(dl{(dt2:dt|dd{(dl{(dt3:dt|dd{content:*})+}|content:*)+})+}|content:*)+})+}|hr)+;
	{
	dt1 > :h3;
	dt2 > :h4;
	dt3 > :h5;
	content > :*;
	}

Lista de definici�n: p,*+;
	{
	p > dl:dt;
	* > dl.dd:*;
	}

! Preformateado en/desde p�rrafos
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Preformateado: (p{*+})+;
	{
	* > pre:*;
	}

P�rrafo: (pre{*+})+;
	{
	*   > p:*;
	}

Unir elementos: li,(li2:li)+;
	{
	li > li:;
	li2 > li:;
	}

Eliminar el nivel de p�rrafo: li{p{(cont:*)+},?(next:*)+};
	{
     	li > li:;
     	cont > *;
     	next > *;
     	}

Eliminar el subrayado: (u{*+})+;
        {
        * > :*;
        }

Separar elementos: (li{a:*,(b:*)+})+;
	{
	a > :li.*;
	b > :li.*;
	}

Unir listas: ul{li+},(ul{li+})+;
	{
	li > ul:li;
	}

Unir listas: ol{li+},(ol{li+})+;
	{
	li > ol:li;
	}

Unir listas: dl{(dt|dd)+},(dl{(dt|dd)+})+;
	{
	dt > dl:dt;
	dd > dl:dd;
	}

!P�rrafo: *{(li{(cont:*)+})+};
!	{
!	cont > :*;
!	}

P�rrafo: *{(li{(*{?(li{(lev2:*)+})+})+})+};
	{
	lev2 > :*;
	}

P�rrafos: (ol{(li{(h1|h2|h3|h4|h5|h6|p|*)+})+})+;
	{
	h1 > :h1;
	h2 > :h2;
	h3 > :h3;
	h4 > :h4;
	h5 > :h5;
	h6 > :h6;
	p > :p;
	* > :p.*;
	}

P�rrafos: (ul{(li{(h1|h2|h3|h4|h5|h6|p|*)+})+})+;
	{
	h1 > :h1;
	h2 > :h2;
	h3 > :h3;
	h4 > :h4;
	h5 > :h5;
	h6 > :h6;
	p > :p;
	* > :p.*;
	}

Eliminar dos niveles de listas: *{(li{(*{?(li{(lev2:*)+})+})+})+};
	{
	lev2 > :*;
	}

! Formularios en/desde elementos
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Incluir en formulario:(h1|h2|h3|h4|h5|h6|p)+;
	{
	h1 > form:h1;
	h2 > form:h2;
	h3 > form:h3;
	h4 > form:h4;
	h5 > form:h5;
	h6 > form:h6;
	p > form:p;
	}

Eliminar formulario: form{?*+};
	{
	* > :*;
	}

Eliminar el submen�: (optgroup{*+})+;
	{
        * > :*;
	}

! Listas en/desde elementos
!!!!!!!!!!!!!!!!!!!!!!!!!!!

Lista no ordenada: (p|ol|menu|dir|pre|form)+;
   	{
        p > <ul class=p.class>:<li style=p.style>;
        ol > <ul class=ol.class>;
        pre > ul:li.pre;
        form > ul:li.form;
        }

Lista ordenada:(p|ul|menu|dir|pre|form)+;
	   {
        p > <ol class=p.class>:<li style=p.style>;
        ul > <ol class=ul.class>;
        pre > ol:li.pre;
        form > ol:li.form;
        }

! Remove elements
!!!!!!!!!!!!!!!!!!!!!!!!!

Eliminar divisi�n: (div{*+})+;
	{
        * > :*;
	}

Eliminar elemento center: (center{*+})+;
	{
        * > :*;
	}

Eliminar nivel de p�rrafo: (p{*+})+;
     	{
        * > :*;
     	}

Eliminar elemento blockQuote: blockquote{*+};
	{
	* > :*;
	}

Eliminar elemento font: font{*+};
	{
	* > :*;
	}

Eliminar elemento span: span{*+};
	{
	* > :*;
	}

Eliminar elemento sub�ndice: sub{*+};
	{
	* > :*;
	}
Eliminar elemento super�ndice: sup{*+};
	{
	* > :*;
	}
	
Eleminar elemento cita (q): q{*+};
	{
        * > :*;
	}

Eliminar elemento bidi: bdo{*+};
	{
        * > :*;
	}

! Tablas en/desde elementos
!!!!!!!!!!!!!!!!!!!!!!!!!!!

Tabla: *{(lev1:li{?(*{(lev2:li)+}|elem:*)+})+};
	{
	lev1 > <table border="1">:tr;
	elem > table.tr:td.*;
	lev2 > table.tr:td;
	}

Tabla: dl{(dt|dd)+};
	{
	dt > <table border="1">.tbody:tr.td;
	dd > table.tbody.tr:td;
	}

Lista ordenada:table{?caption,(block:*{(tr{(td|th),?(td2:td|th2:th)+})+})+};
  	{
	caption > :ol.li.strong;
	block > :ol;
	tr > ol:li;
	td > ol.li:;
	th > ol.li:;
	td2 > ol.li.ul:li;
	th2 > ol.li.ul:li;
	}

Lista no ordenada:table{?caption,(block:*{(tr{(td|th),?(td2:td|th2:th)+})+})+};
	{
	caption > :ul.li.strong;
	block > :ul;
	tr > ul:li;
	td > ul.li:;
	th > ul.li:;
	td2 > ul.li.ul:li;
	th2 > ul.li.ul:li;
	}

Lista de definici�n:table{?caption,(block:*{(tr{(td|th),?(td2:td|th2:th)+})+})+};
        {
        caption > :dl.dt;
        block   > :dl;
        td      > dl:dt;
        th      > dl:dt;
        td2     > dl:dd;
        th2     > dl:dd;
        }

Tabla vertical: *+;
	{
	* > <table border="1">:tr.td.*;
	}

Tabla horizontal: *+;
	{
	* > <table border="1">.tr:td.*;
	}

Eliminar tabla:table{?caption,(block:*{(tr{(td|th),?(td2:td|th2:th)+})+})+};
        {
        caption > :div.p;
        block   > :div;
        td      > :div;
        th      > :div;
        td2     > :div;
        th2     > :div;
        }

Celdas de encabezado:?(td|th)+,td,?(td|th)+;
	{
	$ChangeToHeadingCell;
	}

Celdas de datos:?(td|th)+,th,?(td|th)+;
	{
	$ChangeToDataCell;
	}

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Tests de transformaci�n del documento completo !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

DistrThot: body{*+}
	{
	body > 	<table border="0" with="100%">.tbody.tr.<td with="30%">.<a href="http://opera.inrialpes.fr/OPERA/Thot.en.html"><img src="thot.gif" alt="Thot Editor" border="0" align="middle">;
	body > table.tbody.tr.td:<a href="http://opera.inrialpes.fr">.<img src="opera.gif" alt="Opera project" border="0" align="middle">;
	body > table.tbody.tr:td.<img src="guide.gif" alt="Documentation" border="0" align="middle">;
	body > table.tbody.tr.td:h1."Title of the page";
	body > :<table border="0" with="100%">.tbody.tr.<td with="30%">.h2.<a href="Index.html">."Home";
	* > table.tbody.tr:td.*;
	}
