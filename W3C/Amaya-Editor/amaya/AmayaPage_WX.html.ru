<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 plus MathML 2.0 plus SVG 1.1//EN"
      "http://www.w3.org/2002/04/xhtml-math-svg/xhtml-math-svg.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
 xmlns:svg="http://www.w3.org/2000/svg">
<head>
  <meta http-equiv="content-type"
  content="application/xhtml+xml; charset=UTF-8" />
  <title>Добро пожаловать в Amaya</title>
  <meta name="generator" content="amaya, see http://www.w3.org/Amaya/" />
  <link href="amaya.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="ru">

<div id="header">
<ul id="links">
  <li><a href="http://www.w3.org/Amaya">Web Site</a></li>
  <li><a href="http://www.w3.org">W3C</a></li>
  <li><a href="http://wam.inrialpes.fr/index.en.html">INRIA</a></li>
  <li><a href="http://palette.ercim.org/">Palette</a></li>
</ul>

<h1 id="title">Amaya [11]</h1>
</div>

<div id="logo">
<svg:svg height="150px" width="230px">
  <svg:title>Amaya logo</svg:title>
  <svg:g transform="translate(143,98)">
    <svg:ellipse rx="66px" ry="45px"
		 style="fill: #edf3ff; stroke: #edf3ff">
      <svg:animateTransform attributeName="transform" attributeType="XML"
			    type="scale" from="0" to="1" begin="0s"
			    dur="6s" fill="freeze"/>
    </svg:ellipse>
  </svg:g>
  <svg:g transform="rotate(-30,100,150)">
    <svg:polygon points="0,117 66,0 21,117" transform="translate(49,22)"
             style="fill: #B27700; stroke: #D9E500"/>
    <svg:polygon points="0,0 9,30 27,41 21,14 12,3"
             transform="translate(117,25)"
             style="fill: #00B200; stroke: #00E500"/>
    <svg:polygon points="0,6 29,0 56,8 32,15 13,19"
             transform="translate(95,76)"
             style="fill: #00B200; stroke: #00E500"/>
    <svg:animateTransform attributeName="transform" attributeType="XML"
                      type="rotate" from="-30,100,150" to="-20,100,150"
                      begin="2.5s" dur="0.3s" fill="freeze"/>
    <svg:animateTransform attributeName="transform" attributeType="XML"
                      type="rotate" from="-20,100,150" to="-10,100,150"
                      begin="2.8s" dur="0.2s" fill="freeze"/>
    <svg:animateTransform attributeName="transform" attributeType="XML"
                      type="rotate" from="-10,100,150" to="0,100,150"
                      begin="3s" dur="0.1s" fill="freeze"/>
  </svg:g>
  <svg:g transform="translate(118,110)">
    <svg:g>
      <svg:polygon points="3,0 5,16 0,16" transform="translate(25,-20)"
               style="stroke: #E50000; fill: #E50000"/>
      <svg:polygon
               points="0,13 10,0 20,1 23,10 29,2 40,1 42,9 45,17 32,17 33,11 30,11 23,15 18,15 12,7 8,7 8,13"
               stroke="#E50000" fill="#FF9595"/>
      <!-- M oscillations -->
      <!-- Maybe rotation center is not correct... (30,-22)  -->
      <svg:animateTransform attributeName="transform" attributeType="XML"
                        type="rotate" from="0,30,-22" to="-30,30,-22"
                        begin="3s" dur="0.2s" fill="freeze"/>
      <svg:animateTransform attributeName="transform" attributeType="XML"
                        type="rotate" from="-30,30,-22" to="25,30,-22"
                        begin="3.2s" dur="0.4s" fill="freeze"/>
      <svg:animateTransform attributeName="transform" attributeType="XML"
                        type="rotate" from="25,30,-22" to="-20,30,-22"
                        begin="3.6s" dur="0.6s" fill="freeze"/>
      <svg:animateTransform attributeName="transform" attributeType="XML"
                        type="rotate" from="-20,30,-22" to="15,30,-22"
                        begin="4.2s" dur="0.8s" fill="freeze"/>
      <svg:animateTransform attributeName="transform" attributeType="XML"
                        type="rotate" from="15,30,-22" to="-10,30,-22"
                        begin="5s" dur="1s" fill="freeze"/>
      <svg:animateTransform attributeName="transform" attributeType="XML"
                        type="rotate" from="-10,30,-22" to="0,30,-22"
                        begin="6s" dur="0.6s" fill="freeze"/>
    </svg:g>
    <!-- M scale -->
    <svg:animateTransform attributeName="transform" attributeType="XML"
                      type="scale" from=".1" to="1" additive="sum" begin="0s"
                      dur="3s" fill="freeze"/>
    <!-- M translation -->
    <svg:animateTransform attributeName="transform" attributeType="XML"
                      type="translate" from="0,0" to="118,110" begin="0s"
                      dur="3s" fill="freeze"/>
  </svg:g>
</svg:svg>
</div>

<div id="intro" class="section">
<p>Amaya является веб клиентом и может
использоваться и как браузер и как
инструмент авторского редактирования. Он
создан <a href="http://www.w3.org/">W3C</a> и <a
href="http://www.inria.fr/">INRIA</a> главной целью которых
является демонстрация новых веб
технологий и помощь пользователям в
создании правильных веб страниц.</p>

<p>С помощью Amaya, вы можете работать со
сложными веб страницами, таблицами, и
большинством дополнительных возможностей,
предоставляемых <acronym
title="Hypertext Markup Language">XHTML</acronym>. Вы можете
создавать и редактировать сложные <a
href="../doc/WX/Math.html">математические выражения</a>
в веб страницах. Используя каскадные
таблицы стилей, вы можете стильно
оформлять свои документы.</p>
</div>

<div class="body">

<div class="column">

<div class="section">
<h2>Main news</h2>

<p>News from version 10:</p>
<ul>
  <li>Possibility to create and edit document templates from document
  skeletons</li>
  <li>More facilities to edit template instances</li>
  <li>The first version of an integrated editor for SVG graphic schemas</li>
  <li>The support of semantic information within web pages (RDFa)</li>
  <li>Direct resizing of images</li>
</ul>
</div>

<div class="section">
<h2>Advanced features</h2>

<p>Embedded MathML and SVG:</p>

<div id="mathml_svg">
<svg:svg height="250" width="250">
  <svg:g transform="rotate(-47.78,198.421,64.1654) scale(1) ">
    <svg:rect style="stroke:#50ff50;stroke-width:3px;fill:#aaffaa;" width="200"
          height="100"/>
    <svg:path
          d="M 44.727272,21.090909 L 36.359858,29.587325 L 40.292606,40.845041 L 28.432844,39.600562 L 22.083235,49.69438 L 15.661767,39.646124 L 3.8111859,40.975193 L 7.6635087,29.689702 L -0.76431515,21.253205 L 10.460921,17.228684 L 11.802177,5.3794762 L 21.947495,11.646471 L 32.047838,5.3072476 L 33.473606,17.146584 L 44.727272,21.090909 z "
          transform="translate(150,40)"
          style="stroke:#ffaa00;stroke-width:1px;fill:#ffff00;"/>
    <svg:path
          d="M 50.363636,43.81818 C 50.090154,43.025081 51.297791,43.058245 51.681818,43.363636 C 52.722508,44.191224 52.181922,45.777285 51.272725,46.454544 C 49.646384,47.666002 47.379434,46.796331 46.40909,45.181813 C 44.98507,42.812444 46.220462,39.785248 48.545459,38.545452 C 51.644314,36.892997 55.454153,38.507192 56.954547,41.545458 C 58.842639,45.368806 56.844001,49.970617 53.090902,51.727273 C 48.545397,53.854818 43.146815,51.468849 41.136361,46.999991 C 38.767111,41.733596 41.542078,35.535434 46.727281,33.272723 C 52.713804,30.660333 59.713334,33.825342 62.227275,39.727281 C 65.083776,46.433439 61.528027,54.235551 54.909079,57.000002 C 47.483621,60.101298 38.878068,56.15432 35.863632,48.818168 C 32.517038,40.673649 36.8556,31.26402 44.909104,27.999994"
          transform="translate(-5,30)"
          style="fill:none;stroke:#000000;stroke-width:1px;"/>
    <svg:switch>
      <svg:foreignObject width="200" height="100">
        <math xmlns="http://www.w3.org/1998/Math/MathML">
          <mstyle mathcolor="#000080;">
            <mrow>
              <mi>Γ</mi>
              <mo>⁡</mo>
              <mrow>
                <mo>(</mo>
                <mi>x</mi>
                <mo>)</mo>
              </mrow>
            </mrow>
            <mo>=</mo>
            <mrow>
              <msubsup>
                <mo>∫</mo>
                <mn>0</mn>
                <mrow>
                  <mo>+</mo>
                  <mi>∞</mi>
                </mrow>
              </msubsup>
              <msup>
                <mi>t</mi>
                <mrow>
                  <mi>x</mi>
                  <mo>−</mo>
                  <mn>1</mn>
                </mrow>
              </msup>
              <msup>
                <mi>ⅇ</mi>
                <mrow>
                  <mo>−</mo>
                  <mi>t</mi>
                </mrow>
              </msup>
              <mrow>
                <mo>ⅆ</mo>
                <mi>t</mi>
              </mrow>
            </mrow>
          </mstyle>
        </math></svg:foreignObject>
    </svg:switch>
    <svg:ellipse cx="18px" cy="8px" rx="18px" ry="8px"
          style="opacity: 1; stroke: #ff0000; stroke-opacity: 1; stroke-width: 3; fill: #ffaaaa; fill-opacity: 1;"
          transform="translate(83,65) "/>
  </svg:g>
</svg:svg>
</div>
</div>
</div>

<div class="main">

<div class="section">
<h2>А вы знаете?</h2>
<dl>
  <dt>Amaya является редактором структуры</dt>
    <dd>С помощью кнопки F2 вы можете выбирать
      вложенные структуры, а функции
      редактирования (копировать, вставить,
      атрибуты, и прочее.) могут применяться к
      этим самым элементам структуры.</dd>
  <dt>Документ может редактироваться через
  синхронизируемые виды</dt>
    <dd>Из меню Вид можно открывать вид
      Структура, вид Исходный код и прочее.
      Щелчок по основанию красной линии
      открывает или закрывает второй вид.</dd>
  <dt>Документ может публиковаться
  непосредственно на сервере</dt>
    <dd>С http методом PUT вы можете записывать
      прямо на сервер, в соответствии с вашими
      правами доступа.</dd>
  <dt>Ссылки могут создаваться простым
  щелчком</dt>
    <dd>Для создания ссылки вы можете щёлкнуть
      прямо на цели (используя для показа
      доступных целей пункт меню Показать
      цель).</dd>
  <dt>Amaya предоставляет дополнительные
  команды</dt>
    <dd>Такие как: нумерация разделов,
      генерирование оглавления, вставка
      штампа времени, преобразование
      структуры.</dd>
</dl>
</div>
</div>
</div>

<p class="bottom section">Разрешение на использование,
копирование, изменение и распространение
этого программного обеспечения и его
документации для любых целей без оплаты и
любых других лицензионных платежей, может
быть получено при условии что полный текст
<a href="http://www.w3.org/Consortium/Legal/copyright-software.html"><acronym
title="Massachusetts Institute of Technology">MIT</acronym> и права
собствености INRIA</a> будут находиться во
<strong>всех</strong> копиях этого программного
обеспечения и документации или части всего
этого, включая изменения которые вы
сделаете.</p>

<p></p>
</body>
</html>
