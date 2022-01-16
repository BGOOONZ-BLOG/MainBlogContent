<?xml version="1.0" encoding="windows-1251"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
  <title>&#xca;&#xee;&#xed;&#xf4;&#xe8;&#xe3;&#xf3;&#xf0;&#xe8;&#xf0;&#xee;&#xe2;&#xe0;&#xed;&#xe8;&#xe5;
  &#xe8;&#xea;&#xee;&#xed;&#xee;&#xea;
  &#xe0;&#xed;&#xed;&#xee;&#xf2;&#xe0;&#xf6;&#xe8;&#xe8;</title>
  <style type="text/css">

  </style>
  <meta name="GENERATOR" content="amaya 8.5, see http://www.w3.org/Amaya/" />
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="ru" lang="ru">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="replying_to_annotations.html.ru"
        accesskey="p"><img alt="����������" src="../../images/left.gif"
        /></a> <a href="../Annotations.html.ru" accesskey="t"><img
        alt="�����" src="../../images/up.gif" /></a> <a
        href="annotation_issues.html.ru" accesskey="n"><img alt="���������"
        src="../../images/right.gif" /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>���������������� ������ ���������</h1>

<h2>������������ ������������� ���� ������ ��������� (����� �������� ���
������ "������������ ������")</h2>

<p>��� � � ������ 6.2, ������ ������������ ��� ���������� ��������������
��������� � �������� ������������� ��������� � ����� ���� ��������
�������������.</p>

<p>� ������ 6.2 ������ ���������� ��������� � ���������� ��� �������� ����
���������. ��� ������� ��������������� ���� ���������, ������� RDF ��������,
�� ��������� ������ ��������� � ���������� ����� ����.</p>

<p>��������� ������ � ������ 6.2 ������� � ������������ ������ ��������� �
��������� ����:</p>

<table>
  <tbody>
    <tr>
      <td width="35"><img src="../../../amaya/advice.png" alt="�����" /></td>
      <td>Advice (�����)</td>
    </tr>
    <tr>
      <td width="35"><img src="../../../amaya/change.png" alt="���������"
      /></td>
      <td>Change (���������)</td>
    </tr>
    <tr>
      <td width="35"><img src="../../../amaya/annot.png" alt="�����������"
      /></td>
      <td>Comment (�����������)</td>
    </tr>
    <tr>
      <td width="35"><img src="../../../amaya/example.png" alt="������"
      /></td>
      <td>Example (������)</td>
    </tr>
    <tr>
      <td width="35"><img src="../../../amaya/explanation.png"
        alt="����������" /></td>
      <td>Explanation (����������)</td>
    </tr>
    <tr>
      <td width="35"><img src="../../../amaya/question.png" alt="������"
      /></td>
      <td>Question (������)</td>
    </tr>
    <tr>
      <td width="35"><img src="../../../amaya/seealso.png"
        alt="�������� �����" /></td>
      <td>SeeAlso (�������� �����)</td>
    </tr>
  </tbody>
</table>

<p>������ �������� ��� ���������� ������ � ����������� �������� <a
href="http://www.w3.org/2001/10/typeIcon#usesIcon">http://www.w3.org/2001/10/typeIcon#usesIcon</a>.
��������, ��� ����������� ������ ������� ���� � ���������:
///home/question-icon.jpg ��� ��������� ������� ��� <a
href="http://www.w3.org/2000/10/annotationType#Question">http://www.w3.org/2000/10/annotationType#Question</a>
�� ������ ������ ��������� RDF/XML �������� � ����, ������� Amaya ������ ���
��������:</p>
<pre>&lt;rdf:RDF

   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"

   xmlns:i = "http://www.w3.org/2001/10/typeIcon#"&gt;

&lt;rdf:Description rdf:about="http://www.w3.org/2000/10/annotationType#Question"&gt;

  &lt;i:usesIcon rdf:resource="file:///home/question-icon.jpg" /&gt;

&lt;/rdf:Description&gt;

&lt;/rdf:RDF&gt;</pre>

<p>���������� �������� �������� ����� RDF ��� ��������� ��� � Amaya ���
�������� ����� config/annot.schemas �� ���������� ���������� Amaya. ��� ����
����� ��������� ���� ���� � ����� �� �� ��� �����������, ����� ��
�������������� ����� ������ Amaya, �� ������ ����������� ����
config/annot.schemas � ���� ������������ �������� (home) ���������� Amaya;
~/.amaya/annot.schemas (�� Unix ��������) ���
/winnt/profiles/&lt;username&gt;/amaya/annot.schemas (�� Microsoft Windows
��������). �� ������ ��������� ��� ������ ����� RDF �������� � �����
annot.schemas. ��� ����� ��������� �������� �������� ����������� � �����,
����������� � ������������ Amaya.</p>

<p>������ 6.2 �������� � ���� ������ �����, ��������� "typeIcon.rdf", �������
��������� ������������ ������ ��� ������� ������������ ���� ��������� �
������������ ��� <a
href="http://www.w3.org/2000/10/annotationType#">http://www.w3.org/2000/10/annotationType#</a>.
��� ������������ � ������������� ������������� ��������, ����� �����
����������� typeIcon.rdf � ������ ���������� � ��� �������� ���. �����������
annot.schemas � ���� �������� (home) Amaya � �������� ����� � �����, �����
������� �� ��� �������������� ���� ����������� ������.</p>

<p>����� ��������� � ���������� ����������, �������������� ������ 6.2,
�������������� config/annot.schemas � �������������� ���������� Amaya �
�������� ������ ����������� ("#") � ������ �����, � � ����� ����� ��, ���
����� ��������� � typeIcon.rdf:</p>
<pre>#user-defined icons

#http://www.w3.org/2001/10/typeIcon# $THOTDIR/config/typeIcon.rdf</pre>

<p>Amaya ������������ JPEG, PNG, � GIF ����������� ������� �����������
������. � ������ 6.2 ������ URI ����� ���� ������ ������ URI; ��� ������, ���
������ ������ ���������� � ��������� ��� ����������� ���������� Amaya.
�������������� ��� ����������� ����� ��� ���������� URIs. ���� path name
����� ���������� � "$THOTDIR" ��� "$APP_HOME" �� ��� ������� � �����������
���������� Amaya ��� ������������ �������� (home) ����������� Amaya
��������� � pathname.</p>
</div>
</body>
</html>
