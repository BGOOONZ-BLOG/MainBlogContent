<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
  <title>La paleta Matem�ticas y el men� XML</title>
  <meta name="GENERATOR" content="amaya 9.3, see http://www.w3.org/Amaya/">
  <link href="../style.css" rel="stylesheet" type="text/css">
</head>

<body lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home"> <img alt="Amaya"
        src="../../images/amaya.gif"></td>
      <td><p align="right"><a
        href="about_entering_math_constructs_using_the_keyboard.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif"></a><a
        href="../Math.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif"></a><a
        href="about_entering_math_characters.html.es" accesskey="n"><img
        alt="siguiente" src="../../images/right.gif"></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>La paleta Matem�ticas y el men� XML</h1>

<p>Para crear una expresi�n matem�tica en un documento, sit�a el cursor en la
posici�n en la que quieres insertar una expresi�n y haz clic en el bot�n
<strong>MathML</strong>, o elige el men� <strong>XML</strong>.</p>

<h2>Acceder a los comandos</h2>

<p>Las expresiones matem�ticas pueden insertarse en un documento mediante el
men� <strong>XML</strong> o eligiendo una expresi�n de la paleta
<strong>MathML</strong>.</p>

<p>Haz clic en el bot�n <strong>MathML</strong> <img alt="Bot�n"
src="../../images/Math.gif">de la barra de botones para abrir la paleta
<strong>MathML</strong>. Cierra la paleta haciendo clic en el bot�n
<strong>Aceptar</strong>.</p>

<p>Tambi�n puedes mostrar los men�s <strong>MathML</strong> haciendo clic en
el men� <strong>XML</strong>..</p>

<h2>Men� Matem�ticas y comandos de la paleta</h2>

<p>En la paleta o en el men� <strong>XML</strong>, el primer item,
<strong>F�rmula nueva</strong>, te permite crear una nueva f�rmula cuando el
cursor se encuentra en un elemento HTML o SVG, pero no en un elemento
MathML.</p>

<p>El men� <strong>XML</strong> contiene tambi�n elementos no disponibles en
la paleta. Estos elementos son: Texto simple (<code>mtext</code>),
Identificador (<code>mi</code>), N�mero (<code>mn</code>), Operador
(<code>mo</code>). Estos comandos tambi�n pueden cambiar el tipo de un
elemento o de una secuencia de elementos.</p>

<p>La opci�n Car�cter (<code>&amp;xxx;</code>) te permite escribir caracteres
no disponibles en el teclado. Muestra una caja de di�logo en la que debes
escribir el nombre del car�cter (por ejemplo, alpha para mostrar el car�cter
griego a).</p>

<p>Las siguientes opciones del men� o de la paleta <strong>MathML</strong> te
permiten crear nuevas expesiones dentro de una f�rmula. Si el punto de
inserci�n no se encuentra en una f�rmula, Amaya crea primero el elemento Math
que acepte la expresi�n. Las expresiones disponibles son:</p>
<ul>
  <li>Ra�z n-�sima, <code>mroot</code> en MathML: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mroot>
        <mrow>
          <mi>x</mi>
          <mo>+</mo>
          <mn>1</mn>
        </mrow>
        <mn>3</mn>
      </mroot>
    </math></li>
  <li>Ra�z cuadrada, <code>msqrt</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <msqrt>
        <mrow>
          <mi>x</mi>
          <mo>+</mo>
          <mn>1</mn>
        </mrow>
      </msqrt>
    </math></li>
  <li>Enclose, <code>menclose</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <menclose>
        <mn>1234</mn>
      </menclose>
    </math></li>
  <li>Fraci�n, <code>mfrac</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mfrac>
        <mn>1</mn>
        <mrow>
          <mi>x</mi>
          <mo>+</mo>
          <mn>1</mn>
        </mrow>
      </mfrac>
    </math></li>
  <li>Expresion con sub�ndice y super�ndice, <code>msubsup</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <msubsup>
        <mi>x</mi>
        <mrow>
          <mi>i</mi>
          <mo>+</mo>
          <mn>1</mn>
        </mrow>
        <mi>n</mi>
      </msubsup>
    </math>or <math xmlns="http://www.w3.org/1998/Math/MathML">
      <mrow>
        <msubsup>
          <mo largeop="true">&#x222b;</mo>
          <mn>0</mn>
          <mo>&#x221e;</mo>
        </msubsup>
        <mo>�</mo>
      </mrow>
    </math></li>
  <li>Expresi�n con sub�ndice, <code>msub</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <msub>
        <mi>x</mi>
        <mi>i</mi>
      </msub>
    </math></li>
  <li>Expresi�n con super�ndice, <code>msup</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <msup>
        <mi>x</mi>
        <mi>n</mi>
      </msup>
    </math></li>
  <li>Expresi�n con expresi�n encima o abajo, <code>munderover</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <munderover>
        <mo movablelimits="false">&#x2211;</mo>
        <mrow>
          <mi>i</mi>
          <mo>=</mo>
          <mn>1</mn>
        </mrow>
        <mi>n</mi>
      </munderover>
    </math></li>
  <li>Expresi�n con expresi�n abajo, <code>munder</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <munder>
        <mi>x</mi>
        <mo>�</mo>
      </munder>
    </math></li>
  <li>Expresi�n con expresi�n encima, <code>mover</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mrow>
        <mi>x</mi>
        <mover>
          <mo>&#x2192;</mo>
          <mtext>mapsto</mtext>
        </mover>
        <mi>y</mi>
      </mrow>
    </math></li>
  <li>Expresi�n entre par�ntesis, <code>mrow</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mrow>
        <mo fence="true">(</mo>
        <mrow>
          <mi>a</mi>
          <mo>+</mo>
          <mi>b</mi>
        </mrow>
        <mo fence="true">)</mo>
      </mrow>
    </math></li>
  <li>Expresi�n con �ndices de tensor,<code>mmultiscripts</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mmultiscripts>
        <mi>X</mi>
        <mi>i</mi>
        <mi>j</mi>
        <mprescripts/>
        <mi>k</mi>
        <mi>l</mi>
      </mmultiscripts>
    </math></li>
  <li>Matriz o tabla, <code>mtable</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mtable>
        <mtr>
          <mtd>
            <mi>a</mi>
          </mtd>
          <mtd>
            <mi>b</mi>
          </mtd>
        </mtr>
        <mtr>
          <mtd>
            <mi>c</mi>
          </mtd>
          <mtd>
            <mi>d</mi>
          </mtd>
        </mtr>
      </mtable>
    </math></li>
</ul>

<p>El �ltimo elemento de la paleta <strong>MathML</strong> (<math
xmlns="http://www.w3.org/1998/Math/MathML">
  <mi>&#x3b1;&#x3b2;&#x3b3;</mi>
</math>) abre otra paleta de la que puedes extraer s�mbolos matem�ticos y
caracteres griegos.</p>

<h2>Ver tambi�n:</h2>
<ul>
  <li><a href="editing_math_expressions.html.es">Editar expresiones
    matem�ticas</a></li>
  <li><a href="about_entering_math_characters.html.es">Escribir caracteres
    matem�ticos</a></li>
</ul>
</div>
</body>
</html>
