<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>Problemas conocidos con las anotaciones y los documentos
  modificados</title>
  <meta name="GENERATOR" content="amaya 8.6, see http://www.w3.org/Amaya/" />
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="configuring_icons.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif" /></a>
        <a href="../Annotations.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif" /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Problemas conocidos con las anotaciones y los documentos modificados</h1>

<p>Cuando utilizas anotaciones en documentos en elaboraci�n (documentos cuyo
contenido puede cambiar), puedes encontrar dos tipo de problemas:
<strong>anotaciones hu�rfanas</strong> y <strong>anotaciones
equ�vocas</strong>. Para explicar estos problemas, describiremos primero c�mo
Amaya asocia anotaciones a los documentos.</p>

<p>Amaya utiliza <strong><a
href="http://www.w3.org/XML/Linking">XPointer</a></strong> para indicar el
lugar en el que la anotaci�n debe adjuntarse al documento. Los XPointers se
basan en la estructura del documento. Para construir un XPointer para una
selecci�n, por ejemplo, Amaya empieza en el comienzo de la selecci�n y sube
en la estructura del documento hasta la ra�z. Si un elemento tiene un
atributo ID, Amaya deja de construir el XPointer y considera el elemento con
atributo ID el inicio del XPointer.</p>

<p>Por ejemplo, si miras al c�digo fuente HTML de este documento, te dar�s
cuenta de que esta secci�n forma parte de un elemento div cuyo atributo ID
tiene el valor "page_body". Este es el c�digo fuente:</p>
<pre>  &lt;div id="page_body"&gt;
  &lt;h1&gt;Problemas conocidos con...&lt;/h1&gt;
  &lt;p&gt;Cuando utilizas...&lt;/p&gt;
  &lt;p&gt;Amaya utiliza &lt;strong&gt;XPointer&lt;/strong&gt;...&lt;/p&gt;
  ...
  &lt;/div&gt;</pre>

<p>Este XPointer apunta al segundo p�rrafo:
<code>xpointer(id("page_body")/p[2])</code></p>

<p>El XPointer anterior apunta al segunda elemento <code>p</code>, a partir
del elemento padre cuyo atributo ID tiene el valor "page_body".</p>

<p>F�jate en que la utilizaci�n del atributo ID permite al autor del
documento mover la referencia del XPointer a cualquier lugar del documento
sin necesidad de actualizar el XPointer. El XPointer no depende de los
elementos que lo preceden.</p>

<h2>Anotaciones hu�rfanas</h2>

<p>Una anotaci�n se vuelve "hu�rfana" cuando ya no puede adjuntarse al
documento, es decir, cuando el XPointer no encuentra su elemento en la
estructura. Esto ocurre cuando se modifca la estructura del documento. Amaya
muestra un aviso cuando detecta anotaciones hu�rfanas al descargar
anotaciones de un servidor de anotaciones. Todas las anotaciones hu�rfanas
son visibles en la vista Enlaces y el icono asociado es un signo de
interrogaci�n superpuesto al l�piz de anotaci�n <img
src="../../images/annotorp.png" alt="Icono de anotaci�n hu�rfana" />.</p>

<h2>Anotaciones equ�vocas</h2>

<p>Una anotaci�n es "equ�voca" cuando apunta a una informaci�n que no le
corresponde. Esto suele suceder cuando anotas una porci�n de texto que
posteriormente se modifca. En esta versi�n, Amaya no avisa al usuario si una
anotaci�n es equ�voca. En futuras versiones, puede que se notifique a los
usuarios cuando una anotaci�n pueda ser equ�voca.</p>

<h2>�Qu� puedes hacer para evitarlo?</h2>

<p>Como autor de un documento, intenta utilizar el atributo <code>ID</code>
en lugares estat�gicos, por ejemplo en los elementos <code>&lt;div&gt;</code>
y <code>p</code>. Por ejemplo:</p>
<pre>  &lt;p id="Amaya"&gt;Amaya utiliza...&lt;/p&gt;</pre>

<p>Un XPointer que apunta a este p�rrafo ser�a:
<code>xpointer(id("Amaya"))</code></p>

<p>Por tanto, el Xpointer apuntar� al mismo p�rrafo, sea cual sea su posici�n
en la estructura.</p>

<p>Amaya te permite crear o eliminar autom�ticamente los atributos
<code>ID</code> en un conjunto de elementos eligiendo el comando de men�
<strong>Enlaces &gt; Crear/Borrar atributos id</strong>.</p>
</div>
</body>
</html>
