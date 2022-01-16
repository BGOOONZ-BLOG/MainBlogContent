<?php

include_once("lib/simpleCachedCurl.inc.php");

function curlurl($url) {

  $curlopts = array(
    CURLOPT_TIMEOUT => 2,
    CURLOPT_RETURNTRANSFER => 1,
    CURLOPT_FOLLOWLOCATION => 1,
    CURLOPT_HEADER => 0,
    CURLOPT_USERAGENT => 'Mozilla'
  );

  return simpleCachedCurl($url, 60, $curlopts);
}

//echo 'http://s.wordpress.com/mshots/v1/'.urlencode($_GET['url']).'?w='.$_GET['w'];

$ret = curlurl('http://s.wordpress.com/mshots/v1/'.urlencode($_GET['url']).'?w='.$_GET['w']);

//var_dump($ret);

header('Content-Type: '.$ret['type']);
echo $ret['data'];