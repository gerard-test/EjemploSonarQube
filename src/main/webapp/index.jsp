<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard DevSecOps: SonarQube Cloud</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous">
    
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;700&family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" 
          rel="stylesheet"crossorigin="anonymous">
    
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" 
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" 
          crossorigin="anonymous" 
          referrerpolicy="no-referrer" />
    
    <style>
        :root {
            --bg-main: #0b0f19;
            --bg-card: #131a26;
            --bg-card-hover: #1c2536;
            --border-color: #222f43;
            --text-title: #ffffff;
            --text-body: #94a3b8;
            --primary: #38bdf8;
            --accent: #a855f7;
            --success: #34d399;
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

        .step-label input[type="checkbox"]:checked + span {
            text-decoration: line-through;
            color: #64748b;
        }

        .step-label span {
            font-weight: 500;
            color: var(--text-title);
            transition: color 0.2s ease;
        }

        .panel-list {
            list-style: none;
        }

        .panel-list li {
            margin-bottom: 16px;
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }

        .panel-list li i {
            margin-top: 4px;
            font-size: 1.1rem;
        }

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
                <h1>Guía de Integración <span>SonarQube Cloud</span></h1>
                <p style="margin-top: 5px;">Automatización del Análisis Estático de Código (SAST) en Pipelines CI/CD</p>
            </div>
            <div class="status-badge">
                🟢 Pipeline listo
            </div>
        </header>

        <div class="progress-container">
            <div class="progress-text">
                <span>Progreso de la Integración</span>
                <span id="progress-percentage">0%</span>
            </div>
            <div class="progress-bar-bg">
                <div class="progress-bar-fill" id="progress-bar"></div>
            </div>
        </div>

        <div class="dashboard-grid">
            
            <main>
                <div class="panel">
                    <h2 class="panel-title">📋 Checklist de Implementación</h2>
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
                            <span>Generación del Token de Acceso seguro en Sonar</span>
                        </label>
                        <label class="step-label">
                            <input type="checkbox" class="pipeline-checkbox">
                            <span>Configuración de Secrets cifrados en el Repositorio de GitHub</span>
                        </label>
                        <label class="step-label">
                            <input type="checkbox" class="pipeline-checkbox">
                            <span>Estructuración del flujo de trabajo YAML para GitHub Actions</span>
                        </label>
                        <label class="step-label">
                            <input type="checkbox" class="pipeline-checkbox">
                            <span>Ejecución del análisis estático automatizado de código</span>
                        </label>
                    </div>
                </div>

                <div class="panel">
                    <h2 class="panel-title">🔐 ¿Por qué es fundamental esta integración?</h2>
                    <ul class="panel-list">
                        <li>
                            <span style="color: var(--success); font-weight: bold;">✔</span>
                            <div>
                                <strong style="color: var(--text-title);">Seguridad Shift-Left</strong>
                                <p style="font-size: 0.9rem;">Detección e interceptación de vulnerabilidades en las etapas tempranas de desarrollo antes de compilar a entornos productivos.</p>
                            </div>
                        </li>
                        <li>
                            <span style="color: var(--primary); font-weight: bold;">✔</span>
                            <div>
                                <strong style="color: var(--text-title);">Calidad Automatizada</strong>
                                <p style="font-size: 0.9rem;">Inspección continua de bugs, olores de código (code smells) y porcentaje de código duplicado en cada push.</p>
                            </div>
                        </li>
                        <li>
                            <span style="color: var(--accent); font-weight: bold;">✔</span>
                            <div>
                                <strong style="color: var(--text-title);">Cultura DevSecOps Empresarial</strong>
                                <p style="font-size: 0.9rem;">Adopción de flujos de trabajo estandarizados bajo arquitecturas modernas y robustas de integración y despliegue continuos.</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </main>

            <aside>
                <div class="panel">
                    <h2 class="panel-title">👥 Roles de Ingeniería Destinados</h2>
                    <div class="tech-tags">
                        <span class="tag"><i class="fas fa-user-shield"></i> DevOps Engineer</span>
                        <span class="tag"><i class="fas fa-shield-alt"></i> DevSecOps Specialist</span>
                        <span class="tag"><i class="fas fa-server"></i> Cloud Architect</span>
                        <span class="tag"><i class="fas fa-sitemap"></i> GitHub Enterprise Admin</span>
                    </div>
                </div>

                <div class="panel">
                    <h2 class="panel-title">🛠️ Ecosistema Tecnológico</h2>
                    <div class="tech-tags">
                        <span class="tag"><i class="fab fa-github"></i> GitHub Ecosystem</span>
                        <span class="tag"><i class="fas fa-play-circle"></i> GitHub Actions</span>
                        <span class="tag"><i class="fas fa-search-code"></i> SonarQube Cloud</span>
                        <span class="tag"><i class="fab fa-java"></i> Maven / Java Archetype</span>
                    </div>
                </div>
            </aside>

        </div>
    </div>

    <script>
        const checkboxes = document.querySelectorAll('.pipeline-checkbox');
        const progressBar = document.getElementById('progress-bar');
        const progressPercentage = document.getElementById('progress-percentage');

        function updateProgress() {
            const total = checkboxes.length;
            const checked = document.querySelectorAll('.pipeline-checkbox:checked').length;
            const percentage = Math.round((checked / total) * 100);
            
            progressBar.style.width = `${percentage}%`;
            progressPercentage.innerText = `${percentage}%`;
        }

        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', updateProgress);
        });
    </script>
</body>
</html>