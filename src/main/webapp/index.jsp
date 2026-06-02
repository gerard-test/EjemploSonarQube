<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guía Avanzada y Enterprise de Integración: SonarQube Cloud & GitHub Actions</title>
    <style>
        :root {
            --primary-color: #0056b3;
            --secondary-color: #17a2b8;
            --dark-color: #212529;
            --light-color: #f8f9fa;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --border-radius: 6px;
        }
        body { 
            font-family: 'Segoe UI', Arial, sans-serif; 
            line-height: 1.8; 
            padding: 40px; 
            color: var(--dark-color); 
            background-color: #f4f6f9;
            max-width: 1200px;
            margin: 0 auto;
        }
        header {
            background: linear-gradient(135deg, #003366, #0056b3);
            color: white;
            padding: 40px;
            border-radius: var(--border-radius);
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        header h1 { margin: 0; font-size: 2.5rem; }
        header p { margin: 10px 0 0 0; opacity: 0.9; font-size: 1.1rem; }
        h2 { 
            color: var(--primary-color); 
            border-bottom: 2px solid var(--primary-color); 
            padding-bottom: 8px; 
            margin-top: 40px;
            font-size: 1.8rem;
        }
        h3 { color: #333; margin-top: 25px; font-size: 1.4rem; }
        p, li { font-size: 1.05rem; text-align: justify; }
        .section { 
            background: white; 
            padding: 30px; 
            border-radius: var(--border-radius); 
            margin-bottom: 25px; 
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .check { color: var(--success-color); font-weight: bold; font-size: 1.2rem; }
        .badge {
            background-color: var(--primary-color);
            color: white;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: bold;
            display: inline-block;
            margin-right: 5px;
        }
        .badge-devops { background-color: #6f42c1; }
        .badge-security { background-color: #e83e8c; }
        .badge-cloud { background-color: #fd7e14; }
        
        /* Estilos de tablas */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: white;
        }
        th, td {
            border: 1px solid #dee2e6;
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color: #e9ecef;
            color: var(--dark-color);
            font-weight: bold;
        }
        tr:nth-child(even) { background-color: #f8f9fa; }

        /* Bloques de Código Falsos y Reales */
        pre {
            background-color: #272822;
            color: #f8f8f2;
            padding: 20px;
            border-radius: var(--border-radius);
            overflow-x: auto;
            font-family: 'Consolas', 'Courier New', monospace;
            font-size: 0.95rem;
            box-shadow: inset 0 0 10px rgba(0,0,0,0.5);
            line-height: 1.4;
        }
        code {
            font-family: 'Consolas', 'Courier New', monospace;
            background-color: #e9ecef;
            padding: 2px 6px;
            border-radius: 4px;
            color: #d63384;
            font-size: 0.95rem;
        }
        pre code {
            background-color: transparent;
            padding: 0;
            color: inherit;
            font-size: inherit;
        }
        
        .alert {
            padding: 15px 20px;
            border-left: 5px solid;
            border-radius: 4px;
            margin: 20px 0;
            background-color: #fff;
        }
        .alert-info { border-left-color: var(--secondary-color); background-color: #e3f2fd; }
        .alert-warning { border-left-color: var(--warning-color); background-color: #fff3cd; }
        .alert-danger { border-left-color: var(--danger-color); background-color: #f8d7da; }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .grid-item {
            background: #f1f3f5;
            padding: 20px;
            border-radius: var(--border-radius);
            border-top: 4px solid var(--primary-color);
        }
    </style>
</head>
<body>

    <header>
        <h1>Guía Maestra de Integración Continua con SonarQube Cloud</h1>
        <p>Implementación de Análisis Estático de Código (SAST) en Pipelines de GitHub Actions para Entornos Java Corporativos</p>
    </header>

    <div class="section">
        <h2>1. Objetivos del Aprendizaje y Hoja de Ruta</h2>
        <p>En el paradigma moderno del desarrollo de software bajo metodologías Ágiles y marcos de trabajo DevOps/DevSecOps, la calidad del código y la seguridad no pueden ser consideradas como fases tardías en el ciclo de vida del desarrollo de software (SDLC). Esta guía proporciona una arquitectura de referencia detallada para implementar el análisis de código estático mediante SonarQube Cloud integrado de forma nativa con GitHub Actions.</p>
        
        <div class="grid-container">
            <div class="grid-item">
                <span class="check">✅</span> <strong>Fase Teórica:</strong> Comprensión profunda de las métricas de calidad de SonarQube Cloud, incluyendo "Code Smells", vulnerabilidades, y cobertura de pruebas.
            </div>
            <div class="grid-item">
                <span class="check">✅</span> <strong>Fase de Conexión:</strong> Vinculación del Tenant de SonarQube Cloud con Organizaciones de GitHub de manera segura.
            </div>
            <div class="grid-item">
                <span class="check">✅</span> <strong>Fase de Seguridad:</strong> Gestión de identidades mediante Tokens de Acceso Personal (PAT) y Secretos Cifrados de GitHub de nivel de repositorio y organización.
            </div>
            <div class="grid-item">
                <span class="check">✅</span> <strong>Fase de Automatización:</strong> Construcción de archivos de flujo de trabajo YAML robustos y tolerantes a fallos utilizando GitHub Actions Runner.
            </div>
        </div>
    </div>

    <div class="section">
        <h2>2. Perfiles Profesionales Requeridos e Impacto</h2>
        <p>Esta documentación técnica de ingeniería está diseñada para dotar de capacidades analíticas y operativas a los siguientes roles estratégicos dentro de la organización tecnológica:</p>
        
        <ul>
            <li><span class="badge badge-devops">DevOps Engineers</span>: Responsables de estructurar la infraestructura de integración continua y optimizar los tiempos de ejecución del pipeline (Feedback Loop).</li>
            <li><span class="badge badge-security">DevSecOps Engineers</span>: Encargados de auditar las compuertas de calidad (Quality Gates), gestionar el umbral de vulnerabilidades detectadas en código (SAST) y asegurar que ningún secreto sea expuesto.</li>
            <li><span class="badge badge-cloud">Cloud Engineers</span>: Proveedores de la infraestructura base y agentes de ejecución (Runners) autohospedados o administrados en la nube que procesan las tareas de compilación de Maven.</li>
            <li><span class="badge">GitHub Enterprise Admins</span>: Responsables de la gobernanza, políticas de ramas protegidas y aplicación de Webhooks a nivel organizacional.</li>
        </ul>
    </div>

    <div class="section">
        <h2>3. Ecosistema Tecnológico de la Solución</h2>
        <p>La implementación descrita en este documento se basa en la combinación sinérgica de las siguientes herramientas de nivel empresarial:</p>
        
        <table>
            <thead>
                <tr>
                    <th>Componente</th>
                    <th>Versión / Tipo recomendado</th>
                    <th>Función Principal en el Flujo</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><strong>GitHub Enterprise</strong></td>
                    <td>Cloud / Server v3.x+</td>
                    <td>Sistema de control de versiones distribuido (DVCS) y orquestador central de eventos de Git.</td>
                </tr>
                <tr>
                    <td><strong>GitHub Actions</strong></td>
                    <td>Native Cloud Run</td>
                    <td>Plataforma de CI/CD encargada del ciclo de compilación, empaquetado y disparo de análisis.</td>
                </tr>
                <tr>
                    <td><strong>SonarQube Cloud</strong></td>
                    <td>SaaS Platform</td>
                    <td>Motor de análisis de código estático basado en la nube. Calcula duplicaciones, deuda técnica y brechas de seguridad.</td>
                </tr>
                <tr>
                    <td><strong>Apache Maven</strong></td>
                    <td>v3.8.x o superior</td>
                    <td>Gestor de ciclo de vida de proyectos Java, responsable de compilar la aplicación y disparar el plugin de Sonar.</td>
                </tr>
                <tr>
                    <td><strong>Java SDK (OpenJDK)</strong></td>
                    <td>v17 o v21 (LTS)</td>
                    <td>Entorno de ejecución requerido para compilar el código de origen Java moderno y ejecutar las pruebas unitarias.</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="section">
        <h2>4. 🔐 Fundamentos de Negocio y Justificación Técnica</h2>
        <p>Implementar controles automatizados de calidad de código no es simplemente un capricho técnico, sino una estrategia crítica de mitigación de riesgos de negocio. A continuación, detallamos las razones por las cuales las corporaciones de alta tecnología adoptan este enfoque estructural:</p>
        
        <h3>✔ Desplazamiento a la Izquierda de la Seguridad (Shift-Left Security)</h3>
        <p>Tradicionalmente, las auditorías de seguridad se realizaban justo antes del despliegue en producción, o peor aún, después del lanzamiento mediante pruebas de penetración externas. Esto generaba altos costos de remediación. Al incorporar el escaneo SAST de SonarQube Cloud directamente en cada <code>Pull Request</code>, los desarrolladores identifican fallos de inyección SQL, Cross-Site Scripting (XSS) y fallas criptográficas en minutos, antes de que el código se fusione con la rama principal.</p>

        <h3>✔ Control Automatizado de la Calidad y Deuda Técnica</h3>
        <p>La deuda técnica actúa como un interés financiero: ralentiza el desarrollo futuro. SonarQube utiliza algoritmos avanzados para medir la mantenibilidad del software estimando el tiempo (en días y horas) requerido para solucionar el código deficiente (Code Smells). Automatizar esta medición previene la degradación progresiva de la base de código.</p>

        <div class="alert alert-info">
            <strong>Nota de Arquitectura:</strong> Una regla de oro en las organizaciones modernas de desarrollo es mantener la cobertura de pruebas unitarias (Code Coverage) por encima del 80%. SonarQube Cloud rastrea las líneas no cubiertas integrándose con frameworks como JaCoCo.
        </div>
    </div>

    <div class="section">
        <h2>5. Guía de Configuración Técnica e Implementación Paso a Paso</h2>
        <p>A continuación se presenta la secuencia exacta de configuraciones necesarias para materializar la arquitectura de integración continua.</p>

        <h3>Paso 5.1: Vinculación Inicial de GitHub y SonarQube Cloud</h3>
        <p>Para que SonarQube Cloud pueda recibir telemetría y reportar los estados del análisis directamente en la interfaz de GitHub, es mandatario realizar un apretón de manos inicial (Handshake) de OAuth:</p>
        <ol>
            <li>Inicie sesión en <a href="https://sonarcloud.io" target="_blank">SonarQube Cloud (SonarCloud)</a> utilizando sus credenciales corporativas de GitHub.</li>
            <li>Haga clic en el icono "+" en la esquina superior derecha y seleccione <strong>"Analyze new project"</strong>.</li>
            <li>Seleccione la organización de GitHub que aloja sus repositorios. Si es la primera vez, el sistema solicitará instalar la aplicación oficial de GitHub de SonarCloud. Otorgue permisos de lectura sobre el repositorio específico o sobre todos.</li>
        </ol>

        <h3>Paso 5.2: Creación del Token de Seguridad de Sonar</h3>
        <p>El pipeline automatizado de GitHub Actions requiere autenticarse contra la API REST de SonarQube Cloud de forma desasistida. Para ello, se debe generar un Token de Acceso Seguro:</p>
        <ol>
            <li>Dentro de SonarCloud, navegue a su perfil de usuario (esquina superior derecha) y haga clic en <strong>My Account</strong>.</li>
            <li>Acceda a la pestaña <strong>Security</strong>.</li>
            <li>En el campo "Generate Token", ingrese un nombre descriptivo (ej. <code>GitHub_Actions_Pipeline_Token</code>) y haga clic en <strong>Generate</strong>.</li>
            <li><strong>IMPORTANTE:</strong> Copie el token generado inmediatamente. No volverá a mostrarse por razones de seguridad de la plataforma.</li>
        </ol>

        <h3>Paso 5.3: Configuración de Secretos en el Repositorio de GitHub</h3>
        <p>Bajo ninguna circunstancia se debe escribir el token generado en texto plano dentro del código fuente o en los scripts de YAML. Los atacantes automatizados escanean repositorios públicos y privados en busca de secretos expuestos.</p>
        <ol>
            <li>Vaya a la página principal de su repositorio en GitHub.</li>
            <li>Haga clic en la pestaña <strong>Settings</strong> (Configuración).</li>
            <li>En el menú lateral izquierdo, expanda la sección <strong>Secrets and variables</strong> y seleccione <strong>Actions</strong>.</li>
            <li>Haga clic en el botón verde <strong>New repository secret</strong>.</li>
            <li>Configure las siguientes variables obligatorias:</li>
        </ol>

        <table>
            <thead>
                <tr>
                    <th>Nombre del Secreto en GitHub</th>
                    <th>Valor Requerido</th>
                    <th>Propósito del Secreto</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><code>SONAR_TOKEN</code></td>
                    <td>El token copiado en el paso 5.2 (Ej: <code>sqc_a1b2c3d4e5...</code>)</td>
                    <td>Autentica de forma segura el runner de compilación con la plataforma SonarCloud.</td>
                </tr>
                <tr>
                    <td><code>SONAR_HOST_URL</code></td>
                    <td><code>https://sonarcloud.io</code></td>
                    <td>(Opcional / Recomendado) Especifica el punto de conexión global del servicio en la nube.</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="section">
        <h2>6. Configuración del Archivo del Proyecto Java: <code>pom.xml</code></h2>
        <p>Para asegurar que Maven procese las métricas de forma adecuada, el archivo de definición del proyecto de Maven debe declarar las propiedades de SonarQube Cloud correspondientes a la organización y la clave del proyecto. A continuación se expone un ejemplo real y completamente funcional:</p>

<pre>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"&gt;
    &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;

    &lt;groupId&gt;com.enterprise.devsecops&lt;/groupId&gt;
    &lt;artifactId&gt;secure-java-app&lt;/artifactId&gt;
    &lt;version&gt;1.0.0-SNAPSHOT&lt;/version&gt;
    &lt;packaging&gt;jar&lt;/packaging&gt;

    &lt;name&gt;Secure Java Enterprise Application&lt;/name&gt;
    &lt;description&gt;Proyecto base para la demostración de análisis SAST automatizado&lt;/description&gt;

    &lt;properties&gt;
        &lt;maven.compiler.source&gt;17&lt;/maven.compiler.source&gt;
        &lt;maven.compiler.target&gt;17&lt;/maven.compiler.target&gt;
        &lt;project.build.sourceEncoding&gt;UTF-8&lt;/project.build.sourceEncoding&gt;
        
        &lt;!-- Propiedades Específicas de Configuración para SonarQube Cloud --&gt;
        &lt;sonar.organization&gt;mi-organizacion-empresarial-github&lt;/sonar.organization&gt;
        &lt;sonar.projectKey&gt;com.enterprise.devsecops:secure-java-app&lt;/sonar.projectKey&gt;
        &lt;sonar.host.url&gt;https://sonarcloud.io&lt;/sonar.host.url&gt;
        
        &lt;!-- Configuración de Cobertura de Código con Jacoco --&gt;
        &lt;jacoco.version&gt;0.8.11&lt;/jacoco.version&gt;
    &lt;/properties&gt;

    &lt;dependencies&gt;
        &lt;!-- Dependencia Estándar de Prueba JUnit 5 --&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.junit.jupiter&lt;/groupId&gt;
            &lt;artifactId&gt;junit-jupiter-api&lt;/artifactId&gt;
            &lt;version&gt;5.10.1&lt;/version&gt;
            &lt;scope&gt;test&lt;/scope&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
            &lt;groupId&gt;org.junit.jupiter&lt;/groupId&gt;
            &lt;artifactId&gt;junit-jupiter-engine&lt;/artifactId&gt;
            &lt;version&gt;5.10.1&lt;/version&gt;
            &lt;scope&gt;test&lt;/scope&gt;
        &lt;/dependency&gt;
    &lt;/dependencies&gt;

    &lt;build&gt;
        &lt;plugins&gt;
            &lt;!-- Plugin del Compilador de Maven --&gt;
            &lt;plugin&gt;
                &lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
                &lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
                &lt;version&gt;3.11.0&lt;/version&gt;
            &lt;/plugin&gt;

            &lt;!-- Plugin de JaCoCo para la generación de reportes de cobertura unitaria --&gt;
            &lt;plugin&gt;
                &lt;groupId&gt;org.jacoco&lt;/groupId&gt;
                &lt;artifactId&gt;jacoco-maven-plugin&lt;/artifactId&gt;
                &lt;version&gt;\${jacoco.version}&lt;/version&gt;
                &lt;executions&gt;
                    &lt;execution&gt;
                        &lt;id&gt;prepare-agent&lt;/id&gt;
                        &lt;goals&gt;
                            &lt;goal&gt;prepare-agent&lt;/goal&gt;
                        &lt;/goals&gt;
                    &lt;/execution&gt;
                    &lt;execution&gt;
                        &lt;id&gt;report&lt;/id&gt;
                        &lt;phase&gt;test&lt;/phase&gt;
                        &lt;goals&gt;
                            &lt;goal&gt;report&lt;/goal&gt;
                        &lt;/goals&gt;
                    &lt;/execution&gt;
                &lt;/executions&gt;
            &lt;/plugin&gt;

            &lt;!-- Plugin Oficial de SonarQube para Maven --&gt;
            &lt;plugin&gt;
                &lt;groupId&gt;org.sonarsource.scanner.maven&lt;/groupId&gt;
                &lt;artifactId&gt;sonar-maven-plugin&lt;/artifactId&gt;
                &lt;version&gt;3.10.0.2594&lt;/version&gt;
            &lt;/plugin&gt;
        &lt;/plugins&gt;
    &lt;/build&gt;
&lt;/project&gt;</pre>
    </div>

    <div class="section">
        <h2>7. Creación de Flujo de Trabajo Automatizado (GitHub Actions CI YAML)</h2>
        <p>Para activar el pipeline en cada cambio de código, cree una estructura de carpetas en la raíz de su repositorio llamada <code>.github/workflows/</code> y dentro cree un archivo con extensión YAML, por ejemplo, <code>sonar-analysis.yml</code>. A continuación se provee el pipeline industrial completoizado:</p>

<pre>name: Pipeline de Integración Continua y Calidad de Código SonarQube Cloud

on:
  push:
    branches:
      - main
      - master
      - 'release/**'
  pull_request:
    types: [opened, synchronize, reopened]
    branches:
      - main
      - master

permissions:
  contents: read
  pull-requests: write

jobs:
  build-and-analyze:
    name: Compilación del Artefacto y Análisis Estático de Código (SAST)
    runs-on: ubuntu-latest

    steps:
      - name: 1. Clonar Código de Fuente desde el Repositorio de GitHub
        uses: actions/checkout@v4
        with:
          fetch-depth: 0  # Desactivar clonado superficial para que Sonar pueda calcular la autoría de líneas (Git Blame)

      - name: 2. Configurar el Entorno del Sistema de Ejecución de Java (JDK 17)
        uses: actions/setup-java@v4
        with:
          java-version: '17'
          distribution: 'temurin'
          cache: 'maven' # Almacena en caché las dependencias de Maven para acelerar ejecuciones posteriores

      - name: 3. Almacenar en Caché Paquetes de SonarQube Cloud
        uses: actions/cache@v4
        with:
          path: ~/.sonar/cache
          key: \${{ runner.os }}-sonar
          restore-keys: \${{ runner.os }}-sonar

      - name: 4. Ejecutar Compilación, Pruebas Unitarias y Análisis de SonarQube
        env:
          GITHUB_TOKEN: \${{ secrets.GITHUB_TOKEN }}  # Requerido de manera interna por GitHub para interactuar con las PRs
          SONAR_TOKEN: \${{ secrets.SONAR_TOKEN }}    # Nuestro token secreto guardado en los settings
        run: |
          mvn -B clean verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar \
            -Dsonar.projectKey=com.enterprise.devsecops:secure-java-app \
            -Dsonar.organization=mi-organizacion-empresarial-github \
            -Dsonar.host.url=https://sonarcloud.io</pre>

        <div class="alert alert-warning">
            <strong>Atención sobre Optimización:</strong> El parámetro <code>fetch-depth: 0</code> es fundamental. Si se omite, GitHub clona únicamente el último commit del código fuente, impidiendo que SonarQube asigne correctamente la autoría de los bugs y realice comparaciones incrementales de código limpio en Pull Requests.
        </div>
    </div>

    <div class="section">
        <h2>8. Gobierno de Puertas de Calidad (Quality Gates)</h2>
        <p>Un "Quality Gate" es un conjunto de condiciones booleanas que el proyecto debe cumplir para considerarse apto para su promoción a entornos superiores. Si el análisis automatizado determina que el nuevo código viola alguno de los umbrales configurados, la compuerta se cierra rompiendo de forma controlada el pipeline de GitHub Actions.</p>
        
        <h3>Métricas Críticas Evaluadas por Defecto:</h3>
        <ul>
            <li><strong>Fiabilidad (Reliability):</strong> Cero "Bugs" nuevos con severidad crítica o alta.</li>
            <li><strong>Seguridad (Security Vulnerabilities):</strong> Ninguna vulnerabilidad abierta basada en las reglas del OWASP Top 10.</li>
            <li><strong>Mantenibilidad (Maintainability):</strong> Grado de calificación "A" en código nuevo.</li>
            <li><strong>Porcentaje de Duplicación:</strong> No se admite que más del 3% del código total evaluado corresponda a bloques copiados y pegados (Doble Mantenimiento).</li>
        </ul>
        
        <p>Al integrarse correctamente con GitHub Actions, se añade una verificación dinámica al final de las Pull Requests, impidiendo que el botón "Merge" sea presionado a menos que el Quality Gate devuelva un estado exitoso (Passed).</p>
    </div>

    <div class="section">
        <h2>9. Manual Exhaustivo de Resolución de Errores Comunes (Troubleshooting)</h2>
        <p>A lo largo del ciclo operativo de los pipelines, los ingenieros pueden encontrarse con errores comunes de infraestructura o autenticación. A continuación, se presenta la matriz de fallos conocidos y sus respectivas soluciones definitivas:</p>

        <h3>Fallo 1: <code>Execution failed for task ':sonar'. Unauthorized (401)</code></h3>
        <p><strong>Causa Raíz:</strong> Ocurre cuando el agente de ejecución de GitHub no puede autenticarse contra el servidor SaaS de SonarCloud. Esto se debe a un token caducado, borrado del panel del usuario o mal escrito en la sección de Secretos de GitHub.</p>
        <p><strong>Resolución de Ingeniería:</strong> Revise los Ajustes del Repositorio de GitHub y asegúrese de que el nombre coincide exactamente con <code>SONAR_TOKEN</code>. Genere un nuevo token en SonarCloud si es necesario y reemplace el valor anterior.</p>

        <h3>Fallo 2: <code>Failed to execute goal org.sonarsource.scanner.maven... Component has not been found</code></h3>
        <p><strong>Causa Raíz:</strong> Las claves asignadas al proyecto (<code>sonar.projectKey</code>) o la organización (<code>sonar.organization</code>) en las propiedades del archivo de configuración <code>pom.xml</code> no concuerdan de forma exacta con la realidad de los nombres registrados en el portal web de SonarQube Cloud.</p>
        <p><strong>Resolución de Ingeniería:</strong> Entre en la interfaz web de SonarCloud, acceda a la vista del proyecto, localice el panel inferior derecho llamado "Project Information" y valide las cadenas de texto del ID del proyecto, sustituyéndolas adecuadamente.</p>
        
        <h3>Fallo 3: <code>La Cobertura de Código (Coverage) se muestra siempre en 0.0%</code></h3>
        <p><strong>Causa Raíz:</strong> SonarQube Cloud no compila ni genera reportes de pruebas por sí mismo; solo lee reportes externos. Si el motor de pruebas de cobertura (JaCoCo en el caso de aplicaciones Java) no se ejecutó previamente al análisis de Sonar, no habrá datos disponibles para subir.</p>
        <p><strong>Resolución de Ingeniería:</strong> Asegúrese de que su comando de compilación use la fase <code>verify</code> de Maven en lugar de solo <code>compile</code>, lo que garantiza que JaCoCo escriba el binario ejecutable de métricas en la ruta por defecto <code>target/site/jacoco/jacoco.xml</code>.</p>
    </div>

    <div class="section">
        <h2>10. Conclusiones y Siguientes Pasos Operativos</h2>
        <p>La adopción de esta arquitectura integrada garantiza un desarrollo de software de clase mundial, robusto, seguro y escalable. A partir de este momento, cada confirmación de código que efectúen sus equipos de desarrollo de software será auditada de forma rigurosa y automática por las herramientas de instrumentación en la nube.</p>
        <p>Se aconseja como paso de evolución posterior configurar notificaciones personalizadas mediante Webhooks de Slack o Microsoft Teams para alertar instantáneamente a las células de desarrollo cuando un pipeline falle debido a políticas estrictas de seguridad o calidad insatisfecha.</p>
    </div>

</body>
</html>