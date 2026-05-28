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
            max-width: 900px;
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

        /* Barra de Progreso Interactiva */
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

        /* Lista de verificación interactiva */
        .section-tasks { 
            background: var(--primary-light);
            padding: 20px 25px;
            border-radius: 8px;
            border-left: 5px solid var(--primary);
        }

        .task-item {
            display: flex;
            align-items: center;
            padding: 10px 0;
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
            font-size: 1.1rem;
            transition: color 0.3s ease, text-decoration 0.3s ease;
        }

        .task-item input[type="checkbox"]:checked + span {
            color: #7f8c8d;
            text-decoration: line-through;
        }

        /* Estilos de las secciones informativas */
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
    
    <p>Haz clic en cada objetivo de la guía para medir tu progreso en la integración de calidad de código:</p>
    
    <div class="progress-container">
        <div class="progress-bar" id="progressBar"></div>
    </div>

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
    // Permite marcar la casilla haciendo clic en cualquier parte de la fila
    function toggleTask(element) {
        const checkbox = element.querySelector('input[type="checkbox"]');
        if (event.target !== checkbox) {
            checkbox.checked = !checkbox.checked;
            updateProgress();
        }
    }

    // Calcula el porcentaje completado y actualiza la barra
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

