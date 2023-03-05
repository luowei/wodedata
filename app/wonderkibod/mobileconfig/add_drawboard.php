<?php
header('Content-type: application/x-apple-aspen-config; chatset=utf-8');
header('Content-Disposition: attachment; filename="drawboard.mobileconfig"');

$mobileconfig = file_get_contents('drawboard.mobileconfig');
echo $mobileconfig;
?>
