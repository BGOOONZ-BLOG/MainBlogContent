<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Escribir caracteres matem�ticos</title>
  <meta name="GENERATOR"
  content="amaya 8.0-pre, see http://www.w3.org/Amaya/">
  <link href="../style.css" rel="stylesheet" type="text/css">
</head>

<body lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home"> <img alt="Amaya"
        src="../../images/amaya.gif"></td>
      <td><p align="right"><a href="the_math_palette_and_the_types.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif"></a> <a
        href="../Math.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif"></a> <a
        href="editing_math_expressions.html.es" accesskey="n"><img
        alt="siguiente" src="../../images/right.gif"></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Escribir caracteres matem�ticos</h1>

<p>Cuando escribes una cadena de caracteres en un elemento MathML, Amaya
analiza la cadena y autom�ticamente genera los elementos  <code>mo</code>
(operador), <code>mn</code> (n�mero), <code>mi</code> (identificador), and
<code>mtext</code>.</p>

<p>Por ejemplo, para escribir la f�rmula <code>x=2a+b</code>:</p>
<ol>
  <li>Si no est�s en una expresi�n matem�tica elige <strong>XML &gt;  MathML &gt; Nueva f�rmula (math)</strong>.
    
  </li>
  <li>Escribe la f�rmula (6 caracteres): <code>x=2a+b</code></li>
</ol>

<p>Abre la vista Estructura para ver la estructura generada por Amaya:</p>

<p><code>&lt;mi&gt;x&lt;/mi&gt;&lt;mo&gt;=&lt;/mo&gt;&lt;mn&gt;2&lt;/mn&gt;&lt;mi&gt;a&lt;/mi&gt;&lt;mo&gt;+&lt;/mo&gt;&lt;mi&gt;b&lt;/mi&gt;</code></p>

<p>Si el resultado no es exactamente los que quieres, selecciona los
lacaracteres mal interpretados y cambia su tipo con los comandos Texto simple
(<code>mtext</code>), Identificador (<code>mi</code>), o N�mero del men�
<strong>XML &gt;  MathML</strong>.</p>

<h2>Espaciado</h2>

<p>Amaya tiene en cuenta el espaciado en las expresiones matem�ticas, pero en
algunos casos puedes necesitar espacios adicionales. Sit�a el cursor en la
posici�n en la que quieres insertar espacios y elige <strong>XML &gt;  MathML &gt; Espacio (mspace)</strong>. De esta manera se crea un espacio
horizontal por omisi�n. Puedes cambiar su anchura mediante su atributo
<strong>width</strong> o puedes a�adir otros atributos (height, depth,
linebreak) para cambiar el espaciado vertical. Consulta la recomendaci�n <a
href="http://www.w3.org/TR/MathML2/chapter3.html#N9197">MathML
specification</a> para m�s detalles.</p>

<h2>Tama�o de par�ntesis</h2>

<p>Al escribir par�ntesis como los de la expresi�n siguiente:</p>
<p<When entering brackets as in the following expression:</p>
<p><math xmlns="http://www.w3.org/1998/Math/MathML">
  <mi>f</mi>
  <mrow>
    <mo>(</mo>
    <mi>x</mi>
    <mo>)</mo>
  </mrow>
  <mo>=</mo>
  <mfrac>
    <mn>1</mn>
    <mi>x</mi>
  </mfrac>
</math>
</p>

<p>si escribe <code>f(x)=</code> se convertir� en:</p>

<p><math xmlns="http://www.w3.org/1998/Math/MathML">
  <mi>f</mi>
  <mo>(</mo>
  <mi>x</mi>
  <mo>)</mo>
  <mo>=</mo>
  <mfrac>
    <mn>1</mn>
    <mi>x</mi>
  </mfrac>
</math>
</p>

<p>Para evitarlo, elige <strong>XML &gt;  MathML &gt; Par�ntesis</strong>
o elige la opci�n Par�ntesis de la paleta MathML y se escribir�n los
par�ntesis adecuados.</p>
</div>
</body>
</html>
