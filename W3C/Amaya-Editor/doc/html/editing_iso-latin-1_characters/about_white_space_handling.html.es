<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="generator"
  content="amaya 8.0-pre, see http://www.w3.org/Amaya/" />
  <title>Acerca de los espacios en blanco</title>
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="about_standard_multikey_support.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif" /></a>
        <a href="../EditChar.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif" /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Acerca de los espacios en blanco</h1>

<p>Amaya elimina los espacios en blanco no significativos cuando abre un
documento, a menos que deban ser expl�citamente conservados. Esto ocurre
tanto en los documentos XHTML, MathML y SVG, como en los elementos MathML o
SVG incluidos en un documento HTML.</p>

<p>Estos espacios en blanco se consideran no significativos:</p>
<ul>
  <li>espacios en blanco al final de un l�nea (<code>#xD</code> y
    <code>#xA</code>)</li>
  <li>tabulaciones (<code>#X9</code>)</li>
  <li>espacios en blanco al principio de un elemento</li>
  <li>espacios en blanco al final de un elemento</li>
  <li>espacios en blanco contiguos (se conserva un �nico espacio)</li>
</ul>

<p>Para conservar todos los caracteres en algunos elementos, utiliza el
atributo <code>xml:space</code> o el elemento <code>pre</code> (que s�lo es
v�lido en documentos XHTML). Los posibles valores del atributo
<code>xml:space</code> son <code>default</code> y <code>preserve</code>.</p>
<ul>
  <li>El valor <code>default</code> significa que el tratamiento por omisi�n
    de los espacios en blanco de la aplicaci�n es aceptable. En el caso de
    Amaya, el tratamiento por omisi�n elimina los espacios en blanco no
    significativos en todas las DTD soportadas, como se indica en el primer
    p�rrafo.
    
  </li>
  <li>El valor <code>preserve</code> significa que la aplicaci�n debe
    conservar todos los caracteres, excepto el primer car�cter que sigue a la
    etiqueta de cierre del elemento, si el emento se encuentra al final de
    una l�nea.</li>
</ul>

<p>El atributo <code>xml:space</code> se aplica a todos los elementos
incluidos en el elemento en el que aparece el atributo, a menos que sea
anulada por otra instancia del atributo <code>xml:space</code>.</p>

<p>En la DTD XHTML, el elemento <code>pre</code> se comporta como el atributo
<code>xml:space</code> con el valor <code>preserve</code>.</p>

<p>Amaya trata los espacios en blanco cuando abre el documento, no mientras
se edita. Por tanto, si escribes espacios en blanco no significativos, ser�n
visibles y se guardar�n como tales, pero se eliminar�n cuando Amaya abra de
nuevo el documento. Por ejemplo, el c�digo fuente siguiente:</p>

<p><code>&lt;p&gt;Amaya elimina los&lt;strong&gt; espacios en blanco no
significativos &lt;/strong&gt;cuando abre...&lt;/p&gt;</code></p>

<p>se muestra as� al editarse:</p>

<p><code>Amaya elimina los <strong>espacios en blanco no
significativos</strong> cuando abre...</code></p>

<p>El texto se guardar� tal y como se ha escrito. Sin embargo, cuando el
documento se abra de nuevo, el texto se mostrar� as�::</p>

<p><code>Amaya elimina los<strong>espacios en blanco no
significativos</strong>cuando abre...</code></p>

<p>porque los espacios al principio y al final del elemento
<code>&lt;strong&gt;</code> se consideran no significativos y son
eliminados.</p>

<p>El c�digo fuente correcto ser�a:</p>

<p><code>&lt;p&gt;Amaya elimina los &lt;strong&gt;espacios en blanco no
significativos&lt;/strong&gt; cuando abre...&lt;/p&gt;</code></p>
</div>
</body>
</html>
