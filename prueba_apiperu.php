<?php
// Prueba de API Peru DNI con el DNI proporcionado: 31044054
$params = json_encode(['dni' => '31035815']);
$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_URL => "https://apiperu.dev/api/dni",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_CUSTOMREQUEST => "POST",
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_POSTFIELDS => $params,        
    CURLOPT_HTTPHEADER => [
        'Accept: application/json',
        'Content-Type: application/json',
        'Authorization: Bearer 51c4e06d463fc5abb0a80b343ba6c2b1b7bc4685014016313978418f851ff53e' // REEMPLAZAR CON TU TOKEN REAL
    ],        
));

$response = curl_exec($curl);
$err = curl_error($curl);
curl_close($curl);

if ($err) {
    echo "cURL Error #:" . $err;
} else {
    echo $response;
}
?>
