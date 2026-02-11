<?php
require_once 'model_conexion.php';

/**
 * Modelo para interactuar con la API del Repositorio DSpace
 * Permite buscar tesis por DNI del autor
 */
class Modelo_Repositorio_DSpace {
    
    /**
     * Busca una tesis en el repositorio DSpace por DNI del autor
     * 
     * @param string $dni DNI del autor a buscar
     * @return array|null Array con 'titulo' y 'enlace' si se encuentra, null si no
     */
    public function obtenerTesisPorDni($dni) {
        // Construir URL de búsqueda en la API de DSpace
        $url = "https://repositorio.utea.edu.pe/server/api/discover/search/objects?query=renati.author.dni:"
               . urlencode($dni) . "&embed=objects";

        // Inicializar cURL
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            "Accept: application/json"
        ]);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10); // Timeout de 10 segundos
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // Para desarrollo local

        // Ejecutar petición
        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        // Verificar respuesta exitosa
        if ($httpCode !== 200 || !$response) {
            return null;
        }

        // Decodificar JSON
        $data = json_decode($response, true);

        // Verificar si hay resultados
        if (!empty($data['_embedded']['searchResult']['_embedded']['objects'])) {
            // Tomar el primer resultado
            $item = $data['_embedded']['searchResult']['_embedded']['objects'][0]['_embedded']['indexableObject'];

            // Extraer título y construir enlace
            return [
                "titulo" => $item['metadata']['dc.title'][0]['value'] ?? null,
                "enlace" => "https://repositorio.utea.edu.pe/handle/" . $item['handle']
            ];
        }

        return null;
    }
}
?>
