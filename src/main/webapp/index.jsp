<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard DevSecOps: SonarQube Cloud</title>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;700&family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --bg-main: #0b0f19;
            --bg-card: #131a26;
            --bg-card-hover: #1c2536;
            --border-color: #222f43;
            --text-title: #ffffff;
            --text-body: #94a3b8;
            --primary: #38bdf8;       /* Celeste Cyber */
            --accent: #a855f7;        /* Púrpura DevSecOps */
            --success: #34d399;       /* Verde Pipeline */
            --code-bg: #070a12;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg-main);
            color: var(--text-body);
            line-height: 1.6;
            padding: 40px 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Header con estética de Dashboard */
        header {
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 25px;
            margin-bottom: 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .header-title h1 {
            color: var(--text-title);
            font-size: 2rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .header-title h1 span {
            color: var(--primary);
        }

        .status-badge {
            background: rgba(52, 211, 153, 0.1);
            border: 1px solid var(--success);
            color: var(--success);
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* Progreso del Pipeline interactivo */
        .progress-container {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 30px;
        }

        .progress-text {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-weight: 600;
            color: var(--text-title);
        }

        .progress-bar-bg {
            background: var(--border-color);
            height: 8px;
            border-radius: 4px;
            overflow: hidden;
        }

        .progress-bar-fill {
            background: linear-gradient(90deg, var(--primary), var(--accent));
            width: 0%;
            height: 100%;
            transition: width 0.4s ease;
        }

        /* Layout Grid */
        .dashboard-grid {
            display: grid;
            grid-template-columns: 7fr 4fr;
            gap: 30px;
        }

        @media (max-width: 992px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Tarjetas Estilo Cyber */
        .panel {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 30px;
            transition: border-color 0.3s ease;
        }

        .panel:hover {
            border-color: #334155;
        }

        .panel-title {
            color: var(--text-title);
            font-size: 1.25rem;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        /* Lista de Pasos con Checkbox Oculto pero Funcional */
        .interactive-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .step-label {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 14px;
            background: #172030;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .step-label:hover {
            background: var(--bg-card-hover);
            border-color: var(--primary);
        }

        .step-label input[type="checkbox"] {
            appearance: none;
            width: 20px;
            height: 20px;
            border: 2px solid var(--text-body);
            border-radius: 4px;
            outline: none;
            cursor: pointer;
            position: relative;
            transition: all 0.2s ease;
        }

        .step-label input[type="checkbox"]:checked {
            background-color: var(--success);
            border-color: var(--success);
        }

        .step-label input[type="checkbox"]:checked::after {
            content: "\f00c";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            color: #000;
            font-size: 11px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .step-label input[type="checkbox"]:checked + span {
            text-decoration: line-through;
            color: #64748b;
        }

        .step-label span {
            font-weight: 500;
            color: var(--text-title);
            transition: color 0.2s ease;
        }

        /* Listas e Íconos */
        .panel-list {
            list-style: none;
        }

        .panel-list li {
            margin-bottom: 14px;
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }

        .panel-list li i {
            margin-top: 5px;
        }

        /* Sección de código simulada */
        .code-snippet {
            font-family: 'JetBrains Mono', monospace;
            background-color: var(--code-bg);
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 15px;
            font-size: 0.9rem;
            color: #e2e8f0;
            overflow-x: auto;
        }

        .code-comment { color: #64748b; }
        .code-keyword { color: var(--accent); }
        .code-string { color: var(--success); }

        /* Tech Badges */
        .tech-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .tag {
            background: #1e293b;
            border: 1px solid #334155;
            color: #e2e8f0;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }
    </style>
</head>
<body>

    <div class="container">
        
        <header>
            <div class="header-title">
                <h1>SonarQube <span>Cloud Integration</span></h1>
                <p style="margin-top: 5px;">Automatización de Análisis Estático de Código (SAST)</p>
            </div>
            <div class="status-badge">
                <i class="fa-solid fa-circle-dot animate-pulse"></i> Pipeline Activo
            </div>
        </header>

        <div class="progress-container">
            <div class="progress-text">
                <span>Progreso de la Implementación</span>
                <span id="progress-percentage">0%</span>
            </div>
            <div class="progress-bar-bg">
                <div class="progress-bar-fill" id="progress-bar"></div>
            </div>
        </div>

        <div class="dashboard-grid">
            
            <main>
                <div class="panel">
                    <h2 class="panel-title"><i class="fa-solid fa-square-check" style="color: var(--primary);"></i> Checklist de Integración</h2>
                    <div class="interactive-list">
                        <label class="step-label">
                            <input type="checkbox" class="pipeline-checkbox">
                            <span>¿Qué es SonarQube Cloud y su alcance?</span>
                        </label>
                        <label class="step-label">
                            <input type="checkbox" class="pipeline-checkbox">
                            <span>Conexión del repositorio GitHub a SonarQube Cloud</span>
                        </label>
                        <label class="step-label">
                            <input type="checkbox" class="pipeline-checkbox">
                            <span>Generación del Token de Acceso en Sonar</span>
                        </label>
                        <label class="step-label">
                            <input type="checkbox" class="pipeline-checkbox">
                            <span>Configuración de Secrets en el Repositorio de GitHub</span>
                        </label>
                        <label class="step-label">
                            <input type="checkbox" class="pipeline-checkbox">
                            <span>Estructuración del flujo de trabajo YAML para Actions</span>
                        </label>
                        <label class="step-label">
                            <input type="checkbox" class="pipeline-checkbox">
                            <span>Ejecución del análisis de código automatizado</span>
                        </label>
                    </div>
                </div>

                <div class="panel">
                    <h2 class="panel-title"><i class="fa-solid fa-code" style="color: var(--accent);"></i> Ejemplo de Configuración GitHub Actions</h2>
                    <div class="code-snippet">
                        <span class="code-keyword">name:</span> <span class="code-string">SonarQube Analysis</span><br>
                        <span class="code-keyword">on:</span> [push, pull_request]<br>
                        <span class="code-keyword">jobs:</span><br>
                        &nbsp;&nbsp;<span class="code-keyword">sonarcloud:</span><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;<span class="code-keyword">runs-on:</span> ubuntu-latest<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;<span class="code-keyword">steps:</span><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <span class="code-keyword">uses:</span> actions/checkout@v4<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- <span class="code-keyword">name:</span> Analyze with SonarCloud<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="code-keyword">env:</span><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="code-keyword">SONAR_TOKEN:</span> ${{ secrets.SONAR_TOKEN }}
                    </div>
                </div>
            </main>

            <aside>
                <div class="panel">
                    <h2 class="panel-title"><i class="fa-solid fa-circle-nodes" style="color: var(--success);"></i> Core DevSecOps</h2>
                    <ul class="panel-list">
                        <li>
                            <i class="fa-solid fa-shield-halved" style="color: var(--success);"></i>
                            <div>
                                <strong style="color: var(--text-title);">Seguridad Shift-Left</strong>
                                <p style="font-size: 0.9rem;">Detección temprana de vulnerabilidades antes de compilar a producción.</p>
                            </div>
                        </li>
                        <li>
                            <i class="fa-solid fa-bolt" style="color: var(--primary);"></i>
                            <div>
                                <strong style="color: var(--text-title);">Calidad Automatizada</strong>
                                <p style="font-size: 0.9rem;">Métricas de cobertura de pruebas, bugs y duplicación de código en cada Push.</p>
                            </div>
                        </li>
                        <li>
                            <i class="fa-solid fa-gears" style="color: var(--accent);"></i>
                            <div>
                                <strong style="color: var(--text-title);">Ecosistema CI/CD</strong>
                                <p style="font-size: 0.9rem;">Integración transparente con flujos de trabajo empresariales modernos.</p>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="panel">
                    <h2 class="panel-title"><i class="fa-solid fa-layer-group"></i> Stack de Ingeniería</h2>
                    <div class="tech-tags" style="margin-bottom: 20px;">
                        <span class="tag"><i class="fa-brands fa-github"></i> GitHub Enterprise</span>
                        <span class="tag"><i class="fa-solid fa-circle-play" style="color:var(--success);"></i> Actions</span>
                        <span class="tag"><i class="fa-solid fa-cloud" style="color:var(--primary);"></i> SonarCloud</span>
                        <span class="tag"><i class="fa-solid fa-box" style="color:var(--accent);"></i> Maven / Java</span>
                    </div>

                    <h2 class="panel-title" style="font-size: 1.1rem;"><i class="fa-solid fa-user-gear"></i> Roles Clave</h2>
                    <div class="tech-tags">
                        <span class="tag">DevOps Engineer</span>
                        <span class="tag">DevSecOps Specialist</span>
                        <span class="tag">Cloud Architect</span>
                    </div>
                </div>
            </aside>

        </div>
    </div>