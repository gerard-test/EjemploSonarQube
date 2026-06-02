<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enciclopedia Corporativa: Integración Global de SonarQube Cloud, GitHub Enterprise y Pipelines Multi-Stage</title>
    <style>
        :root {
            --primary-color: #0056b3;
            --primary-dark: #003366;
            --secondary-color: #17a2b8;
            --dark-color: #212529;
            --light-bg: #f8f9fa;
            --white: #ffffff;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --code-bg: #272822;
            --code-text: #f8f8f2;
            --border-radius: 8px;
            --transition-speed: 0.3s;
        }
        
        * { box-sizing: border-box; margin: 0; padding: 0; }
        
        body { 
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Arial, sans-serif; 
            line-height: 1.8; 
            padding: 0; 
            color: var(--dark-color); 
            background-color: #f4f6f9;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        header {
            background: linear-gradient(135deg, var(--primary-dark), var(--primary-color));
            color: var(--white);
            padding: 60px 40px;
            border-radius: var(--border-radius);
            margin-bottom: 40px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
            position: relative;
            overflow: hidden;
        }

        header::after {
            content: "";
            position: absolute;
            top: -50%;
            right: -20%;
            width: 600px;
            height: 600px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }

        header h1 { font-size: 2.8rem; font-weight: 700; line-height: 1.2; }
        header p { margin-top: 15px; font-size: 1.2rem; opacity: 0.9; max-width: 800px; }

        h2 { 
            color: var(--primary-dark); 
            border-bottom: 3px solid var(--primary-color); 
            padding-bottom: 12px; 
            margin-top: 50px;
            margin-bottom: 25px;
            font-size: 2rem;
            display: flex;
            align-items: center;
        }

        h3 { 
            color: #343a40; 
            margin-top: 30px; 
            margin-bottom: 15px;
            font-size: 1.4rem;
            border-left: 4px solid var(--secondary-color);
            padding-left: 10px;
        }

        p, li { font-size: 1.05rem; color: #495057; text-align: justify; margin-bottom: 15px; }
        ul, ol { margin-left: 30px; margin-bottom: 20px; }
        li { margin-bottom: 8px; }

        .section { 
            background: var(--white); 
            padding: 40px; 
            border-radius: var(--border-radius); 
            margin-bottom: 35px; 
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            transition: transform var(--transition-speed);
        }
        
        .section:hover {
            transform: translateY(-2px);
        }

        .check { color: var(--success-color); font-weight: bold; font-size: 1.3rem; margin-right: 10px; }
        
        .badge {
            color: var(--white);
            padding: 6px 14px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            display: inline-block;
            margin-right: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .badge-devops { background-color: #6f42c1; }
        .badge-security { background-color: #e83e8c; }
        .badge-cloud { background-color: #fd7e14; }
        .badge-qa { background-color: #20c997; }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 30px 0;
            background: var(--white);
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
            border-radius: var(--border-radius);
            overflow: hidden;
        }

        th, td { border: 1px solid #e9ecef; padding: 16px 20px; text-align: left; }
        th { background-color: #f1f3f5; color: var(--dark-color); font-weight: 700; }
        tr:nth-child(even) { background-color: #fdfdfd; }
        tr:hover { background-color: #f8f9fa; }

        pre {
            background-color: var(--code-bg);
            color: var(--code-text);
            padding: 25px;
            border-radius: var(--border-radius);
            overflow-x: auto;
            font-family: 'Fira Code', 'Consolas', 'Courier New', monospace;
            font-size: 0.95rem;
            box-shadow: inset 0 4px 20px rgba(0,0,0,0.3);
            line-height: 1.5;
            margin: 25px 0;
            border-left: 5px solid var(--secondary-color);
        }

        code {
            font-family: 'Consolas', monospace;
            background-color: #e9ecef;
            padding: 3px 8px;
            border-radius: 4px;
            color: #d63384;
            font-size: 0.95rem;
        }

        pre code { background-color: transparent; padding: 0; color: inherit; font-size: inherit; }
        
        .alert {
            padding: 20px 25px;
            border-left: 6px solid;
            border-radius: 4px;
            margin: 30px 0;
        }
        .alert-info { border-left-color: var(--secondary-color); background-color: #e3f2fd; color: #0d47a1; }
        .alert-warning { border-left-color: var(--warning-color); background-color: #fff3cd; color: #664d03; }
        .alert-danger { border-left-color: var(--danger-color); background-color: #f8d7da; color: #842029; }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 25px;
        }
        
        .grid-item {
            background: #f8f9fa;
            padding: 25px;
            border-radius: var(--border-radius);
            border-top: 4px solid var(--primary-color);
            box-shadow: 0 2px 5px rgba(0,0,0,0.02);
        }

        footer {
            text-align: center;
            margin-top: 60px;
            padding: 30px;
            color: #6c757d;
            border-top: 1px solid #dee2e6;
        }
    </style>
</head>
<body>

<div class="container">

    <header>
        <h1>Manual Maestro de Integración e Ingeniería de Calidad</h1>
        <p>Establecimiento de Compuertas de Calidad Automatizadas (Quality Gates) con SonarQube Cloud, Apache Maven y GitHub Actions de Nivel Corporativo</p>
    </header>

    <div class="section">
        <h2>1. Objetivos del Sistema y Hoja de Ruta Operativa</h2>
        <p>El propósito fundamental de esta especificación técnica es servir como la única fuente de verdad (SSOT) para la implementación de análisis estático de seguridad de aplicaciones (SAST) y control de la deuda técnica dentro de la infraestructura de integración continua. A través de este documento, los equipos globales homologarán criterios de despliegue.</p>
        
        <div class="grid-container">
            <div class="grid-item">
                <p><span class="check">✅</span> <strong>¿Qué es SonarQube Cloud?</strong> Comprensión estructural de la plataforma SaaS de análisis de código basada en telemetría en tiempo real.</p>
            </div>
            <div class="grid-item">
                <p><span class="check">✅</span> <strong>Conexión de Repositorios:</strong> Federación de identidades mediante GitHub Apps y aprovisionamiento automático de proyectos web.</p>
            </div>
            <div class="grid-item">
                <p><span class="check">✅</span> <strong>Generación de Tokens:</strong> Creación de llaves criptográficas API Bearer bajo el principio de mínimos privilegios.</p>
            </div>
            <div class="grid-item">
                <p><span class="check">✅</span> <strong>Secretos Cifrados:</strong> Almacenamiento seguro en las bóvedas criptográficas Libsodium de GitHub Actions a nivel organizacional.</p>
            </div>
            <div class="grid-item">
                <p><span class="check">✅</span> <strong>Flujos YAML Avanzados:</strong> Diseño de pipelines asíncronos distribuidos en contenedores Linux virtuales controlados.</p>
            </div>
            <div class="grid-item">
                <p><span class="check">✅</span> <strong>Análisis Automatizado:</strong> Ejecución en paralelo del ciclo de compilación, empaquetado JAR/WAR y rastreo de mutaciones de código.</p>
            </div>
        </div>
    </div>

    <div class="section">
        <h2>2. Matrices de Roles Profesionales e Impacto Operativo</h2>
        <p>Esta arquitectura requiere la orquestación coordinada de múltiples ramas de la ingeniería de software moderna para garantizar un ciclo de retroalimentación eficiente (Feedback Loop):</p>
        
        <ul>
            <li><span class="badge badge-devops">Ingenieros de DevOps</span>: Diseñan y optimizan el rendimiento del pipeline, garantizando que el almacenamiento en caché (Caching) de dependencias mitigue los tiempos muertos en los agentes de construcción.</li>
            <li><span class="badge badge-security">Ingenieros de DevSecOps</span>: Gobiernan las políticas de seguridad, configuran los umbrales del OWASP Top 10 y determinan si una vulnerabilidad bloquea la promoción a entornos de Staging o Production.</li>
            <li><span class="badge badge-cloud">Ingenieros de la Nube</span>: Administran la infraestructura elástica subyacente, la conectividad de red segura y las VPCs necesarias para que los runners se comuniquen con SonarQube Cloud.</li>
            <li><span class="badge badge-qa">Administradores de GitHub Enterprise</span>: Gestionan las políticas de gobernanza corporativa, la protección de ramas (`Branch Protection Rules`) y restringen los mergeos si el estado del commit es fallido.</li>
        </ul>
    </div>

    <div class="section">
        <h2>3. Desglose del Ecosistema Tecnológico Compilado</h2>
        <p>La siguiente tabla detalla la infraestructura tecnológica exacta que se requiere implementar para asegurar la compatibilidad absoluta del motor de análisis con la sintaxis de Java moderna:</p>
        
        <table>
            <thead>
                <tr>
                    <th>Herramienta Requerida</th>
                    <th>Especificación Arquitectónica</th>
                    <th>Módulo Operativo de Responsabilidad</th>
                </tr>
            </thead>
            <tbody>
                <tr><td>GitHub Enterprise</td><td>Cloud / On-Premise Suite v3.12+</td><td>Control de Versiones Distribuido, Auditoría de Commits y pasarela de Pull Requests.</td></tr>
                <tr><td>GitHub Actions</td><td>Hosted Runners Ubuntu-Latest</td><td>Orquestación dirigida por eventos y ejecución secuencial de Jobs en contenedores aislados.</td></tr>
                <tr><td>SonarQube Cloud</td><td>SaaS Cloud Multi-Tenant Edition</td><td>Motor analítico centralizado, cálculo de complejidad cognitiva y almacenamiento de histórico de calidad.</td></tr>
                <tr><td>Apache Maven</td><td>Wrappers Integrados v3.9.x</td><td>Inyección de dependencias, parseo de árboles binarios de librerías y ejecución del ciclo `verify`.</td></tr>
                <tr><td>Eclipse Temurin JDK</td><td>Version 17 / 21 LTS (Long Term Support)</td><td>Compilador nativo del lenguaje, recolección de basura y soporte analítico de hilos de ejecución.</td></tr>
                <tr><td>JaCoCo Plugin</td><td>Java Code Coverage Library v0.8.11</td><td>Generación de binarios de cobertura de pruebas unitarias (`jacoco.exec`) para inyección analítica.</td></tr>
            </tbody>
        </table>
    </div>

    <div class="section">
        <h2>4. Definición del Pipeline Industrial: Archivo <code>.github/workflows/sonar.yml</code></h2>
        <p>Este archivo YAML define la secuencia de infraestructura declarativa ejecutable por el motor de orquestación automatizada de GitHub. Soporta la persistencia de datos y el análisis profundo diferencial:</p>

<pre>name: Enterprise DevSecOps Quality Gate Pipeline

on:
  push:
    branches: [ main, master, 'feature/**', 'bugfix/**' ]
  pull_request:
    types: [ opened, synchronize, reopened ]
    branches: [ main, master ]

jobs:
  sonar-cloud-sast-analysis:
    name: Compilación Avanzada e Inyección de Telemetría SAST
    runs-on: ubuntu-latest
    timeout-minutes: 60

    steps:
      - name: Descarga Completa del Repositorio de Código Fuente
        uses: actions/checkout@v4
        with:
          fetch-depth: 0 

      - name: Inicialización y Aprovisionamiento del Entorno Java JDK
        uses: actions/setup-java@v4
        with:
          java-version: '17'
          distribution: 'temurin'
          cache: 'maven'

      - name: Persistencia y Almacenamiento en Caché del Histórico de Sonar
        uses: actions/cache@v4
        with:
          path: ~/.sonar/cache
          key: \${{ runner.os }}-sonar-v1-\${{ hashFiles('**/pom.xml') }}
          restore-keys: \${{ runner.os }}-sonar-v1-

      - name: Ejecución de Ciclo de Pruebas Unitarias y Disparo de Escaneo de Sonar Cloud
        env:
          GITHUB_TOKEN: \${{ secrets.GITHUB_TOKEN }}
          SONAR_TOKEN: \${{ secrets.SONAR_TOKEN }}
        run: |
          mvn -B clean verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar \
            -Dsonar.projectKey=com.enterprise.architecture:core-banking-system \
            -Dsonar.organization=global-enterprise-solutions-corp \
            -Dsonar.host.url=https://sonarcloud.io \
            -Dsonar.java.binaries=target/classes \
            -Dsonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml</pre>
    </div>

    <div class="section">
        <h2>5. Enciclopedia de Reglas de Calidad y Bloqueo de Código (Quality Rules 1-500)</h2>
        <p>Para asegurar que el escáner evalúe correctamente la base de código, SonarQube Cloud utiliza miles de reglas preconfiguradas. A continuación, se desglosan las reglas críticas de seguridad, mantenibilidad y fiabilidad que todo ingeniero debe conocer para evitar el rechazo de su código en el Quality Gate.</p>

        <h3>Regla SQ-J001: Inyección SQL Detectada en Capas de Persistencia de Datos</h3>
        <p><strong>Severidad:</strong> <span style="color:var(--danger-color); font-weight:bold;">CRÍTICA / BLOCKER</span></p>
        <p><strong>Descripción Técnica Detallada:</strong> Ocurre cuando se concatenan directamente variables de entrada del usuario dentro de cadenas de consultas SQL sin usar sentencias preparadas (`PreparedStatements`). Esto permite que atacantes externos alteren la estructura lógica de la base de datos, logrando bypass de autenticación o exfiltración de registros confidenciales de clientes.</p>
        <p><strong>Remediación Estructural:</strong> Implementar parametrización obligatoria utilizando JPA, Hibernate o JDBC seguro nativo.</p>
        <pre>// Código Vulnerable Detectado por SonarQube
String query = "SELECT * FROM usuarios WHERE id = '" + userInput + "'";
// Código Corregido y Aprobado por el Quality Gate
String querySecured = "SELECT * FROM usuarios WHERE id = ?";
PreparedStatement stmt = connection.prepareStatement(querySecured);
stmt.setString(1, userInput);</pre>

        <h3>Regla SQ-J002: Gestión Insegura de Secretos y Hardcoding de Llaves Criptográficas</h3>
        <p><strong>Severidad:</strong> <span style="color:var(--danger-color); font-weight:bold;">CRÍTICA / BLOCKER</span></p>
        <p><strong>Descripción Técnica Detallada:</strong> El almacenamiento de contraseñas de bases de datos, tokens de API o llaves privadas SSH directamente en cadenas de texto dentro del código fuente Java (`String password = "12345";`) expone las credenciales a cualquier usuario con acceso de lectura al repositorio Git. SonarQube escanea mediante expresiones regulares de entropía matemática para romper la compilación si detecta patrones sospechosos.</p>
        <p><strong>Remediación Estructural:</strong> Inyectar variables de entorno a través de bóvedas seguras como HashiCorp Vault o GitHub Secrets.</p>
        <pre>// Código Inseguro Detectado por SonarQube
private String apiToken = "sqc_7d8as9d78as9d78as9d7a8s9d78a9sd87";
// Código Corregido e Inyección Dinámica Externa
private String apiTokenSecured = System.getenv("ENTERPRISE_API_TOKEN");</pre>

        <h3>Regla SQ-J003: Complejidad Ciclomática Excesiva en Métodos y Algoritmos</h3>
        <p><strong>Severidad:</strong> <span style="color:var(--warning-color); font-weight:bold;">ALTA / MAJOR</span></p>
        <p><strong>Descripción Técnica Detallada:</strong> La complejidad ciclomática mide matemáticamente la cantidad de caminos lineales independientes a través del código fuente (determinada por sentencias `if`, `while`, `for`, `case`). Un método con una complejidad superior a 15 es extremadamente difícil de probar mediante pruebas unitarias, propenso a bugs ocultos y costoso de mantener a largo plazo en términos de refactorización.</p>
        <p><strong>Remediación Estructural:</strong> Aplicar patrones de refactorización como el principio de responsabilidad única (SRP), extrayendo lógica anidada hacia submétodos especializados.</p>

        <h3>Regla SQ-J004: Captura Genérica de Excepciones del Sistema (Throwable / Exception)</h3>
        <p><strong>Severidad:</strong> <span style="color:var(--primary-color); font-weight:bold;">MEDIA / MINOR</span></p>
        <p><strong>Descripción Técnica Detallada:</strong> Capturar `Exception` o `Throwable` en un bloque `catch` oculta errores graves del sistema en tiempo de ejecución (como `NullPointerException` o `OutOfMemoryError`), impidiendo que las capas superiores de la arquitectura controlen adecuadamente el flujo de recuperación de caídas o registren trazas limpias en el sistema de monitorización.</p>
        <p><strong>Remediación Estructural:</strong> Capturar de forma explícita las excepciones de negocio declaradas (ej. `SQLException`, `IOException`).</p>

        <h3>Regla SQ-J005: Fugas de Memoria por Cierre Incorrecto de Flujos de Datos (I/O Streams)</h3>
        <p><strong>Severidad:</strong> <span style="color:var(--warning-color); font-weight:bold;">ALTA / MAJOR</span></p>
        <p><strong>Descripción Técnica Detallada:</strong> No cerrar descriptores de archivos, sockets de red o conexiones de bases de datos saca los recursos del sistema del pool operativo, provocando una degradación continua de la RAM del servidor conocido como fugas de memoria (Memory Leaks).</p>
        <p><strong>Remediación:</strong> Utilizar la estructura nativa moderna de Java `try-with-resources` para asegurar el autoclose.</p>
        <pre>try (BufferedReader br = new BufferedReader(new FileReader("data.txt"))) {
    // El flujo se cerrará automáticamente al salir del bloque
    String line = br.readLine();
}</pre>

    </div>

    <div class="section">
        <h2>6. Manual Técnico Completo de Troubleshooting en Entornos Integrados</h2>
        <div class="alert alert-danger">
            <strong>Error de Infraestructura Crítico:</strong> <code>LinkageError: Automated scan could not resolve plugin metadata</code>. Este fallo invalida la carga de datos analíticos hacia SonarQube Cloud y se debe a un desfase de dependencias en la caché del orquestador.
        </div>
        <p>Para mitigar este fallo de ingeniería, limpie la caché de Actions borrando los directorios binarios de manera remota e incremente la versión de los plugins declarados en el archivo descriptor central del framework.</p>
    </div>

    <footer>
        <p>© 2026 Enterprise Quality Engineering Hub - Documentación Oficial Confidencial para Uso Interno Tecnológico</p>
    </footer>

</div>

</body>
</html>


