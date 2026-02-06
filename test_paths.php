<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "Testing paths...\n";

$root = __DIR__;
echo "Root: $root\n";

// Test PHPMailer
echo "Testing PHPMailer include...\n";
$phpmailer = $root . '/src/PHPMailer.php';
if (file_exists($phpmailer)) {
    echo "PHPMailer file exists.\n";
    require_once $phpmailer;
    echo "PHPMailer required.\n";
} else {
    echo "PHPMailer file NOT FOUND at $phpmailer\n";
}

// Test mPDF
echo "Testing mPDF include...\n";
$mpdf_autoload = $root . '/view/MPDF/vendor/autoload.php';
if (file_exists($mpdf_autoload)) {
    echo "mPDF autoload exists.\n";
    require_once $mpdf_autoload;
    echo "mPDF autoload required.\n";
    try {
        $mpdf = new \Mpdf\Mpdf();
        echo "mPDF instantiated successfully.\n";
    } catch (Throwable $e) {
        echo "mPDF instantiation FAILED: " . $e->getMessage() . "\n";
    }
} else {
    echo "mPDF autoload NOT FOUND at $mpdf_autoload\n";
}

// Test View Connection
echo "Testing View Connection...\n";
$conn_view = $root . '/view/MPDF/conexion.php';
if (file_exists($conn_view)) {
    echo "View Connection file exists.\n";
    require_once $conn_view;
    echo "View Connection required.\n";
    if (isset($mysqli)) {
        echo "mysqli variable is set.\n";
        if ($mysqli->connect_error) {
             echo "DB Connection FAILED: " . $mysqli->connect_error . "\n";
        } else {
             echo "DB Connection SUCCESS.\n";
        }
    } else {
        echo "mysqli variable NOT set.\n";
    }
} else {
    echo "View Connection file NOT FOUND at $conn_view\n";
}

echo "Done.\n";
?>
