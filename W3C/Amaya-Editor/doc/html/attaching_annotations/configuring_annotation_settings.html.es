<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Configuraci�n de anotaciones</title>
  <meta name="GENERATOR"
  content="amaya 8.0-pre, see http://www.w3.org/Amaya/" />
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="es" lang="es">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="annotation_menu.html.es"
        accesskey="p"><img alt="anterior" src="../../images/left.gif" /></a>
        <a href="../Annotations.html.es" accesskey="t"><img alt="superior"
        src="../../images/up.gif" /></a> <a
        href="creating_an_annotation.html.es" accesskey="n"><img
        alt="siguiente" src="../../images/right.gif" /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Configuraci�n de anotaciones</h1>

<p>La opci�n de men� <strong>Anotaciones &gt; Configurar</strong> abre la
caja de di�logo <strong>Configuraci�n para anotaciones</strong>. En Windows,
la caja de di�logo es la siguiente:</p>

<p><img alt="Caja de di�logo Configuraci�n para anotaciones"
src="../../images/configuration_for_annotations-es.png" /></p>

<p>La versi�n de Unix tiene un interface ligeramente distinto, pero las
mismas funciones.</p>
<dl>
  <dt><strong>Anotaci�n de usuario</strong></dt>
    <dd>Autor de la anotaci�n. Por omisi�n, Amaya utiliza el nombre de
      usuario actual. En este campo puedes cambiar el nombre del usuario.</dd>
  <dt><strong>Servidor de publicaci�n</strong></dt>
    <dd>Este campo indica el servidor al que se env�an las anotaciones. Las
      anotaciones locales se guardan siempre en el repositorio local y, por
      omisi�n, el campo est� vac�o. El servidor de publicaci�n no se a�ade
      autom�ticamente a la lista de servidores, as� que debes incluir el
      servidor de publicaci�n en ambos lugraes.</dd>
  <dt><strong>Servidores de anotaci�n</strong></dt>
    <dd>Lista de servidores que Amaya debe contactar al buscar anotaciones.
      Puedes especificar uno o m�s servidores. El nombre reservado
      <strong>localhost</strong> hace que Amaya busque anotaciones locales,
      pero no significa que haya un servidor de anotaciones local en
      funcionamiento (en ese caso, mostrar�a su URL completa).</dd>
    <dd>En Unix, los servidores de anotaciones se especifican en forma de una
      lista separada por espacios. En Windows, puedes a�adir un nuevo nombre
      de servidor haciendo clic en la lista de servidores de anotaciones,
      pulsando <kbd>Intro</kbd> y escribiendo a continuaci�n el nombre
      del servidor. Por omisi�n, la lista inicial est� limitada a
      <code>localhost</code>.
      
      <p class="ProcedureNote"><strong>Nota:</strong> Para desactivar
      temporalmente un servidor de anotaciones, a�ade el car�cter "-" antes
      de su URL. Amaya lo ignorar�.</p>
    </dd>
  <dt><strong>Autocargar anotaciones locales / Autocargar anotaciones
  remotas</strong></dt>
    <dd>Indica si Amaya debe solicitar las anotciones autom�ticamente (al
      servidor de anotaciones) cada vez que abres un URL. Si la casilla no
      est� marcada, puedes en cualquier momento elegir el comando
      <strong>Anotaciones &gt; Cargar</strong>.
      
      <p class="Note"><strong>Nota:</strong> Si marcas la casilla
      <strong>Autocargar anotaciones remotas</strong>, puedes experimentar
      retrasos en la resoluci�n del nombre de DNS de los servidores de
      anotaciones. Por omisi�n, ambas opciones est�n desmarcadas.</p>
    </dd>
  <dt><strong>Deshabilitar autocarga remota en cada inicio (para trabajar
  desconectado)</strong></dt>
    <dd>Indica si Amaya debe reiniciar el valor de la opci�n
      <strong>Autocargar anotaciones remotas</strong> al iniciar el programa.
      Est� opci�n puede serte �til si trabajas desconectado, pero quieres
      autocargar tanto las anotaciones locales como las remotas.</dd>
</dl>

<h2>Ver tambi�n:</h2>
<ul>
  <li><span class="Link"><a href="creating_an_annotation.html.es">Crear una
    anotaci�n</a></span></li>
</ul>
</div>
</body>
</html>
