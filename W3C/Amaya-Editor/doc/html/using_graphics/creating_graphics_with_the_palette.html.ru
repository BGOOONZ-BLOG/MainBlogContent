<?xml version="1.0" encoding="windows-1251"?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
  <meta name="GENERATOR" content="amaya 8.5, see http://www.w3.org/Amaya/" />
  <title>�������� ������� � ������� �������
</title>
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="ru" lang="ru">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="working_with_graphics.html.ru"
        accesskey="p"><img alt="����������" src="../../images/left.gif"
        /></a> <a href="../SVG.html.ru" accesskey="t"><img alt="�����"
        src="../../images/up.gif" /></a> <a href="moving_graphics.html.ru"
        accesskey="n"><img alt="���������" src="../../images/right.gif"
        /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>�������� ������� � ������� �������</h1>

<p>��� �������� � ��������� ������ �������� SVG, ����������� ����� ����� � ��
����� ���� �� ��� ������ ��������, � �������� �� ������
<strong>�������</strong>. ������ <strong>�������</strong> (<img
src="../../images/Graph.gif" alt="Graphics button" />) ������� �������,
������� ��������� �� ������ ���� �� �� ������ ������
<strong>�����</strong>.</p>

<p>�� ������ ������ �������� ��������� ����������� ��������:</p>
<ul>
  <li>����� � SVG, <code>line</code>, <svg xmlns="http://www.w3.org/2000/svg"
         width="2cm" height="0.6cm">
      <line y1="3px" x1="0px" x2="17px" y2="20px" style="stroke: #B20000"
            stroke-width="1"/>
    </svg>
  </li>
  <li>������������� � SVG, <code>rec</code> ��� ��������� <code>rx</code> ���
    <code>ry</code>, <svg xmlns="http://www.w3.org/2000/svg" width="2cm"
         height="0.6cm">
      <rect x="6px" width="22px" height="18px"
            style="fill: #FFCB69; stroke: #0071FF" stroke-width="1"/>
    </svg>
  </li>
  <li>������������� � ������������ ������ � SVG, <code>rect</code>, <svg
         xmlns="http://www.w3.org/2000/svg" width="2cm" height="0.6cm">
      <rect rx="6px" stroke-width="1" width="23px" height="18px"
            style="fill: #E5E500; stroke: #4C00E5"/>
    </svg>
  </li>
  <li>���� � SVG, <code>circle</code>, <svg
         xmlns="http://www.w3.org/2000/svg" width="2cm" height="0.6cm">
      <circle cy="10px" cx="12px" r="10px"
              style="fill: #C1FFE9; stroke: #FF0000" stroke-width="1"/>
    </svg>
  </li>
  <li>������ � SVG, <code>ellipse</code>, <svg
         xmlns="http://www.w3.org/2000/svg" width="2cm" height="0.6cm">
      <ellipse cy="10px" cx="20px" rx="15px" ry="10px" style="fill: #B795FF"
            stroke-width="1"/>
    </svg>
  </li>
  <li>������� ����� � SVG, <code>polyline</code>,<svg
         xmlns="http://www.w3.org/2000/svg" width="2cm" height="0.6cm">
      <polyline points="0,16 19,0 33,16 51,6" transform="translate(4,0)"
                stroke-width="1" style="stroke: #0000B2; fill: #FFA069"/>
    </svg>
  </li>
  <li>������������� � SVG, <code>polygon</code>, <svg
         xmlns="http://www.w3.org/2000/svg" width="2cm" height="0.7cm">
      <polygon points="0,16 13,0 26,12 43,4 44,16 15,16 12,11"
               transform="translate(2,0)" stroke-width="1"
               style="fill: #C8FF95; stroke: #000000"/>
    </svg>
  </li>
  <li>�������� ������ � SVG, <code>path</code>, <svg
         xmlns="http://www.w3.org/2000/svg" width="2cm" height="0.6cm">
      <path stroke="blue" fill="none"
            d="M 0,16 C 0,15 4,6 9,7 C 13,7 12,16 16,16 C 20,15 24,1 22,0"
            style="stroke: #0071FF" stroke-width="2px"/>
    </svg>
  </li>
  <li>��������� ������ � SVG, <code>path</code>, <svg
         xmlns="http://www.w3.org/2000/svg" width="2cm" height="0.6cm">
      <path stroke="black" fill="none"
            d="M 14,4 C 11,4 8,0 6,1 C 3,1 1,4 1,7 C 0,9 2,12 5,14 C 7,15 13,14 16,14 C 17,13 21,12 23,11 C 24,9 29,7 29,4 C 28,1 24,0 22,0 C 19,0 16,3 14,4 Z"
            style="fill: #FFE9C1; stroke: #B20000"/>
    </svg>
  </li>
</ul>
<ul>
  <li>��������� HTML �������� � SVG, <code>foreignObject</code>,<svg
         xmlns="http://www.w3.org/2000/svg" width="6cm" height="45px">
      <rect y="0" x="27px" width="140px" height="45px" style="fill: #C1FFFF"
            stroke-width="1"/>
      <foreignObject width="140px" y="0" x="20px">

        <div xmlns="http://www.w3.org/1999/xhtml">
        <ul>
          <li>������ �����</li>
          <li>������ �����</li>
        </ul>
        </div>
      </foreignObject>
    </svg>
  </li>
  <li>����� SVG � SVG, <code>text</code><svg
         xmlns="http://www.w3.org/2000/svg" width="9.5cm" height="1.2cm">
      <text y="33px" x="13px"
            style="font-family: helvetica; font-size: 12pt; fill: #0000B2">����������
        ������ SVG
      </text>
    </svg>
  </li>
</ul>

<h2>����� ����� �� �������</h2>

<p>����� �� ��������� ����� �� ������� � ��������� � � HTML ���������
���������, Amaya ������ ����� SVG ������� ������ � ������ �������� ������ �
��������� ��������� ����� � ���� ����� SVG. Amaya ���������� ������� SVG ���
����� ����� �����������. ��� ����������� ����������� �������, �� ������
������ ������� ��� ����� �����������, � ��� ��� ����������� ���������������
�������� ���.</p>

<p>����� ��������� ������� �������� ��������� SVG, ����� ����� ��������� �
�������� ������� SVG. ����� ����� ����� ��������� ������� � ��������
��������� �� ���������� �����.</p>

<p>��� �������� ����� ��������� ��������� ��������:</p>
<ul>
  <li>��� �������� ��������������, ������� ������� ����� ����� � ����� ����,
    ����� ����� ������ ����. ��������� ���������� ������, ����������� �����
    ����� � ��������������� ���� � ��������� ������. ������ ����� ������.
    <p></p>
  </li>
  <li>��� �������� ����� ��� �������, ������� ������� ����� ����� ������,
    ����� ����� ������ ����. ��������� ���������� ������, ����������� �����
    ����� ������ �/��� �� ��������� ����� � ��������� ������. ������ �����
    ������.
    <p></p>
  </li>
  <li>��� �������� ������� ����� � ��������������, ������� ������ ����� �
    ��������������� �������, ������ ����� ������� ����. ��� ��������
    ��������� �����, �������� ������� ��� ������ �������.</li>
</ul>

<h2>������� �����������</h2>

<p>�� ������ �������� ����������� � �������� ������� SVG. �������� �����
<strong>����������� (img)</strong> �� ���� <strong>XHTML</strong> ���
�������� �� ������ <strong>�������� �����������</strong> �� ������ ������,
�� ��� ����������� ����� �� ������� ��� � � HTML.</p>

<p>��� ������� ��������������� ��������� � ������� SVG, �������� �� �������
<strong>����������</strong>, ���� ��������� ��������� � �������� SVG. Amaya
����������� ��������� SVG <code>foreignObject</code> ������ MathML.</p>

<h2>�������� �����:</h2>
<ul>
  <li><a href="working_with_graphics.html.ru">������ � ��������</a></li>
  <li><a href="../Math.html.ru">�������������� ����������</a></li>
  <li><a
    href="../editing_mathematics/the_math_palette_and_the_types.html.ru">�������
    ���������� � ���� ����������</a></li>
</ul>

<p>&nbsp;</p>
</div>
</body>
</html>
