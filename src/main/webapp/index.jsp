<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guía de Integración SonarQube Cloud</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --primary: #2563eb;
            --primary-light: #eff6ff;
            --success: #10b981;
            --success-light: #ecfdf5;
            --accent: #4f46e5;
            --border-radius: 12px;
            --shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05), 0 2px 4px -2px rgb(0 0 0 / 0.05);
            --transition: all 0.3s ease;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
            line-height: 1.6;
            padding: 40px 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
        }

        /* Header */
        header {
            text-align: center;
            margin-bottom: 40px;
        }

        header h1 {
            font-size: 2.5rem;
            color: var(--primary);
            font-weight: 700;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        header p {
            color: var(--text-muted);
            font-size: 1.1rem;
        }

        /* Grid Layout */
        .main-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
        }

        @media (max-width: 768px) {
            .main-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Cards Estilo Base */
        .card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 24px;
            box-shadow: var(--shadow);
            border: 1px solid #e2e8f0;
            margin-bottom: 25px;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-main);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            border-bottom: 2px solid #f1f5f9;
            padding-bottom: 10px;
        }

        /* Pipeline Steps (Lista de verificación mejorada) */
        .pipeline-steps {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .step-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 14px 18px;
            background: var(--success-light);
            border-left: 4px solid var(--success);
            border-radius: 4px var(--border-radius) var(--border-radius) 4px;
            transition: var(--transition);
        }

        .step-item:hover {
            transform: translateX(5px);
        }

        .step-item i {
            color: var(--success);
            font-size: 1.2rem;
        }

        .step-item p {
            font-weight: 500;
            color: #065f46;
        }

        /* Listas Estilizadas */
        .custom-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .custom-list li {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 8px 0;
            color: var(--text-main);
        }

        .roles-list li i { color: var(--primary); }
        .tools-list li i { color: var(--accent); }
        .benefits-list li i { color: var(--success); }

        /* Badges para Herramientas */
        .tools-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }

        .badge {
            background: var(--primary-light);
            color: var(--primary);
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 6px;
            border: 1px solid #dbeafe;
        }

        .badge-accent {
            background: #faf5ff;
            color: var(--accent);
            border-color: #f3e8ff;
        }
    </style>
</head>
<body>

    <div class="container">
        
        <header>
            <h1><i class="fa-solid to fa-shield-halved"></i> CI/CD DevSecOps</h1>
            <p>Guía de Integración Continua con SonarQube Cloud y GitHub Actions</p>
        </header>

        <div class="main-grid">
            
            <main>
                <div class="card">
                    <h2 class="card-title"><i class="fa-solid fa-list-check"></i> Objetivos del Pipeline</h2>
                    <div class="pipeline-steps">
                        <div class="step-item">
                            <i class="fa-solid fa-circle-check"></i>
                            <p>¿Qué es SonarQube Cloud y su alcance?</p>
                        </div>
                        <div class="step-item">
                            <i class="fa-solid fa-circle-check"></i>
                            <p>Conectar repositorios de GitHub a SonarQube Cloud</p>
                        </div>
                        <div class="step-item">
                            <i class="fa-solid fa-circle-check"></i>
                            <p>Generación segura de Sonar Tokens</p>
                        </div>
                        <div class="step-item">
                            <i class="fa-solid fa-circle-check"></i>
                            <p>Configuración de Secretos en GitHub (Actions Secrets)</p>
                        </div>
                        <div class="step-item">
                            <i class="fa-solid fa-circle-check"></i>
                            <p>Creación del flujo de trabajo YAML automatizado</p>
                        </div>
                        <div class="step-item">
                            <i class="fa-solid fa-circle-check"></i>
                            <p>Ejecución y análisis estático de código (SAST)</p>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <h2 class="card-title" style="color: var(--success);"><i class="fa-solid fa-lock"></i> ¿Por qué es importante esta integración?</h2>
                    <ul class="custom-list benefits-list">
                        <li><i class="fa-solid fa-circle-nodes"></i> <strong>Seguridad Shift-Left:</strong> Inyección de seguridad desde las primeras etapas del desarrollo.</li>
                        <li><i class="fa-solid fa-robot"></i> <strong>Calidad automatizada:</strong> Control de bugs, code smells y vulnerabilidades sin intervención manual.</li>
                        <li><i class="fa-solid fa-gavel"></i> <strong>Buenas prácticas:</strong> Estandarización de flujos de trabajo de CI/CD modernos.</li>
                        <li><i class="fa-solid fa-building-shield"></i> <strong>Cultura DevSecOps:</strong> Implementación de políticas de calidad a nivel empresarial.</li>
                    </ul>
                </div>
            </main>

            <aside>
                <div class="card">
                    <h2 class="card-title"><i class="fa-solid fa-users"></i> Dirigido a:</h2>
                    <ul class="custom-list roles-list">
                        <li><i class="fa-solid fa-terminal"></i> Ingenieros de DevOps</li>
                        <li><i class="fa-solid fa-user-shield"></i> Ingenieros de DevSecOps</li>
                        <li><i class="fa-solid fa-cloud"></i> Ingenieros de la Nube</li>
                        <li><i class="fa-solid fa-sitemap"></i> Admins de GitHub Enterprise</li>
                    </ul>
                </div>

                <div class="card">
                    <h2 class="card-title"><i class="fa-solid fa-screwdriver-wrench"></i> Stack Tecnológico</h2>
                    <div class="tools-grid">
                        <span class="badge"><i class="fa-brands fa-github"></i> GitHub</span>
                        <span class="badge"><i class="fa-solid fa-play"></i> Actions</span>
                        <span class="badge badge-accent"><i class="fa-solid fa-radar"></i> SonarQube</span>
                        <span class="badge badge-accent"><i class="fa-solid fa-mug-hot"></i> Maven / Java</span>
                    </div>
                </div>
            </aside>

        </div>
    </div>

</body>
</html>
