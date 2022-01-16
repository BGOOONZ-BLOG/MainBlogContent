<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=windows-1251">
  <title>������ ���������� � ���� ���������� </title>
  <meta name="GENERATOR" content="amaya 9.3, see http://www.w3.org/Amaya/">
  <link href="../style.css" rel="stylesheet" type="text/css">
</head>

<body lang="ru">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home"> <img alt="Amaya"
        src="../../images/amaya.gif"></td>
      <td><p align="right"><a
        href="about_entering_math_constructs_using_the_keyboard.html.ru"
        accesskey="p"><img alt="����������" src="../../images/left.gif"></a>
        <a href="../Math.html.ru" accesskey="t"><img alt="�����"
        src="../../images/up.gif"></a> <a
        href="about_entering_math_characters.html.ru" accesskey="n"><img
        alt="���������" src="../../images/right.gif"></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>������ ���������� � ���� ����������</h1>

<p>��� �������� � ��������� ��������������� ���������, ����������� ������
���� � �� ������� ���� �� ������ �������� ���������, � �������� �� ������
<strong>����������</strong>, ��� �������� ������� <strong>����������</strong>
�� ���� <strong>Xml</strong>.</p>

<h2>������� �������</h2>

<p>�������������� ��������� ����� ���� ��������� � �������� � ������� �������
<strong>����������</strong> �� ���� <strong>XML</strong>, ��� ������
��������� �� ������� <strong>����������</strong>.</p>

<p>ٸ������ �� ������ <strong>����������</strong> <img alt="Math Button"
src="../../images/Math.gif"> � ������ ������������ �������� �������
<strong>����������</strong>. �������� �������, ������� �� ������
<strong>�����</strong>.</p>

<p>�����, �� ������ ������� ���� ���������� ������� �� ������
<strong>����������</strong> �� ���� <strong>XML</strong>.</p>

<h2>���� ���������� � ������� �������</h2>

<p>� � ������� � � ���� <strong>����������</strong>, ������ ������� ��������
����� <strong>����� �������</strong>, ����������� ��� ��������� �����
�������, ����� ������ ��������� � HTML ��� SVG ��������, �� �� � ��������
MathML ��������.</p>

<p>�����, ���� <strong>����������</strong> �������� �������� ������� ��
������������ � �������. ��� ������ �������� � ����: ������� �����
(<code>mtext</code>), ������������� (<code>mi</code>), �����
(<code>mn</code>), �������� (<code>mo</code>). ��� ������� ����� �������� ���
�������� �������� ��� ������������������ ���������.</p>

<p>����� ������ (<code>&amp;xxx;</code>) ��������� ��� ������� ������
����������� ��� ����� � ����������. �� ������� ���������� ���� ��� �� ������
������ ��� ������� (�������� alpha �� ���������� ��������).</p>

<p>��������� ����� ���� ��� ������� <strong>����������</strong> ��������� ���
��������� ����� ����������� � �������� �������. ���� ����� ����� ��������� ��
� �������, Amaya ������� ������ �������������� ������� ����� ������� �����
�����������. �� ������ ������ �������� ��������� �����������:</p>
<ul>
  <li>������ � �������, <code>mroot</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mroot>
        <mrow>
          <mi>x</mi>
          <mo>+</mo>
          <mn>1</mn>
        </mrow>
        <mn>3</mn>
      </mroot>
    </math></li>
  <li>���������� ������, <code>msqrt</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <msqrt>
        <mrow>
          <mi>x</mi>
          <mo>+</mo>
          <mn>1</mn>
        </mrow>
      </msqrt>
    </math></li>
  <li>��������, <code>menclose</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <menclose>
        <mn>1234</mn>
      </menclose>
    </math></li>
  <li>�����, <code>mfrac</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mfrac>
        <mn>1</mn>
        <mrow>
          <mi>x</mi>
          <mo>+</mo>
          <mn>1</mn>
        </mrow>
      </mfrac>
    </math></li>
  <li>��������� � ������ � ������� ��������, <code>msubsup</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <msubsup>
        <mi>x</mi>
        <mrow>
          <mi>i</mi>
          <mo>+</mo>
          <mn>1</mn>
        </mrow>
        <mi>n</mi>
      </msubsup>
    </math>��� <math xmlns="http://www.w3.org/1998/Math/MathML">
      <mrow>
        <msubsup>
          <mo largeop="true">&#x222b;</mo>
          <mn>0</mn>
          <mo>&#x221e;</mo>
        </msubsup>
        <mo>�</mo>
      </mrow>
    </math></li>
  <li>��������� � ������ ��������, <code>msub</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <msub>
        <mi>x</mi>
        <mi>i</mi>
      </msub>
    </math></li>
  <li>��������� � ������� ��������, <code>msup</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <msup>
        <mi>x</mi>
        <mi>n</mi>
      </msup>
    </math></li>
  <li>��������� � ������������� � ������������� ��������,
    <code>munderover</code>: <math xmlns="http://www.w3.org/1998/Math/MathML">
      <munderover>
        <mo movablelimits="false">&#x2211;</mo>
        <mrow>
          <mi>i</mi>
          <mo>=</mo>
          <mn>1</mn>
        </mrow>
        <mi>n</mi>
      </munderover>
    </math></li>
  <li>��������� � ������������� ��������, <code>munder</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <munder>
        <mi>x</mi>
        <mo>&#xaf;</mo>
      </munder>
    </math></li>
  <li>��������� � ������������� ��������, <code>mover</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mrow>
        <mi>x</mi>
        <mover>
          <mo>&#x2192;</mo>
          <mtext>maps to</mtext>
        </mover>
        <mi>y</mi>
      </mrow>
    </math></li>
  <li>��������� � �������� ��������, <code>mrow</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mrow>
        <mo fence="true">(</mo>
        <mrow>
          <mi>a</mi>
          <mo>+</mo>
          <mi>b</mi>
        </mrow>
        <mo fence="true">)</mo>
      </mrow>
    </math></li>
  <li>��������� � �������������� � ��������������� ���������,
    <code>mmultiscripts</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mmultiscripts>
        <mi>X</mi>
        <mi>i</mi>
        <mi>j</mi>
        <mprescripts/>
        <mi>k</mi>
        <mi>l</mi>
      </mmultiscripts>
    </math></li>
  <li>������� ��� �������, <code>mtable</code>: <math
    xmlns="http://www.w3.org/1998/Math/MathML">
      <mtable>
        <mtr>
          <mtd>
            <mi>a</mi>
          </mtd>
          <mtd>
            <mi>b</mi>
          </mtd>
        </mtr>
        <mtr>
          <mtd>
            <mi>c</mi>
          </mtd>
          <mtd>
            <mi>d</mi>
          </mtd>
        </mtr>
      </mtable>
    </math></li>
</ul>

<h2>�������� �����:</h2>
<ul>
  <li><a href="editing_math_expressions.html.ru">��������������
  ����������</a></li>
  <li><a href="about_entering_math_characters.html.ru">��������
    �������������� ���������</a></li>
</ul>
</div>
</body>
</html>
