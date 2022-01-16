<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Funciones WebDAV en Amaya</title>
  <meta name="generator" content="amaya 8.2, see http://www.w3.org/Amaya/">
  <link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../images/w3c_home"> <img alt="Amaya"
        src="../images/amaya.gif"></td>
      <td><p align="right"><a href="Publishing.html.es" accesskey="p"><img
        alt="previous" src="../images/left.gif"></a> <a href="Manual.html.es"
        accesskey="t"><img alt="superior" src="../images/up.gif"></a> <a
        href="Printing.html.es" accesskey="n"><img alt="siguiente" 
        src="../images/right.gif"></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>Funciones WebDAV en Amaya</h1>

<h2>Acerca de WebDAV</h2>

<p><a href="http://www.webdav.org/">WebDAV (WWW Distributed Authoring and
Versioning)</a> es un conjunto de extensiones al protocolo HTTP que permite a
los usuarios colaborar en la edici�n y gesti�n de recursos web en servidores
remotos. Su objetivo es extender el protocolo HTTP para permitir una
arquitectura abierta en el nivel del protocolo, para desarrollar nuevas
herramientas de creaci�n  distribuida en la web, haciendo hincapi� en la
creaci�n de p�ginas web en colaboraci�n (ver <a
href="http://andrew2.andrew.cmu.edu/rfc/rfc2518.html">RFC 2518</a>). WebDAV
define operaciones sobre las propiedades, las colecciones, los espacios de
nombres y la potecci�n de sobreescritura (mecanismo de bloqueo) y, para estas
operaciones, define nuevos m�todos, encabezados, organismos de entidad de
petici�n y respuesta. Sin embargo, las caracter�sticas de tratamiento de
versiones incluidas en la propuesta original se han trasladado al grupo de
trabajo de la IEFT  <a href="http://www.webdav.org/">Delta-V</a>, que
pretende extender  WebDAV y HTTP/1.1 en estas caracter�sticas (ver el
art�culo de E. J. Whitehead "<a
href="http://www.webtechniques.com/  archives/1999/10/whitehead/">El futuro
del desarrollo de software distribuido en Internet</a>").</p>

<p>El <strong>mecanismo de bloqueo</strong> definido en WebDAV ha sido
dise�ado para prevenir la sobreescritura de recursos (es decir, prevenir el
problema de la actualizaci�n perdida), empleando las operaciones de bloqueo y
desbloqueo. Un bloqueo controla el acceso de escritura a un recurso limitando
las operaciones de escritura HTTP, como  PUT, POST y DELETE. Esto significa
que solamente alguien que conozca el bloqueo podr� ejectuar estas
operaciones. El protocolo WebDAV tambi�n define dos <strong>�mbitos de
bloqueo</strong>: <em>bloqueo exclusivo y bloqueo compartido</em>. Un bloqueo
exclusivo garantiza que una persona posee el bloqueo y que nadie m�s podr�
bloquear el recurso (esto no afecta a la lectura del recurso). Un bloqueo
exclusivo permite a un grupo de usuarios crear sus bloqueos sobre un recurso,
pero deben confiar unos en otros para prevenir problemas de acceso. Adem�s,
cada bloqueo tiene una duraci�n l�mite y el usuario no puede olvidar que los
bloqueos pueden desaparecer en el servidor debido a excepciones en el
servidor.</p>

<p>Puedes encontrar m�s informaci�n sobre  WebDAV en <a
href="http://andrew2.andrew.cmu.edu/rfc/rfc2518.html">RFC 2518</a> y tambi�n
en <a href="http://www.webdav.org/">WebDAV.org</a>.</p>

<h2>Soporte de WebDAV en Amaya</h2>

<p>Amaya tiene un soporte de WebDAV opcional y limitado. Este soporte incluye
las operaciones siguientes:  bloqueo/desbloqueo de un recurso compilante
WebDAV, ver las propiedades WebDAV de un recurso y capacidades de
descubrimiento de bloqueos. Adem�s, este soporte incluye algunas funciones de
reconocimiento, que pueden informar autom�ticamente al usuario sobre los
recursos bloqueados.</p>

<h3>�C�mo utilizarlo?</h3>

<p>El soporte de WebDAV presente en Amaya pretende ayudar a peque�os grupos
de usuarios a editar en colaboraci�n sus p�ginas Web. Para mostrar c�mo
funciona, he aqu� un ejemplo; sup�n que tienes un servidor WebDAV (en
realidad, <strong>necesitas</strong> un servidor Web que soporte WebDAV para
trabajar con �l) que se llama  <code>servidordav.miempresa.com</code>, y que
t� y tus compa�eros quer�is editar en colaboraci�n algunos documentos que
est�n en la carpeta WebDAV <code>/shared/</code> (las carpetas WebDAV se
denominan colecciones).</p>

<p>Entonces, imagina que necesitas modificar el documento
<code>http://servidordav.miempresa.com/shared/Doc1.html</code>. Para ello,
abres el documento en tu editor Amaya y a continuaci�n
<strong>bloqueas</strong> el documento (<em>Bloquear recurso</em> en el <a
href="#L654">men� Cooperaci�n</a> ver <a href="#L654">Figura 1</a>). Una vez
has bloqueado el documento, si uno de tus compa�eros intenta guardar alg�n
cambio en el documento, ser� avisado de tu bloqueo y las actualizaciones no
se perder�n autom�ticamente. Mientras el documento est� bloqueado puedes
modificarlo, y cuando hayas terminado tu trabajo, al
<strong>desbloquear</strong> el documento, permitir�s que otros compa�eros
puedan bloquearlo y realizar sus modificaciones.</p>

<p><a id="L654"><img alt="Cooperation Menu"
src="../images/CooperationMenu.gif"></a></p>

<p>Por otro lado, si quieres saber si alg�n compa�ero ha bloqueado una p�gina
Web, puedes utilizar la opci�n <em>Ver propiedades del recurso</em> en el <a
href="#L654">men� Cooperaci�n</a> para ver todas las propiedades de la p�gina
o puedes configurar Amaya para que te informe autom�ticamente cuando se
bloquee la p�gina. para ello, tendr�s que abrir la caja de di�logo
<em>Cooperaci�n&gt;Preferencias</em>, marcar la opci�n de <em>Conocimiento
general</em> y escribir la direcci�n de tu carpeta compartida en el campo
<em>Lista de recursos WebDAV de usuario</em>
(<code>http://servidordav.miemmpresa.com/shared/</code>, como muestra la
Figura 2). Una vez lo hayas hecho, al abrir una p�gina bloqueada por un
compa�ero de la carpeta
<code>http://servidordev.miempresa.com/shared/</code>, Amaya te informar�.</p>

<p><img alt="Cooperation - Preferences "
src="../images/CooperationPreferences.gif"></p>

<h3>Opciones WebDAV en Amaya</h3>

<p>Estas opciones se encuentran en el men� Cooperaci�n &gt; Preferencias. Se
indican los valores por omisi�n:</p>
<dl>
  <dt><code>DAV_DEPTH= [ infinity | <strong>0</strong> ]</code></dt>
    <dd>Profundidad del bloqueo. Si la profundidad es infinita, el bloqueo de
      una colecci�n (carpeta) afectar� a todos sus componentes. En caso
      contrario el bloqueo afectar� �nicamente a la colecci�n, impidiendo al
      usuario que no conozca el bloqueo la creaci�n o eliminaci�n de
      componentes de la colecci�n.</dd>
  <dt><code>DAV_TIMEOUT= [ <strong>Infinite</strong> | Second-XXXX
  ]</code></dt>
    <dd>Duraci�n del bloqueo. El valor "infinita" significa que el bloqueo no
      termina nunca y "Second-xxxx" intentar� obtener un bloqueo durante XXXX
      segundos.</dd>
  <dt><code>DAV_LOCK_SCOPE= [ <strong>exclusive</strong> | shared
  ]</code></dt>
    <dd>�mbito del bloqueo.</dd>
  <dt><code>DAV_USER_URL= [ URL ]</code></dt>
    <dd>URL que identifica al usuario. Ejemplo: mailto:yomismo@miservidor.com
      o http://miservidor.com/mihomepage.html</dd>
  <dt><code>DAV_AWARENESS= [ yes
  |</code><code><strong>no</strong></code><code>]</code></dt>
    <dd>Indica si el usuario desea informaci�n b�sica sobre los recursos
      bloqueados.</dd>
  <dt><code>DAV_AWARENESS_ONEXIT=[ yes
  |</code><em><code></code></em><code><strong>no</strong></code><code>]</code></dt>
    <dd>Indica si el usuario quiere recibir informaci�n sobre sus propios
      bloqueos al abandonar un recurso.</dd>
  <dt><code>DAV_URLS= [ URL URL URL ... ]</code></dt>
    <dd>Lista de URLs de recursos empleados por el usuario como recursos
      WebDAV</dd>
</dl>

<h2>�C�mo compilar Amaya con funciones WebDAV?</h2>

<p>WebDAV es una caracter�stica opcional en Amaya. Para compilarla y poderla
utilizar, necesitar�s:</p>
<ul>
  <li>Libwww con soporte  WebDAV</li>
  <li>opciones de configuraci�n de Amaya</li>
  <li>un servidor WebDAV para poder utilizar estas funciones... <a
    href="http://www.w3.org/Jigsaw/">Jigsaw</a> y <a
    href="http://httpd.apache.org/">Apache</a> son algunos de los servidores
    web que soportan WebDAV.</li>
</ul>

<p>Una vez has comprobado el <em>cvs</em> de <a
href="http://www.w3.org/Library/">Libwww con soporte WebDAV</a>  y has
obtenido el <a href="http://www.w3.org/Amaya/User/cvs.html">c�digo fuente de
Amaya</a>, debes seguir los pasos siguientes en un sistema Linux/Unix (para
sistema Windows, consulta las p�ginas de <a
href="http://www.w3.org/Amaya/">Amaya</a> y <a
href="http://www.w3.org/Library/">Libwww</a>):</p>

<h4>En el directorio libwww:</h4>
<ul>
  <li>libtoolize -c -f</li>
  <li>perl config/winConfigure.pl</li>
  <li>aclocal; autoheader; automake; autoconf</li>
</ul>

<h4>En el directorio Amaya:</h4>
<ul>
  <li>autoconf</li>
  <li>mkdir LINUX-ELF (or GTK, or obj)</li>
  <li>cd LINUX-ELF</li>
  <li>../configure <strong>--with-dav</strong> ... (and all other options
    that you need)</li>
  <li>make</li>
</ul>
</div>
<hr>

<p><em>Escrito por <a href="mailto:mkirsch@terra.com.br">Manuele Kirsch
Pinheiro</a>, 13 de junio de 2002.</em></p>
</body>
</html>
