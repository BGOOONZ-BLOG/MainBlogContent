<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
  <title>� ����� �������������� ��������
</title>
  <meta name="GENERATOR" content="amaya 8.5, see http://www.w3.org/Amaya/">
  <link href="../style.css" rel="stylesheet" type="text/css">
</head>

<body lang="ru">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home"> <img alt="Amaya"
        src="../../images/amaya.gif"></td>
      <td><p align="right"><a href="the_math_palette_and_the_types.html.ru"
        accesskey="p"><img alt="����������" src="../../images/left.gif"></a>
        <a href="../Math.html.ru" accesskey="t"><img alt="�����"
        src="../../images/up.gif"></a> <a
        href="editing_math_expressions.html.ru" accesskey="n"><img
        alt="���������" src="../../images/right.gif"></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>� ����� �������������� ��������</h1>

<p>����� �� ������� �������� ������ � ������� MathML, Amaya ��������� ������
������ � ������������� ���������� �������� <span class="code"><span
style="font-size:11.0pt;font-family:&#34;Courier New&#34;;">mo</span></span>
(��������), <span class="code"><span
style="font-size:11.0pt;font-family:&#34;Courier New&#34;;">mn</span></span>
(�����), <span class="code"><span
style="font-size:11.0pt;font-family:&#34;Courier New&#34;;">mi</span></span>
(�������������), � <span class="code"><span
style="font-size:11.0pt;font-family:&#34;Courier New&#34;;">mtext</span></span>.</p>

<p>��������, ��� ����� ������� <code>x=2a+b</code>:</p>
<ol>
  <li>���� �� ���������� ��� ��������������� ���������, ��������
    <strong>����� ������� (math)</strong> �� ���� <strong>XML</strong>.
    <p></p>
  </li>
  <li>������� ��������� ������������������ �� 6 ��������:
  <code>x=2a+b</code></li>
</ol>

<p>����������� ��� ��������� ��� ��������� ������������ ���������,
��������������� Amaya:</p>

<p><code>&lt;mi&gt;x&lt;/mi&gt;&lt;mo&gt;=&lt;/mo&gt;&lt;mn&gt;2&lt;/mn&gt;&lt;mi&gt;a&lt;/mi&gt;&lt;mo&gt;+&lt;/mo&gt;&lt;mi&gt;b&lt;/mi&gt;</code></p>

<p>���� ��������� �� ��������� � ��������, �������� ������� � ������� ���
��������� ����������� � �������� �� ��� � ������� ����� �� ������: �������
����� (<code>mtext</code>), ������������� (<code>mi</code>), ��� �����
(<code>mnmo</code>) �� ������� <strong>�������� ��������</strong> � ����
<strong>XML</strong>.</p>

<h2>��������</h2>

<p>Amaya, � �������� �������������� ���������, ��������� �� ����������, �� �
��������� �������, ��� ����� ������������� �������� ��������� ��������������
������������. ����������� ������ � ������� ������� ��������� � �������� ��
���� <strong>XML</strong> ������� <strong>�������� ��������</strong> � � ��
����� <strong>������������ (mspace)</strong>. ��� ������� �������� ��
��������� �������������� ��������. �����, �� ������ �������� ��� �������
<strong>width-������</strong> ��� ������������� ��� ������� ��� ��, �� ������
�������� ������ �������� (������, �������, ���������� �����) ��� ���������
��������� �����. ��� ����� ��������� ���������� ���������� � <a
href="http://www.w3.org/TR/MathML2/chapter3.html#N9197">������������
MathML</a>.</p>

<h2>������ ������</h2>

<p>��� ����� ������ ��� � ��������� ���������:</p>

<p>When entering brackets as in the following expression:</p>

<p><math xmlns="http://www.w3.org/1998/Math/MathML">
  <mi>f</mi>
  <mrow>
    <mo>(</mo>
    <mi>x</mi>
    <mo>)</mo>
  </mrow>
  <mo>=</mo>
  <mfrac>
    <mn>1</mn>
    <mi>x</mi>
  </mfrac>
</math></p>

<p>������� ������������������ <code>f(x)=</code> &#xfd;�� ������� �
����������:</p>

<p><math xmlns="http://www.w3.org/1998/Math/MathML">
  <mi>f</mi>
  <mo>(</mo>
  <mi>x</mi>
  <mo>)</mo>
  <mo>=</mo>
  <mfrac>
    <mn>1</mn>
    <mi>x</mi>
  </mfrac>
</math></p>

</div>
</body>
</html>
