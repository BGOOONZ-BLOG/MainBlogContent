<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Enlazar en MathML</title>
  <meta name="generator" content="amaya 8.5, see http://www.w3.org/Amaya/">
  <link href="../style.css" rel="stylesheet" type="text/css">
</head>

<body lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home"> <img alt="Amaya"
        src="../../images/amaya.gif"></td>
      <td><p align="right"><a href="viewing_structure_in_mathml.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif"></a> <a
        href="../Math.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif"></a> <a href="math_issues.html.es"
        accesskey="n"><img alt="siguiente"
        src="../../images/right.gif"></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body" class="Section1">
<h1>Enlazar en MathML</h1>

<p>Puedes crear y utilizar enlaces en expresiones matem�ticas. Estos enlaces
se basan en una versi�n preliminar del Lenguage de Enlaces XML (XLink).
�nicamente est�n disponibles hiperenlaces unidireccionales, pero puedes
asociar un enlace a cualquier parte de una f�rmula. Por ejemplo, la fracci�n
de la f�rmula siguiente es un enlace a la p�gina de inicio del W3C:</p>

<p><math xmlns="http://www.w3.org/1998/Math/MathML">
  <mrow>
    <mi>y</mi>
    <mo>=</mo>
    <mfrac xmlns:xlink="http://www.w3.org/1999/xlink"
    xlink:href="http://www.w3.org/">
      <mn>1</mn>
      <msqrt>
        <mrow>
          <msup>
            <mi>x</mi>
            <mn>2</mn>
          </msup>
          <mo>+</mo>
          <mn>1</mn>
        </mrow>
      </msqrt>
    </mfrac>
  </mrow>
</math></p>

<p>Al hacer doble clic en cualquier car�cter de la fracci�n se carga la
p�gina de inicio del W3C.</p>

<p>Para crear un enlace as�, selecciona una expresi�n matem�tica (en el caso
anterior, la fracci�n), haz clic en el <strong>Enlace</strong> (elige el men�
<strong>Enlaces &gt; Crear o cambiar enlace</strong>), y haz clic en el
destino deseado.</p>

<p>Si el destino es una expresi�n de una f�rmula, primero debes convertir la
expresi�n en un destino. Selecciona la expresi�n y elige el comando
<strong>Enlaces &gt; Crear destino</strong> para crear un atributo
<code>id</code> para la expresi�n destino.</p>
</div>
</body>
</html>
