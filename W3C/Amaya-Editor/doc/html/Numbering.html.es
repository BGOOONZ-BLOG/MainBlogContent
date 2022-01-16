<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>Numerar encabezados y generar �ndice de materias</title>
  <link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><p><img alt="W3C" src="../images/w3c_home" /> <img alt="Amaya"
        src="../images/amaya.gif" /></p>
      </td>
      <td><p align="right"><a href="Printing.html.es" accesskey="p"><img
        alt="anterior" src="../images/left.gif" /></a> <a
        href="Manual.html.es" accesskey="t"><img alt="superior"
        src="../images/up.gif" /></a> <a href="MakeBook.html.es"
        accesskey="n"><img alt="siguiente" src="../images/right.gif"
        /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Numerar encabezados</h1>

<p>Los encabezados de secci�n (elementos <code>H2</code> a <code>H6</code>)
pueden numerarse autom�ticamente para reflejar la estructura del documento.
Se supone que el elemento H1 es el t�tulo del documento y no se numera. El
resto de encabezados recibe un n�mero calculado de acuerdo con su tipo y su
posici�n en la estructra del documento. Los n�meros se insertan en el
documento, y los valores generados con anterioridad se eliminan cada vez que
se ejecuta el comando <strong>XHTML &gt; Numerar encabezados</strong>.</p>

<h1>Generar �ndice de materias</h1>

<p>El comando <strong>XHTML &gt; Generar �ndice de materias</strong> toma en
cuenta todos los elementos <code>H2</code> a <code>H6</code> posteriores en
el mismo documento para generar el �ndice de materias en el punto de
inserci�n actual.</p>

<p>Este comando a�ade:</p>
<ul>
  <li>Un atributo <code>id</code> a cada elemento <code>H2</code> to
    <code>H6</code> que no posee este atributo.</li>
  <li>Una divisi�n con el atributo <code>class</code> con valor "toc" y una
    serie de listas no numeradas en el punto de inserci�n actual.</li>
  <li>Un elemento de lista por cada uno de los elementos <code>H2</code> a
    <code>H6</code> incluyendo un enlace al elemento correspondiente.
    <p>El elemento de lista contiene una copia del elemento <code>Hi</code>.
    Si el elemento <code>Hi</code> est� numerado, el n�mero tambi�n se
    incluye.</p>
  </li>
</ul>
</div>
</body>
</html>
