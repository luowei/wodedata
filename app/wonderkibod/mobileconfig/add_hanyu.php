<?php
header('Content-type: application/x-apple-aspen-config; chatset=utf-8');
header('Content-Disposition: attachment; filename="hanyu.mobileconfig"');

$mobileconfig = file_get_contents('hanyu.mobileconfig');
echo $mobileconfig;
?>
