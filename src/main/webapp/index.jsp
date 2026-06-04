<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guía de Integración SonarQube Cloud</title>
    <style>
        :root {
            --primary: #0056b3;
            --primary-light: #e6f0fa;
            --success: #28a745;
            --dark: #2c3e50;
            --bg: #f8f9fa;
            --card-bg: #ffffff;
        }

        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            line-height: 1.6; 
            padding: 40px 20px; 
            color: var(--dark); 
            background-color: var(--bg);
            margin: 0;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: var(--card-bg);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        h1 {
            color: var(--primary);
            border-bottom: 3px solid var(--primary-light);
            padding-bottom: 15px;
            margin-top: 0;
            font-size: 2.2rem;
        }

        h2 { 
            color: var(--primary); 
            margin-top: 35px;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        /* Barra de Progreso */
        .progress-container {
            background: #eee;
            border-radius: 8px;
            height: 20px;
            width: 100%;
            margin: 25px 0;
            overflow: hidden;
        }

        .progress-bar {
            background: linear-gradient(90deg, var(--primary), var(--success));
            height: 100%;
            width: 0%;
            transition: width 0.4s ease;
        }

        /* Bloque principal: Tareas + Imagen */
        .main-workspace {
            display: grid;
            grid-template-columns: 1.2fr 0.8fr;
            gap: 30px;
            align-items: start;
            margin-bottom: 30px;
        }

        @media (max-width: 850px) {
            .main-workspace { grid-template-columns: 1fr; }
        }

        .section-tasks { 
            background: var(--primary-light);
            padding: 20px 25px;
            border-radius: 8px;
            border-left: 5px solid var(--primary);
            height: 100%;
            box-sizing: border-box;
        }

        .task-item {
            display: flex;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid rgba(0,86,179,0.1);
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .task-item:last-child {
            border-bottom: none;
        }

        .task-item:hover {
            transform: translateX(5px);
        }

        .task-item input[type="checkbox"] {
            margin-right: 15px;
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: var(--success);
        }

        .task-item span {
            font-size: 1.05rem;
            transition: color 0.3s ease, text-decoration 0.3s ease;
        }

        .task-item input[type="checkbox"]:checked + span {
            color: #7f8c8d;
            text-decoration: line-through;
        }

        /* Contenedor de la Imagen del Dashboard */
        .mockup-container {
            background: #ffffff;
            border: 2px dashed #cbd5e1;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
        }

        .mockup-container h3 {
            margin-top: 0;
            font-size: 1rem;
            color: #64748b;
        }

        .mockup-img {
            max-width: 100%;
            height: auto;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            transition: transform 0.3s ease;
        }

        .mockup-img:hover {
            transform: scale(1.03);
        }

        /* Cuadrícula de Información Inferior */
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            .grid { grid-template-columns: 1fr; }
        }

        .card {
            background: #fdfdfd;
            border: 1px solid #e2e8f0;
            padding: 20px;
            border-radius: 8px;
            transition: box-shadow 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        ul {
            padding-left: 20px;
            margin: 0;
        }

        li {
            margin-bottom: 10px;
            list-style-type: none;
            position: relative;
        }

        li::before {
            content: "•";
            color: var(--primary);
            font-weight: bold;
            display: inline-block;
            width: 1em;
            margin-left: -1em;
        }

        .security-list li::before {
            content: "✔";
            color: var(--success);
        }
    </style>
</head>
<body>

<div class="container">
    <h1>🚀 Pipeline CI/CD: DevOps & DevSecOps</h1>
    
    <p>Haz clic en cada objetivo de la guía para medir tu progreso en la integración y visualizar el avance:</p>
    
    <div class="progress-container">
        <div class="progress-bar" id="progressBar"></div>
    </div>

    <div class="main-workspace">
        <div class="section-tasks"> 
            <div class="task-item" onclick="toggleTask(this)">
                <input type="checkbox" onchange="updateProgress()">
                <span>¿Qué es SonarQube Cloud?</span>
            </div>
            <div class="task-item" onclick="toggleTask(this)">
                <input type="checkbox" onchange="updateProgress()">
                <span>Cómo conectar un repositorio de GitHub a SonarQube Cloud</span>
            </div>
            <div class="task-item" onclick="toggleTask(this)">
                <input type="checkbox" onchange="updateProgress()">
                <span>Generar token de Sonar</span>
            </div>
            <div class="task-item" onclick="toggleTask(this)">
                <input type="checkbox" onchange="updateProgress()">
                <span>Configurar secretos de GitHub</span>
            </div>
            <div class="task-item" onclick="toggleTask(this)">
                <input type="checkbox" onchange="updateProgress()">
                <span>Crear flujo de trabajo YAML para GitHub Actions</span>
            </div>
            <div class="task-item" onclick="toggleTask(this)">
                <input type="checkbox" onchange="updateProgress()">
                <span>Ejecutar análisis estático automatizado de código</span>
            </div>
        </div>

        <div class="mockup-container">
            <h3>📊 Flujo de Trabajo (Workflow) Completo de Integración Continua (CI)</h3>
            <img src="assets/dashboard-mockup.png" alt="SonarQube Dashboard Mockup" class="mockup-img">
        </div>
    </div>

    <div class="grid">
        <div class="card">
            <h2>🎯 Integración fundamental para:</h2>
            <ul>
                <li>Ingenieros de DevOps</li>
                <li>Ingenieros de DevSecOps</li>
                <li>Ingenieros de la nube</li>
                <li>Administradores de GitHub Enterprise</li>
            </ul>
        </div>

        <div class="card">
            <h2>🛠️ Herramientas utilizadas:</h2>
            <ul>
                <li>GitHub / GitHub Actions</li>
                <li>SonarQube Cloud</li>
                <li>Maven & Java (App Web)</li>
                <li>Jetty Server</li>
            </ul>
        </div>
    </div>

    <div class="card" style="margin-top: 25px;">
        <h2>🔐 ¿Por qué es importante?</h2>
        <ul class="security-list">
            <li>Seguridad desde las primeras etapas del desarrollo (Shift-Left Security)</li>
            <li>Calidad de código e inspección automatizada</li>
            <li>Mejores prácticas de arquitectura CI/CD</li>
            <li>Implementación de DevSecOps a nivel empresarial</li>
        </ul>
    </div>
</div>

<script>
    function toggleTask(element) {
        const checkbox = element.querySelector('input[type="checkbox"]');
        if (event.target !== checkbox) {
            checkbox.checked = !checkbox.checked;
            updateProgress();
        }
    }

    function updateProgress() {
        const checkboxes = document.querySelectorAll('.task-item input[type="checkbox"]');
        const checkedCount = Array.from(checkboxes).filter(cb => cb.checked).length;
        const totalCount = checkboxes.length;
        
        const percentage = Math.round((checkedCount / totalCount) * 100);
        const progressBar = document.getElementById('progressBar');
        
        progressBar.style.width = percentage + '%';
    }
</script>

</body>
</html>

