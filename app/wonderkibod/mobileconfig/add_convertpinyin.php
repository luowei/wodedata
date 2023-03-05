<?php
header('Content-type: application/x-apple-aspen-config; chatset=utf-8');
header('Content-Disposition: attachment; filename="convertpinyin.mobileconfig"');

$mobileconfig = file_get_contents('convertpinyin.mobileconfig');
echo $mobileconfig;
?>
