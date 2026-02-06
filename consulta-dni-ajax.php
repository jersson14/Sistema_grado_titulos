<?php

$dni = $_POST['dni'];
$token = 'sk_6484.Nc0D8FvCLx5ICODwuQWwWlBS0HBy7MRt'; // Tu token real

if(strlen($dni) != 8){
    echo json_encode(1); // Validación de 8 dígitos
    exit;
}

$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://api.decolecta.com/v1/reniec/dni?numero=' . $dni,
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_SSL_VERIFYPEER => false,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json',
    'Authorization: Bearer ' . $token
  ),
));

$response = curl_exec($curl);
$http_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);

if(curl_errno($curl)){
    echo json_encode(['error' => 'Curl error: ' . curl_error($curl)]);
    exit;
}

curl_close($curl);

// Si la API devuelve el DNI consultado, es correcto
// La estructura varía según la API, así que mejor devolvemos todo y procesamos en JS
echo $response;
