<?php
header('Content-type: application/x-apple-aspen-config; chatset=utf-8');
header('Content-Disposition: attachment; filename="translate.mobileconfig"');

$mobileconfig = file_get_contents('translate.mobileconfig');
echo $mobileconfig;
?>
