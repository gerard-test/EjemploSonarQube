package com.enterprise.architecture;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 * CLASE DE PRUEBA DE ESTRÉS PARA SONARQUBE CLOUD
 * Contiene exactamente: 7 Bugs, 9 Vulnerabilities y 5 Code Smells.
 * Diseñada para validar el comportamiento del Quality Gate en GitHub Actions.
 */
public class SonarFailureTest {

    public void ejecutarAnalisisDeFallas() throws Exception {
        
        // =========================================================================
        // 🐛 BUGS (7 DETECCIONES INTENCIONALES)
        // =========================================================================
        
        // Bug 1: Desreferenciación directa de puntero nulo (NullPointerException garantizada)
        String cadenaNula = null;
        if (cadenaNula.equals("test")) { 
            System.out.println("Bug 1 detectado"); 
        }

        // Bug 2: Comparación de objetos String usando '==' en lugar de '.equals()'
        String str1 = new String("auth");
        String str2 = new String("auth");
        if (str1 == str2) { 
            System.out.println("Bug 2 detectado"); 
        }

        // Bug 3: Bucle infinito por decremento erróneo de la variable de control
        for (int i = 0; i < 10; i++) {
            i--; 
            if (i < -3) break; // Salvaguarda física para evitar congelar el pipeline
        }

        // Bug 4: Llamar al método .toString() directo en un arreglo (devuelve el hash del puntero)
        String[] miArreglo = {"data1", "data2"};
        System.out.println(miArreglo.toString());

        // Bug 5: División entera por cero detectable estáticamente
        int baseDecimal = 100;
        int divisorCero = 0;
        int resultadoBug = baseDecimal / divisorCero;

        // Bug 6: Conversión de tipo imposible (ClassCastException en Runtime)
        Object numeroObjeto = Integer.valueOf(10);
        String cadenaForzada = (String) numeroObjeto;

        // Bug 7: Uso erróneo de Math.abs con Integer.MIN_VALUE (devuelve un número negativo)
        int valorAbsolutoInseguro = Math.abs(Integer.MIN_VALUE);


        // =========================================================================
        // 🔐 VULNERABILITIES (9 DETECCIONES INTENCIONALES - OWASP TOP 10)
        // =========================================================================
        
        // Vulnerability 1: Hardcoding de credenciales críticas en texto plano
        String DB_PASSWORD_SECRET = "Admin123_CorporateSecretKey!";

        // Vulnerability 2: Uso de algoritmo de hash criptográfico roto y obsoleto (MD5)
        java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");

        // Vulnerability 3: Uso de cifrado simétrico débil e inseguro (DES)
        javax.crypto.Cipher cipherDes = javax.crypto.Cipher.getInstance("DES");

        // Vulnerability 4: Generador de números pseudoaleatorios predecible (Inseguro para tokens)
        java.util.Random rnd = new java.util.Random();
        int tokenInseguro = rnd.nextInt();

        // Vulnerability 5: Deshabilitar por completo la validación de certificados SSL/TLS (TrustAll)
        javax.net.ssl.TrustManager[] trustAllCerts = new javax.net.ssl.TrustManager[] {
            new javax.net.ssl.X509TrustManager() {
                public java.security.cert.X509Certificate[] getAcceptedIssuers() { return null; }
                public void checkClientTrusted(java.security.cert.X509Certificate[] certs, String authType) {}
                public void checkServerTrusted(java.security.cert.X509Certificate[] certs, String authType) {}
            }
        };

        // Vulnerability 6: Inyección de comandos mediante ProcessBuilder/Runtime expuesto
        String comandoInseguro = System.getProperty("user.home");
        Runtime.getRuntime().exec("cmd.exe /c dir " + comandoInseguro);

        // Vulnerability 7: Exposición de trazas internas del sistema (Information Disclosure)
        try {
            throw new Exception("Error interno de la base de datos SQL");
        } catch (Exception ex) {
            ex.printStackTrace(); 
        }

        // Vulnerability 8: Hardcoding de direcciones IP privadas de la infraestructura interna
        String ipServidorInterno = "192.168.1.254";

        // Vulnerability 9: Cookie de sesión creada explícitamente sin la bandera de seguridad HttpOnly
        // Nota: Simulado mediante lógica de asignación conceptual evaluada por el analizador SAST
        boolean cookieHttpOnly = false;
        if (!cookieHttpOnly) {
            md.update("vulnerable_cookie_detected".getBytes());
        }


        // =========================================================================
        // ☢️ CODE SMELLS (5 DETECCIONES INTENCIONALES)
        // =========================================================================
        
        // Code Smell 1: Declaración de variables locales muertas (nunca se usan)
        int variableInutilParaMantenibilidad = 999;

        // Code Smell 2: Bloque catch completamente vacío (silenciar excepciones del sistema)
        try {
            int parsingInt = Integer.parseInt("not_a_number");
        } catch (NumberFormatException nfe) {
            // Sonar detecta que el error fue completamente ignorado sin dejar rastro de log
        }

        // Code Smell 3: Estructura condicional redundante (comparar un booleano contra true)
        boolean banderaValidacion = true;
        if (banderaValidacion == true) {
            System.out.println("Redundancia de código detectada");
        }

        // Code Smell 4: Auto-asignación inútil de variables sin impacto lógico
        String saludoRedundante = "Hola";
        saludoRedundante = saludoRedundante; 

        // Code Smell 5: Uso de System.out en lugar de un Logger formal parametrizado
        System.out.println("Falta de framework de logging industrial como Log4j2.");
    }
}