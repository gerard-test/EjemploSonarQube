<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.security.SecureRandom" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Análisis Estático de Calidad de Código Automatizado</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #f0f4f9 0%, #e2ecf7 100%);
            --primary-color: #0b2545;
            --accent-blue: #007acc;
            --card-bg: rgba(255, 255, 255, 0.85);
            --neon-shadow: 0 10px 30px rgba(0, 122, 204, 0.08);
        }

        body {
            background: var(--bg-gradient);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            min-height: 100vh;
        }

        .main-card {
            background: linear-gradient(145deg, #ffffff, #f4f8fc);
            border-radius: 28px;
            border: 1px solid rgba(255, 255, 255, 0.7);
            box-shadow: 0 20px 40px rgba(11, 37, 69, 0.06);
            backdrop-filter: blur(10px);
        }

        .main-title {
            color: var(--primary-color);
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.5px;
        }

        .subtitle {
            color: #506680;
            font-weight: 600;
            letter-spacing: 1.5px;
        }

        .step-box {
            background-color: #ffffff;
            border: 1px solid rgba(226, 236, 247, 0.8);
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.02);
        }

        .step-header {
            font-size: 0.8rem;
            font-weight: 700;
            color: #7a8b9e;
        }

        .step-num {
            font-size: 1.6rem;
            font-weight: 800;
            color: #384d66;
        }

        .kpi-container {
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
            border: 1px solid rgba(0,0,0,0.03);
        }

        .kpi-card {
            background: #f8fafc;
            border-radius: 12px;
            border-left: 4px solid var(--accent-blue);
        }

        .kpi-title {
            font-size: 0.75rem;
            font-weight: 700;
            color: #64748b;
            letter-spacing: 0.5px;
        }

        .kpi-value {
            font-size: 1.4rem;
            font-weight: 800;
            color: #1e293b;
        }

        .display-mockup {
            max-width: 100%;
            height: auto;
            border-radius: 16px;
            box-shadow: 0 12px 32px rgba(0, 122, 204, 0.1);
        }

        .pipeline-wrapper {
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 16px;
            border: 1px solid rgba(226, 236, 247, 0.5);
        }

        .pipeline-step {
            background-color: #ffffff;
            border: 1px solid rgba(0,0,0,0.05);
            border-radius: 12px;
            font-weight: 700;
            font-size: 0.78rem;
            color: #334155;
        }

        .feature-badge {
            background-color: #ffffff;
            border: 1px solid rgba(0, 122, 204, 0.08);
            border-radius: 14px;
            font-weight: 700;
            font-size: 0.8rem;
            color: #1e293b;
        }
    </style>
</head>
<body class="py-4 py-md-5">

    <%
        // 1. ERROR DE SEGURIDAD (Security - Vulnerabilidad Crítica de XSS)
        // Recibir un parámetro directamente e imprimirlo sin sanitizar en el HTML posterior.
        String usuarioInseguro = request.getParameter("user"); 

        // 2. ERROR DE FIABILIDAD (Reliability - Bug de ejecución potencial)
        // Provocar un NullPointerException garantizado o usar un flujo que Sonar detecte como bucle infinito/inutilizable.
        String cadenaNula = null;
        try {
            if (cadenaNula.equals("test")) { 
                // Esto siempre fallará en ejecución, SonarQube detecta el Bug de desreferencia nula.
                out.println("No se ejecutará");
            }
        } catch (Exception e) {
            // 3. ERROR DE MANTENIBILIDAD (Maintainability - Code Smell por mala gestión de excepciones)
            e.printStackTrace(); // Anti-patrón severo: expone trazas de error y no usa un Logger estructurado.
        }

        // Code Smell Extra de Mantenibilidad: Código muerto/inútil y variables declaradas que no se usan.
        int variableInutil = 42; 
        String cadenaVacia = "";
    %>
    <div class="container">
        <div class="card main-card p-4 p-lg-5">
            
            <header class="mb-4">
                <h1 class="display-6 main-title text-uppercase mb-2">
                    Análisis Estático de Calidad<br>
                    de Código Automatizado<br>
                    con GitHub Actions
                </h1>
                <p class="subtitle text-uppercase small m-0">Integrando SonarQube Cloud</p>
                
                <% if(usuarioInseguro != null) { %>
                    <div class="alert alert-warning mt-2">Bienvenido: <%= usuarioInseguro %></div>
                <% } %>
            </header>

            <div class="row g-4 mb-4">
                
                <div class="col-xl-8 col-lg-7">
                    
                    <div class="row g-3 mb-4">
                        <div class="col-md-4">
                            <div class="step-box p-3 h-100 d-flex flex-column justify-content-between">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="step-num">01.</span>
                                    <span class="badge bg-light text-primary step-header text-uppercase">Disparador de Commit</span>
                                </div>
                                <div class="small text-muted"><i class="fa-solid fa-code-commit text-accent me-2"></i>commits 0,00.00s</div>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="step-box p-3 h-100 d-flex flex-column justify-content-between">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="step-num">02.</span>
                                    <span class="badge bg-light text-primary step-header text-uppercase">Flujo de Trabajo</span>
                                </div>
                                <div class="small text-muted"><i class="fa-solid fa-arrows-spin text-accent me-2"></i>GitHub Actions Workflow</div>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="step-box p-3 h-100 d-flex flex-column justify-content-between">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="step-num">03.</span>
                                    <span class="badge bg-light text-primary step-header text-uppercase">Escaneo Sonar</span>
                                </div>
                                <div class="small text-muted"><i class="fa-solid fa-cloud-sun text-accent me-2"></i>sonarqube cloud</div>
                            </div>
                        </div>
                    </div>

                    <div class="text-center p-2 bg-white rounded-4 border border-light shadow-sm">
                        <img src="assets/dashboard-mockup.png" alt="Esquema de Análisis Automatizado" class="display-mockup">
                    </div>

                </div>

                <div class="col-xl-4 col-lg-5">
                    <div class="kpi-container p-4 h-100 d-flex flex-column justify-content-between">
                        <div>
                            <div class="d-flex align-items-center justify-content-between pb-2 mb-3 border-bottom">
                                <h3 class="h6 text-uppercase fw-bold m-0 text-secondary"><i class="fa-solid fa-chart-pie me-2 text-primary"></i>Resumen Ejecutivo</h3>
                                <i class="fa-solid fa-brain text-info fs-5"></i>
                            </div>
                            
                            <div class="kpi-card p-3 mb-3">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <span class="kpi-title d-block text-uppercase">Tiempo de Análisis <span class="badge bg-light text-muted fw-normal">KPI</span></span>
                                        <span class="kpi-value">1h 45<span class="fs-6 fw-semibold text-muted">min</span></span>
                                    </div>
                                    <i class="fa-solid fa-chart-simple text-primary pt-1"></i>
                                </div>
                            </div>
                            
                            <div class="kpi-card p-3 mb-3" style="border-left-color: #ef4444;">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <span class="kpi-title d-block text-uppercase">Conteo de Errores <span class="badge bg-light text-muted fw-normal">KPI</span></span>
                                        <span class="kpi-value text-danger">206</span>
                                    </div>
                                    <i class="fa-solid fa-bug text-danger pt-1"></i>
                                </div>
                            </div>
                            
                            <div class="kpi-card p-3 mb-3" style="border-left-color: #10b981;">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <span class="kpi-title d-block text-uppercase">Olores de Código <span class="badge bg-light text-muted fw-normal">KPI</span></span>
                                        <span class="kpi-value text-success">0</span>
                                    </div>
                                    <i class="fa-solid fa-wand-magic-sparkles text-success pt-1"></i>
                                </div>
                            </div>
                        </div>

                        <div class="pt-3 border-top bg-light p-3 rounded-3 mt-3">
                            <span class="text-uppercase text-muted d-block mb-2" style="font-size: 0.7rem; font-weight:700;">Tecnología Base</span>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="fw-bold small text-dark"><i class="fa-solid fa-cube text-warning me-2"></i>Java Web App (pom.xml)</span>
                                <span class="badge bg-dark">Maven</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="mb-4">
                <div class="pipeline-wrapper p-3">
                    <div class="row g-2 align-items-center text-center">
                        <div class="col"><div class="pipeline-step p-2"><i class="fa-solid fa-users text-primary me-1"></i>Equipo Desarrollo</div></div>
                        <div class="col-auto text-muted small d-none d-md-block"><i class="fa-solid fa-chevron-right"></i></div>
                        <div class="col"><div class="pipeline-step p-2"><i class="fa-brands fa-git-alt text-danger me-1"></i>Repositorio Git</div></div>
                        <div class="col-auto text-muted small d-none d-md-block"><i class="fa-solid fa-chevron-right"></i></div>
                        <div class="col"><div class="pipeline-step p-2"><i class="fa-solid fa-gears text-secondary"></i>Construcción Maven</div></div>
                        <div class="col-auto text-muted small d-none d-md-block"><i class="fa-solid fa-chevron-right"></i></div>
                        <div class="col"><div class="pipeline-step p-2"><i class="fa-solid fa-network-wired text-success"></i>GH Actions Workflow</div></div>
                        <div class="col-auto text-muted small d-none d-md-block"><i class="fa-solid fa-chevron-right"></i></div>
                        <div class="col"><div class="pipeline-step p-2"><i class="fa-solid fa-shield-halved text-info me-1"></i>Análisis Sonar</div></div>
                        <div class="col-auto text-muted small d-none d-md-block"><i class="fa-solid fa-chevron-right"></i></div>
                        <div class="col"><div class="pipeline-step p-2"><i class="fa-solid fa-square-poll-vertical text-dark me-1"></i>Reporte Final</div></div>
                    </div>
                </div>
            </div>

            <footer>
                <div class="row g-2 text-center">
                    <div class="col-md col-6">
                        <div class="feature-badge p-3 h-100 d-flex flex-column align-items-center justify-content-center">
                            <i class="fa-solid fa-magnifying-glass text-primary mb-2 fs-5"></i>
                            <span>Mayor Calidad de Código</span>
                        </div>
                    </div>
                    <div class="col-md col-6">
                        <div class="feature-badge p-3 h-100 d-flex flex-column align-items-center justify-content-center">
                            <i class="fa-solid fa-gauge-high text-info mb-2 fs-5"></i>
                            <span>Entrega Más Rápida</span>
                        </div>
                    </div>
                    <div class="col-md col-6">
                        <div class="feature-badge p-3 h-100 d-flex flex-column align-items-center justify-content-center">
                            <i class="fa-solid fa-arrow-down-short-wide text-danger mb-2 fs-5"></i>
                            <span>Deuda Técnica Reducida</span>
                        </div>
                    </div>
                    <div class="col-md col-6">
                        <div class="feature-badge p-3 h-100 d-flex flex-column align-items-center justify-content-center">
                            <i class="fa-solid fa-clipboard-check text-success mb-2 fs-5"></i>
                            <span>Cumplimiento Automatizado</span>
                        </div>
                    </div>
                    <div class="col-md col-12">
                        <div class="feature-badge p-3 h-100 d-flex flex-column align-items-center justify-content-center">
                            <i class="fa-solid fa-users-gear text-dark mb-2 fs-5"></i>
                            <span>Colaboración Mejorada</span>
                        </div>
                    </div>
                </div>
            </footer>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
