<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guía de Integración SonarQube Cloud</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --bg-color: #f0f4f9;
            --primary-color: #0b2545;
            --accent-blue: #007acc;
            --accent-purple: #6f42c1;
            --text-dark: #333333;
            --card-bg: #ffffff;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            padding: 40px 20px;
            color: var(--text-dark);
            display: flex;
            justify-content: center;
        }

        .container {
            max-width: 1200px;
            width: 100%;
            background: linear-gradient(145deg, #ffffff, #e6eef8);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
        }

        /* Encabezado Principal */
        .header-section {
            margin-bottom: 40px;
        }

        .header-section h1 {
            color: var(--primary-color);
            font-size: 2.5rem;
            margin: 0 0 10px 0;
            text-transform: uppercase;
            letter-spacing: -0.5px;
            font-weight: 800;
            line-height: 1.2;
        }

        .header-section p {
            color: var(--accent-blue);
            font-size: 1.2rem;
            font-weight: 600;
            margin: 0;
            text-transform: uppercase;
        }

        /* Grid Principal (Izquierda: Pasos, Derecha: KPIs) */
        .main-layout {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
            margin-bottom: 40px;
        }

        @media (max-width: 900px) {
            .main-layout { grid-template-columns: 1fr; }
        }

        /* Pasos del Proceso (Estilo 01, 02, 03) */
        .steps-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }

        .step-card {
            background: var(--card-bg);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
            border: 1px solid rgba(0, 122, 204, 0.1);
            position: relative;
        }

        .step-number {
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--accent-blue);
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 10px;
        }

        .step-number span {
            font-size: 0.9rem;
            color: #666;
            text-transform: uppercase;
            font-weight: 600;
        }

        .step-card p {
            margin: 5px 0;
            font-size: 0.95rem;
            color: #555;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .step-card p i {
            color: #28a745;
            font-size: 0.85rem;
        }

        /* Panel de Resumen Ejecutivo (KPIs) */
        .kpi-panel {
            background: var(--primary-color);
            color: #ffffff;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(11, 37, 69, 0.2);
        }

        .kpi-panel h3 {
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            padding-bottom: 10px;
            color: #cbd5e1;
        }

        .kpi-item {
            margin-bottom: 20px;
        }

        .kpi-item:last-child { margin-bottom: 0; }

        .kpi-label {
            font-size: 0.8rem;
            text-transform: uppercase;
            color: #94a3b8;
            display: block;
            margin-bottom: 2px;
        }

        .kpi-value {
            font-size: 1.4rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .kpi-value i {
            color: #38bdf8;
        }

        /* Flujo de Trabajo (Pipeline Inferior) */
        .pipeline-section {
            margin-bottom: 40px;
        }

        .pipeline-section h2 {
            color: var(--primary-color);
            font-size: 1.3rem;
            margin-bottom: 20px;
        }

        .pipeline {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            align-items: center;
            background: rgba(255, 255, 255, 0.6);
            padding: 20px;
            border-radius: 15px;
            border: 1px solid rgba(0,0,0,0.05);
        }

        .pipeline-node {
            background: var(--card-bg);
            padding: 12px 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.02);
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--primary-color);
            display: flex;
            align-items: center;
            gap: 8px;
            border: 1px solid rgba(0,0,0,0.05);
        }

        .pipeline-node i {
            color: var(--accent-purple);
        }

        .pipeline-arrow {
            color: #94a3b8;
            font-size: 1.2rem;
        }

        @media (max-width: 768px) {
            .pipeline { flex-direction: column; align-items: stretch; }
            .pipeline-arrow { text-align: center; transform: rotate(90deg); margin: 5px 0; }
        }

        /* Beneficios (Barra Inferior) */
        .benefits-bar {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }

        .benefit-card {
            background: rgba(0, 122, 204, 0.06);
            border: 1px solid rgba(0, 122, 204, 0.1);
            padding: 15px;
            border-radius: 12px;
            text-align: center;
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--primary-color);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
            transition: transform 0.2s;
        }

        .benefit-card:hover {
            transform: translateY(-3px);
            background: rgba(0, 122, 204, 0.1);
        }

        .benefit-card i {
            font-size: 1.3rem;
            color: var(--accent-blue);
        }
    </style>
</head>
<body>

    <div class="container">
        
        <div class="header-section">
            <h1>Análisis Estático de Calidad<br>de Código Automatizado<br>con GitHub Actions</h1>
            <p>Integrando SonarQube Cloud</p>
        </div>

        <div class="main-layout">
            
            <div class="steps-container">
                <div class="step-card">
                    <div class="step-number">01. <span>Disparador</span></div>
                    <p><i class="fa-solid : fa-circle-check"></i> ¿Qué es SonarQube Cloud?</p>
                    <p><i class="fa-solid : fa-circle-check"></i> Conectar repositorio</p>
                </div>
                
                <div class="step-card">
                    <div class="step-number">02. <span>CI/CD Workflow</span></div>
                    <p><i class="fa-solid : fa-circle-check"></i> Generar token Sonar</p>
                    <p><i class="fa-solid : fa-circle-check"></i> Configurar secretos</p>
                </div>
                
                <div class="step-card">
                    <div class="step-number">03. <span>Sonar Scan</span></div>
                    <p><i class="fa-solid : fa-circle-check"></i> Crear archivo YAML</p>
                    <p><i class="fa-solid : fa-circle-check"></i> Ejecutar análisis</p>
                </div>
            </div>

            <div class="kpi-panel">
                <h3>Resumen Ejecutivo</h3>
                <div class="kpi-item">
                    <span class="kpi-label">Herramientas Utilizadas</span>
                    <span class="kpi-value"><i class="fa-brands fa-github"></i> GitHub Actions</span>
                    <span class="kpi-value" style="font-size: 1.1rem; margin-top: 5px;"><i class="fa-solid fa-cloud"></i> SonarQube Cloud</span>
                </div>
                <div class="kpi-item">
                    <span class="kpi-label">Entorno / Stack</span>
                    <span class="kpi-value"><i class="fa-solid fa-cube"></i> Maven / Java</span>
                </div>
            </div>

        </div>

        <div class="pipeline-section">
            <h2>Flujo de Integración y Roles Clave</h2>
            <div class="pipeline">
                <div class="pipeline-node"><i class="fa-solid fa-users"></i> DevOps / DevSecOps</div>
                <div class="pipeline-arrow"><i class="fa-solid fa-chevron-right"></i></div>
                <div class="pipeline-node"><i class="fa-brands fa-git-alt"></i> Repositorio Git</div>
                <div class="pipeline-arrow"><i class="fa-solid fa-chevron-right"></i></div>
                <div class="pipeline-node"><i class="fa-solid fa-gears"></i> Construcción (Maven)</div>
                <div class="pipeline-arrow"><i class="fa-solid fa-chevron-right"></i></div>
                <div class="pipeline-node"><i class="fa-solid fa-network-wired"></i> GitHub Actions</div>
                <div class="pipeline-arrow"><i class="fa-solid fa-chevron-right"></i></div>
                <div class="pipeline-node"><i class="fa-solid fa-magnifying-glass-chart"></i> Reporte SonarQube</div>
            </div>
        </div>

        <h2>🔐 ¿Por qué es importante esta integración?</h2>
        <div class="benefits-bar">
            <div class="benefit-card">
                <i class="fa-solid fa-shield-halved"></i>
                Seguridad Temprana
            </div>
            <div class="benefit-card">
                <i class="fa-solid fa-robot"></i>
                Calidad Automatizada
            </div>
            <div class="benefit-card">
                <i class="fa-solid fa-gauge-high"></i>
                Prácticas CI/CD
            </div>
            <div class="benefit-card">
                <i class="fa-solid fa-building-shield"></i>
                DevSecOps Empresarial
            </div>
        </div>

    </div>

</body>
</html>
