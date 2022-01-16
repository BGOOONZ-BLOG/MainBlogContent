<?xml version="1.0" encoding="windows-1251"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
  <title>� ���������� ������������ � ����� ����������</title>
  <style type="text/css">
  </style>
  <meta name="GENERATOR" content="amaya 8.6, see http://www.w3.org/Amaya/" />
  <link href="../style.css" rel="stylesheet" type="text/css" />
</head>

<body xml:lang="ru" lang="ru">

<table border="0" width="100%" summary="toc">
  <tbody>
    <tr>
      <td><img alt="W3C" src="../../images/w3c_home" /> <img alt="Amaya"
        src="../../images/amaya.gif" /></td>
      <td><p align="right"><a href="configuring_amaya.html.ru"
        accesskey="p"><img alt="����������" src="../../images/left.gif"
        /></a> <a href="../Configure.htm.ru" accesskey="t"><img alt="�����"
        src="../../images/up.gif" /></a> <a href="menu_preferences.html.ru"
        accesskey="n"><img alt="���������" src="../../images/right.gif"
        /></a></p>
      </td>
    </tr>
  </tbody>
</table>

<div id="page_body">
<h1>� ���������� ������������ � ����� ����������</h1>

<p>Amaya ���������� ��� �������� �� ��������� ���������� ��� ��������
���������� � ������������.</p>

<h2>���������� ������������</h2>

<p>����������� �������� �� ��������� ������� � ��� ���������� ���������
�������� � ���������� ������������ Amaya. ��� ���������� �������� ����� ��
������������� ���������� ���������� Amaya (��� Unix, �� ��������� ���
<code>Amaya/config</code>; ��� Windows, �������������� ���� ����������
�������� � �������������� �������).</p>

<h2>�������� ���������� Amaya</h2>

<p>Amaya ������ ���������������� ��������� � ������ ����� ������������ �
���������� ���������� AmayaHome. Ÿ �������������� ����� ���� �������������
������������� ������ � ������� ���������� ���������
<code>AMAYA_USER_HOME</code>. � ��������� ������, Amaya ����������
�������������� ���������� �������� �� ���������.</p>

<p>������������� ������� ���������� ������� ���� ���������� (�������� ��
���������) ��� ��������� ����������:</p>

<table border="1" cellspacing="0">
  <tbody>
    <tr>
      <td valign="top"
      style="border:solid .5pt;   padding:0in 5.4pt 0in 5.4pt"><p
        class="TableHead"><b>�����������</b></p>
      </td>
      <td valign="top"
      style="border:solid .5pt;   border-left:none;padding:0in 5.4pt 0in 5.4pt"><p
        class="TableHead"><b>�������������� ���������� AmayaHome</b></p>
      </td>
    </tr>
    <tr>
      <td valign="top"
      style="border:solid .5pt;   border-top:none;padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText">Unix</p>
      </td>
      <td valign="top"
      style="border-top:none;border-left:   none;border-bottom:solid .5pt;border-right:solid .5pt;   padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText"><code>$HOME/.amaya</code></p>
      </td>
    </tr>
    <tr>
      <td valign="top"
      style="border:solid .5pt;   border-top:none;padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText">Windows 95/ Windows 98</p>
      </td>
      <td valign="top"
      style="border-top:none;border-left:   none;border-bottom:solid .5pt;border-right:solid .5pt;   padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText"><code>AMAYA-INSTALL-DIR\users\username</code> ���,
        ���� ������������ �� ������ � Windows,
        <code>AMAYA-INSTALL-DIR\users\default</code></p>
      </td>
    </tr>
    <tr>
      <td valign="top"
      style="border:solid .5pt;   border-top:none;padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText">Windows NT/XP</p>
      </td>
      <td valign="top"
      style="border-top:none;border-left:   none;border-bottom:solid .5pt;border-right:solid .5pt;   padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText"><code>$HOMEDRIVE\$HOMEPATH\amaya</code><br />
        �� ��������� c:\Documents � Settings\$user_name\amaya</p>
      </td>
    </tr>
  </tbody>
</table>

<p>��� ��������� ����� ������ Amaya, ������ ���������� �����������. ��� �����
��������� ��������� �����:</p>
<ul>
  <li><strong>thot.rc</strong>: �������� ���������������� ���������,
    ���������� ����� ������� <strong>���������</strong> �� ����
    <strong>�����������</strong>.
    <p></p>
  </li>
  <li><strong>amaya.keyboard</strong> (Unix) ��� <strong>amaya.kb</strong>
    (Windows): ���������� ������ ���������� ������ Amaya.
    <p></p>
  </li>
  <li><strong>amaya.css</strong>: �������� ���������������� �����
    ��������������.
    <p></p>
  </li>
  <li><strong>dictionary.DCT</strong>: Amaya ������������� ������������
    �������� ������������ (������� ���� �� ��������������). �� ���������,
    �������� ������������ �������� � ����� ���������: ���������� �
    ����������� (�� ������ ��������� ������� � W3C ��������). ���� ��
    �������� ���������������� ����� �����, �������� ������������ ������� �
    ������� ��� ������������ �������.</li>
</ul>

<p class="Note"><strong>����������</strong>:<br />
����� <code>amaya.keyboard</code>, <code>amaya.kb</code>, �
<code>amaya.css</code> ����������� �� ����� ������� ���������. ���� ��
�������� ��, �� ������ ����� � ������������� Amaya ����� ���� ��������� ����
������ �������� � ����.</p>

<h2>���������� AmayaTemp</h2>

<p>��� ��������� Amaya ��������� ����� �������� � ���������� ����������
AmayaTemp. ������������� ������� ���������� �������������� ���� ����������
��� ��������� ����������:</p>

<table border="1" cellspacing="0">
  <tbody>
    <tr>
      <td valign="top"
      style="border:solid .5pt;   padding:0in 5.4pt 0in 5.4pt"><p
        class="TableHead"><b>�����������</b></p>
      </td>
      <td valign="top"
      style="border:solid .5pt;   border-left:none;padding:0in 5.4pt 0in 5.4pt"><p
        class="TableHead"><b>���������� AmayaTemp</b></p>
      </td>
    </tr>
    <tr>
      <td valign="top"
      style="border:solid .5pt;   border-top:none;padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText">Unix</p>
      </td>
      <td valign="top"
      style="border-top:none;border-left:   none;border-bottom:solid .5pt;border-right:solid .5pt;   padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText"><code>$HOME/.amaya</code></p>
      </td>
    </tr>
    <tr>
      <td valign="top"
      style="border:solid .5pt;   border-top:none;padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText">Windows 9x</p>
      </td>
      <td valign="top"
      style="border-top:none;border-left:   none;border-bottom:solid .5pt;border-right:solid .5pt;   padding:0in 5.4pt 0in 5.4pt"><p
        class="TableText"><code>c:\temp\amaya</code> (�������� �������� ��
        ���������)</p>
      </td>
    </tr>
    <tr>
      <td>Window XP</td>
      <td>$HOMEDRIVE\$HOMEPATH\Local Settings\Temp\amaya<br />
        �� ��������� c:\Documents � Settings\$user_name\Local
        Settings\Temp\amaya</td>
    </tr>
  </tbody>
</table>

<p>Amaya ������ ����� � ���� ���������� ��� ��������� �������� ����������
��� ��� ���������� ���������. � ���� ���������� ����� �������� � ���. ��
������ �������� ������������� ���������� AmayaTemp � ���������� �����������,
��������� ��������� �������� � ��� (<span class="Link0">��������
<strong>��������� &gt; ��������</strong> ��� <strong>��������� &gt;
���</strong> �� ���� <strong>�����������</strong></span>).</p>

<p>Amaya ������ �������� ������� ��������� �� ��������� �����. ��� �� �����,
���� Amaya "�����", ��������� ����� �� ����� �������. ��� ����������� �������
Amaya ������� �������� ��������� ����� �������� �� �����.</p>
</div>
</body>
</html>
