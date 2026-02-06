<?php
$output = [];
$return_var = 0;
exec("unrar", $output, $return_var);
// unrar usually returns 0 or 7 (user error) if installed but run without args, or error code 1/127 if not found (depends on shell).
// Windows often just outputs nothing if not found or "is not recognized".
echo "UNRAR_CODE: $return_var\n";

$output2 = [];
$return_var2 = 0;
exec("7z", $output2, $return_var2);
echo "7Z_CODE: $return_var2\n";
?>
