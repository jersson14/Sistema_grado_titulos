<?php
if (class_exists('ZipArchive')) {
    echo "SUCCESS: ZipArchive is enabled.";
} else {
    echo "FAILURE: ZipArchive is still disabled.";
}
?>
