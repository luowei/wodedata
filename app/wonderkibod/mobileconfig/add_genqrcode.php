<?php
header('Content-type: application/x-apple-aspen-config; chatset=utf-8');
header('Content-Disposition: attachment; filename="genqrcode.mobileconfig"');

$mobileconfig = file_get_contents('genqrcode.mobileconfig');
echo $mobileconfig;
?>
