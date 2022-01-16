<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>Marcado en l�nea</title>
  <meta name="GENERATOR" content="amaya 9.1, see http://www.w3.org/Amaya/" />
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<div>
<img border="0" alt="Amaya" src="../../../resources/icons/22x22/logo.png" />

<p class="nav"><a href="address.html.es"><img alt="anterior" border="0"
src="../../../resources/icons/misc/left.png" /></a> <a
href="../HTML.html.es"><img alt="superior" border="0"
src="../../../resources/icons/misc/up.png" /></a> <a
href="40styling.html.es"><img alt="siguiente" border="0"
src="../../../resources/icons/misc/right.png" /></a></p>
</div>

<div id="page_body">
<h1>Marcado en l�nea</h1>

<p>El texto contenido en un p�rrafo, encabezado u otro elemento de bloque
puede ser marcado de muchas maneras, por ejemplo, para enfatizarlo, o para
resaltar texto que tiene que ser introducido por el usuario en el ordenador.
La mayor�a de estos elementos "en l�nea" se describen en esta p�gina, aunque
los enlaces, que son elementos en l�nea, se describen en otro lugar.</p>

<div>
<h2><a name="Definition">Definiciones</a></h2>

<p>Utiliza el elemento <a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-DFN"><code>dfn</code></a>
para marcar una <dfn>definici�n en l�nea</dfn>.</p>

<p>Puedes utilizar <a href="../StyleSheets.html.es">hojas de estilo</a> para
modificar el formato de los elementos en l�nea.</p>
</div>

<div>
<h2><a name="Inline1">Citas en l�nea</a></h2>

<p>Puedes marcar las citas insertadas en el texto con el elemento <a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-Q"><code>q</code></a>.
Este elemento se encuentra en el comando de men� <strong>XHTML &gt; Elemento
car�cter &gt; Cita (q)</strong> y tambi�n puedes utilizar el atajo de teclado
<kbd>Ctrl i Ctrl q</kbd>. Puedes hacer referencia a la fuente dando el URI en
el atributo <code>cite</code>.</p>

<p>Puedes utilizar <a href="../StyleSheets.html.es">hojas de estilo</a> para
modificar el formato de las citas en l�nea. La recomendaci�n HTML establece
que las citas en l�nea deben mostrarse con los signos de puntuaci�n
correspondiente al lenguaje representado.</p>
</div>

<div>
<h2><a name="Sample">Muestra de entrada, salida y c�digo de ordenador</a></h2>

<p>Los elementos para marcar c�digo de ordenador, bien sea c�digo (por
ejemplo, <code>statement:do-something</code>), <var>variables</var>,
<kbd>entrada del usuario</kbd> o <samp>salida de un programa</samp> son los
elementos <a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-CODE"><code>code</code></a>,
<a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-VAR"><code>var</code></a>,
<a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-KBD"><code>kbd</code></a>
y <a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-SAMP"><code>samp</code></a>.
Estos elementos se encuentran en el submen� <strong>XHTML &gt; Tipo de
informaci�n</strong> y sus atajos de teclado correspondiente empiezan todos
por <kbd>Ctrl i</kbd> y siguen con <kbd>Ctrl t</kbd> para c�digo, <kbd>Ctrl
v</kbd> para variables, <kbd>Ctrl k</kbd> para la entrada del usuario y
<kbd>Ctrl m</kbd> para la salida del programa.</p>

<p>Puedes utilizar <a href="../StyleSheets.html.es">hojas de estilo</a> para
modificar el formato de estos elementos.</p>
</div>

<div>
<h2><a name="Inline">Acr�nimos y abreviaturas</a></h2>

<p>Los acr�nimos y abreviaturas deben marcarse como tales, utilizando los
elementos <a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-ABBR"><code>abbr</code></a>
y <a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-ACRONYM"><code>acronym</code></a>
que se encuentran en el submen� <strong>XHTML &gt; Tipo de
informaci�n</strong>. El atajo de teclado para Acronym es <kbd>Ctrl i Ctrl
y</kbd>. Estos elementos pueden ser reconocidos por diferentes tipos de
sistemas. Puedes utilizar el atributo <code>title</code> para indicar el
significado de un acr�nimo. Selecciona el texto a marcar (por ejemplo, W3C) y
selecciona el comando de men� <strong>XHTML&gt; Tipo de informaci�n &gt;
Acr�nimo</strong>. A continuaci�n selecciona el elemento completo con
<kbd>F2</kbd>, elige el comando de men� <strong>Atributos &gt;
T�tulo</strong>, escribe <kbd>World Wide Web Consortium</kbd> y finalmente
pulsa Aplicar.</p>

<p>Puedes utilizar <a href="../StyleSheets.html.es">hojas de estilo</a> para
modificar el formato de acr�nimos y abreviaturas.</p>
</div>

<div>
<h2><a name="Inline2">A�adidos y eliminaciones</a></h2>

<p>Los elementos <a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-del"
name="DEL"><code>del</code></a> e <a
href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-ins"><code>INS</code></a>
se encuentran en el submen� <strong>XHTML &gt; Tipo de informaci�n</strong>
para marcar el texto <del>que ser� eliminado</del> o que <ins>ya ha sido
a�adido.</ins></p>

<p>Puedes utilizar <a href="../StyleSheets.html.es">hojas de estilo</a> para
modificar el formato de a�adidos y eliminaciones.</p>
</div>

<div>
<h2><a name="Emphasis">Elementos enfatizadores</a></h2>

<p>En HTML existen elementos para indicar dos niveles de �nfasis:</p>
<ol>
  <li><em>�nfasis normal</em>, mediante el elemento <a
    href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-EM"><code>em</code></a>
    y</li>
  <li><strong>�nfasis fuerte</strong>, mediante el elemento <code><a
    href="http://www.w3.org/TR/REC-html40/struct/text.html#edef-STRONG">strong</a></code></li>
</ol>

<p>Puedes aplicar ambos tipos de �nfasis mediante los botones <img
src="../../../resources/icons/16x16/XHTML_I.png" alt="Emphasis" /> y <img
src="../../../resources/icons/16x16/XHTML_B.png" alt="Strong" /> de la barra
de botones, o mediante el submen� <strong>XHTML &gt; Tipo de
informaci�n</strong>. Los atajos de teclado correspondientes son <kbd>Ctrl i
Ctrl e</kbd> para el �nfasis normal (el �nfasis se suele mostrar a menudo
mediante it�licas) y <kbd>Ctrl i Ctrl s</kbd> para el �nfasis fuerte (el
�nfasis fuerte se suele mostrar mediante negrita). Si hay texto seleccionado,
el �nfasis se aplica al texto seleccionado, y si no, se crea el elemento como
hijo del elemento actual.</p>

<p>Los elementos de �nfasis conmutan, es decir, puedes eliminar el �nfasis de
un elemento seleccionando el elemento y aplicando el �nfasis correspondiente.
Por ejemplo, sit�a el cursor en el interior de un elemento
<code>strong</code>, pulsa <kbd>F2</kbd> para seleccionar el elemento y
utiliza el atajo de teclado, la opci�n del men� o el bot�n <img
src="../../../resources/icons/16x16/XHTML_B.png" alt="Strong" /> para
eliminar el elemento <code>strong</code>.</p>

<p>Puedes utilizar <a href="../StyleSheets.html.es">hojas de estilo</a> para
modificar el formato de ambos tipos de �nfasis.</p>

<h2 id="L260">El elemento SPAN</h2>

<p>El elemento <a
href="http://www.w3.org/TR/REC-html40/struct/global.html#edef-SPAN">span</a>
junto con el atributo <a
href="http://www.w3.org/TR/REC-html40/struct/global.html#adef-id"
name="id">id</a> (<a href="../StyleSheets.html.es#Creating"
name="style">style</a> o <a
href="http://www.w3.org/TR/REC-html40/struct/global.html#adef-class"
name="class">class</a>) ofrece un mecanismo gen�rico para a�adir estructura a
un documento. Amaya genera este elemento cuando el usuario aplica un atributo
a una porci�n de texto. Este elemento se elimina cuando se borra el
atributo.</p>
</div>
</div>
</body>
</html>
