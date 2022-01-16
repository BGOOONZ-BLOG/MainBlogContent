<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Problemas conocidos en relaci�n con MathML</title>
  
  <meta content="amaya 6.4+, see http://www.w3.org/Amaya/">
  <link href="../style.css" rel="stylesheet" type="text/css">
</head>

<body lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home"> <img alt="Amaya"
        src="../../images/amaya.gif"></td>
      <td><p align="right"><a href="about_linking_in_mathml.html.es" accesskey="p"><img
        alt="anterior" src="../../images/left.gif"></a> <a
        href="../Math.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif"></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Problemas conocidos en relaci�n con MathML</h1>

<p>Amaya presenta problemas en relaci�n con MathML:</p>
<ul>
  <li>Amaya implementa �nicamente las etiquetas de presentaci�n de MathML
    2.0, no el marcado de contenido. Todos los elementos y atributos de
    presentaci�n est�n disponibles, pero �nicamente se muestran en la
    pantalla los siguientes atributos: 
    <p><code>display, alttext, mathvariant, mathsize, mathcolor,
    mathbackground, fontsize, fontweight, fontstyle, fontfamily, color,
    linethickness, numalign, denomalign, bevelled, notation, lquote, rquote,
    lspace, rspace, largeop, movablelimits, subscriptshift, superscriptshift,
    form, width </code>(mspace �nicamente), <code>height</code> (mspace
    �nicamente), <code>depth</code> (mspace �nicamente), <code>align,
    rowalign, columnalign, frame, framespacing, displaystyle, side, rowspan,
    columnspan, rowspacing, columnspacing, rowlines, columnlines</code>.</p>
  </li>
  <li>Los atributos <code>class</code>, <code>id</code> y <code>style</code>
    est�n disponibles, con la misma sem�ntica que en HTML: puedes asociar
    estilos CSS a elementos MathML (atributos <code>class</code> y
    <code>style</code>) y un elemento MathML puede ser el destino de un
    enlace (atributo <code>id</code>).</li>
  <li>Dada la falta de fuentes matem�ticas en la versi�n actual, tan s�lo se
    reconocen un subconjunto limitado de entidades que representan s�mbolos
    matem�ticos, b�sicamente los disponibles en la fuente Symbol. La versi�n
    actual soporta las siguientes entidades:
    <p><code>Therefore, SuchThat, DownTee, Or, And, Not, Exists, ForAll,
    Element, NotElement, NotSubset, Subset, SubsetEqual, Superset,
    SupersetEqual, DoubleLeftArrow, DoubleLeftRightArrow, DoubleRightArrow,
    LeftArrow, LeftRightArrow, RightArrow, Congruent, GreaterEqual, le,
    NotEqual, Proportional, VerticalBar, Union, Intersection, PlusMinus,
    CirclePlus, Sum, Integral, CircleTimes, Product, CenterDot, Diamond,
    PartialD, DoubleDownArrow, DoubleUpArrow, DownArrow, UpArrow,
    ApplyFunction, TripleDot, DifferentialD, ImaginaryI, ExponentialE,
    InvisibleComma, UnderBar, OverBar, ThinSpace, ThickSpace, Hat, OverBar,
    UnderBar, prime, Prime.</code></p>
  </li>
</ul>
</div>
</body>
</html>
