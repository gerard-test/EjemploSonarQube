<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guía de Integración SonarQube Cloud</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --bg-color: #f0f4f9;
            --primary-color: #0b2545;
            --accent-blue: #007acc;
            --accent-purple: #6f42c1;
        }

        body {
            background-color: var(--bg-color);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        /* Contenedor principal estilo tarjeta holográfica de la imagen */
        .main-card {
            background: linear-gradient(145deg, #ffffff, #e6eef8);
            border-radius: 24px;
            border: none;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.05);
        }

        /* Títulos e Identidad Visual */
        .main-title {
            color: var(--primary-color);
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.5px;
        }

        .subtitle {
            color: var(--accent-blue);
            font-weight: 700;
            letter-spacing: 1px;
        }

        /* Tarjetas de pasos (01, 02, 03) */
        .step-card {
            background-color: #ffffff;
            border: 1px solid rgba(0, 122, 204, 0.15);
            border-radius: 16px;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .step-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.05);
        }

        .step-number {
            font-size: 1.75rem;
            font-weight: 800;
            color: var(--accent-blue);
        }

        .step-badge {
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            color: #6c757d;
        }

        /* Panel de Resumen Ejecutivo (KPI Lateral) */
        .kpi-panel {
            background-color: var(--primary-color);
            border-radius: 16px;
            color: #ffffff;
        }

        .kpi-title {
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #cbd5e1;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .kpi-label {
            font-size: 0.75rem;
            text-transform: uppercase;
            color: #94a3b8;
        }

        /* Nodo de flujo horizontal */
        .pipeline-container {
            background-color: rgba(255, 255, 255, 0.6);
            border-radius: 16px;
        }

        .pipeline-node {
            background-color: #ffffff;
            border: 1px solid rgba(0,0,0,0.06);
            border-radius: 10px;
            font-weight: 700;
            font-size: 0.85rem;
            color: var(--primary-color);
            box-shadow: 0 4px 6px rgba(0,0,0,0.01);
        }

        /* Tarjetas de beneficios del footer */
        .benefit-card {
            background-color: rgba(0, 122, 204, 0.05);
            border: 1px solid rgba(0, 122, 204, 0.1);
            border-radius: 12px;
            font-weight: 700;
            font-size: 0.9rem;
            color: var(--primary-color);
            transition: background-color 0.2s;
        }

        .benefit-card:hover {
            background-color: rgba(0, 122, 204, 0.1);
        }
    </style>
</head>
<body class="py-5">

    <div class="container">
        <div class="card main-card p-4 p-md-5">
            
            <header class="mb-5">
                <h1 class="display-5 main-title text-uppercase mb-2">
                    Análisis Estático de Calidad<br>
                    de Código Automatizado<br>
                    con GitHub Actions
                </h1>
                <p class="subtitle text-uppercase m-0">Integrando SonarQube Cloud</p>
            </header>

            <div class="row g-4 mb-5">
                
                <div class="col-lg-8">
                    <div class="row g-3">
                        
                        <div class="col-md-4">
                            <div class="step-card p-4 h-100">
                                <div class="d-flex align-items-center justify-content-between mb-3">
                                    <span class="step-number">01.</span>
                                    <span class="step-badge">Disparador</span>
                                </div>
                                <ul class="list-unstyled m-0">
                                    <li class="mb-2 text-secondary small"><i class="fa-solid fa-circle-check text-success me-2"></i>¿Qué es SonarQube Cloud?</li>
                                    <li class="text-secondary small"><i class="fa-solid fa-circle-check text-success me-2"></i>Conectar repositorio</li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="step-card p-4 h-100">
                                <div class="d-flex align-items-center justify-content-between mb-3">
                                    <span class="step-number">02.</span>
                                    <span class="step-badge">Flujo CI/CD</span>
                                </div>
                                <ul class="list-unstyled m-0">
                                    <li class="mb-2 text-secondary small"><i class="fa-solid fa-circle-check text-success me-2"></i>Generar token Sonar</li>
                                    <li class="text-secondary small"><i class="fa-solid fa-circle-check text-success me-2"></i>Configurar secretos</li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="step-card p-4 h-100">
                                <div class="d-flex align-items-center justify-content-between mb-3">
                                    <span class="step-number">03.</span>
                                    <span class="step-badge">Escaneo</span>
                                </div>
                                <ul class="list-unstyled m-0">
                                    <li class="mb-2 text-secondary small"><i class="fa-solid fa-circle-check text-success me-2"></i>Crear YAML Actions</li>
                                    <li class="text-secondary small"><i class="fa-solid fa-circle-check text-success me-2"></i>Ejecutar análisis</li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="kpi-panel p-4 h-100 d-flex flex-column justify-content-between">
                        <div>
                            <h3 class="kpi-title pb-2 mb-3">Resumen Ejecutivo</h3>
                            
                            <div class="mb-3">
                                <span class="kpi-label d-block mb-1">Herramientas Clave</span>
                                <div class="fw-bold mb-1"><i class="fa-brands fa-github text-info me-2"></i>GitHub Actions</div>
                                <div class="fw-bold"><i class="fa-solid fa-cloud text-info me-2"></i>SonarQube Cloud</div>
                            </div>
                        </div>
                        
                        <div class="mt-3">
                            <span class="kpi-label d-block mb-1">Stack Soportado</span>
                            <div class="fw-bold"><i class="fa-solid fa-cube text-warning me-2"></i>Maven / Java</div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="mb-5">
                <h4 class="h6 text-uppercase fw-bold text-muted mb-3">Flujo del pipeline & Roles de Ingeniería</h4>
                <div class="pipeline-container p-3">
                    <div class="row g-2 align-items-center text-center">
                        <div class="col-md col-12"><div class="pipeline-node p-2"><i class="fa-solid fa-users me-2 text-primary"></i>DevSecOps / DevOps</div></div>
                        <div class="col-md-auto col-12 text-muted d-none d-md-block"><i class="fa-solid fa-chevron-right"></i></div>
                        <div class="col-md col-12"><div class="pipeline-node p-2"><i class="fa-brands fa-git-alt me-2 text-danger"></i>Git Repo</div></div>
                        <div class="col-md-auto col-12 text-muted d-none d-md-block"><i class="fa-solid fa-chevron-right"></i></div>
                        <div class="col-md col-12"><div class="pipeline-node p-2"><i class="fa-solid fa-gears me-2 text-secondary"></i>Maven Build</div></div>
                        <div class="col-md-auto col-12 text-muted d-none d-md-block"><i class="fa-solid fa-chevron-right"></i></div>
                        <div class="col-md col-12"><div class="pipeline-node p-2"><i class="fa-solid fa-network-wired me-2 text-success"></i>GH Actions</div></div>
                        <div class="col-md-auto col-12 text-muted d-none d-md-block"><i class="fa-solid fa-chevron-right"></i></div>
                        <div class="col-md col-12"><div class="pipeline-node p-2"><i class="fa-solid fa-square-poll-vertical me-2 text-info"></i>Sonar Report</div></div>
                    </div>
                </div>
            </div>

            <footer>
                <h2 class="h5 fw-bold mb-3 text-dark"><i class="fa-solid fa-shield-halved me-2 text-primary"></i>¿Por qué es importante esta implementación?</h2>
                <div class="row g-3">
                    <div class="col-sm-6 col-lg-3">
                        <div class="benefit-card p-3 text-center h-100 d-flex flex-column align-items-center justify-content-center">
                            <i class="fa-solid fa-shield-cat-vampire mb-2 text-primary fs-4"></i>
                            Seguridad Temprana
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="benefit-card p-3 text-center h-100 d-flex flex-column align-items-center justify-content-center">
                            <i class="fa-solid fa-robot mb-2 text-primary fs-4"></i>
                            Calidad Automatizada
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="benefit-card p-3 text-center h-100 d-flex flex-column align-items-center justify-content-center">
                            <i class="fa-solid fa-bolt mb-2 text-primary fs-4"></i>
                            Prácticas CI/CD
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="benefit-card p-3 text-center h-100 d-flex flex-column align-items-center justify-content-center">
                            <i class="fa-solid fa-building-shield mb-2 text-primary fs-4"></i>
                            DevSecOps Empresarial
                        </div>
                    </div>
                </div>
            </footer>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>