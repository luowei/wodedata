<?php
header('Content-type: application/x-apple-aspen-config; chatset=utf-8');
header('Content-Disposition: attachment; filename="shufa.mobileconfig"');

$mobileconfig = file_get_contents('shufa.mobileconfig');
echo $mobileconfig;
?>
