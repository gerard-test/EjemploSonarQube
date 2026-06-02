<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guía de Integración SonarQube Cloud | DevOps Portal</title>
    
    <script 
    src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"
    integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxpG6Ckv6pG1P5MNDoAuCEr0aKBslrY"
    crossorigin="anonymous"></script>

    <script 
    src="https://unpkg.com/lucide@0.525.0/dist/umd/lucide.min.js"
    integrity="sha384-9ndCyUa6mY5YhDbcQ0O5K3N5QfX1L5h7Q2JkFh2P3z9R4N6A8X2W5F7K8Y9Z1A2"
    crossorigin="anonymous"></script>


    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        body {
            font-family: 'Inter', sans-serif;
            background-color: #0b0f19;
        }
        .tab-content { display: none; }
        .tab-content.active { display: block; }
    </style>
</head>
<body class="text-slate-200 min-h-screen flex flex-col antialiased">

    <header class="border-b border-slate-800 bg-slate-900/50 backdrop-blur sticky top-0 z-50 px-6 py-4 flex flex-wrap justify-between items-center gap-4">
        <div class="flex items-center gap-3">
            <div class="bg-blue-600 p-2 rounded-lg text-white shadow-lg shadow-blue-500/20">
                <i data-lucide="shield-check" class="w-6 h-6"></i>
            </div>
            <div>
                <h1 class="text-lg font-bold text-white tracking-tight">DevSecOps Portal</h1>
                <p class="text-xs text-slate-400">Guía de Integración Continua</p>
            </div>
        </div>
        <div class="relative w-full sm:w-64">
            <i data-lucide="search" class="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2"></i>
            <input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="Buscar herramientas o roles..." 
                   class="w-full bg-slate-900 border border-slate-700 rounded-lg pl-9 pr-4 py-2 text-sm text-slate-200 placeholder-slate-500 focus:outline-none focus:border-blue-500 transition-colors">
        </div>
    </header>

    <main class="flex-1 max-w-6xl w-full mx-auto p-6 md:p-8 grid grid-cols-1 lg:grid-cols-4 gap-8">
        
        <aside class="lg:col-span-1">
            <nav class="flex lg:flex-col gap-2 overflow-x-auto pb-3 lg:pb-0 border-b lg:border-b-0 border-slate-800">
                <button onclick="switchTab(event, 'roadmap')" class="tab-btn w-full text-left px-4 py-3 rounded-xl flex items-center gap-3 text-sm font-medium bg-blue-600/10 text-blue-400 border border-blue-500/20 shadow-sm transition-all whitespace-nowrap">
                    <i data-lucide="compass" class="w-4 h-4"></i> Ruta de Aprendizaje
                </button>
                <button onclick="switchTab(event, 'audience')" class="tab-btn w-full text-left px-4 py-3 rounded-xl flex items-center gap-3 text-sm font-medium text-slate-400 hover:bg-slate-800/50 hover:text-slate-200 transition-all whitespace-nowrap">
                    <i data-lucide="users" class="w-4 h-4"></i> Audiencia Clave
                </button>
                <button onclick="switchTab(event, 'stack')" class="tab-btn w-full text-left px-4 py-3 rounded-xl flex items-center gap-3 text-sm font-medium text-slate-400 hover:bg-slate-800/50 hover:text-slate-200 transition-all whitespace-nowrap">
                    <i data-lucide="cpu" class="w-4 h-4"></i> Stack Tecnológico
                </button>
            </nav>
        </aside>

        <section class="lg:col-span-3 space-y-8">
            
            <div id="roadmap" class="tab-content active space-y-6">
                <div class="border border-slate-800 bg-slate-900/30 rounded-2xl p-6 shadow-xl">
                    <h2 class="text-xl font-semibold text-white mb-2 flex items-center gap-2">
                        <span class="w-1 h-5 bg-blue-500 rounded-full inline-block"></span>
                        SonarQube Cloud Integration Guide
                    </h2>
                    <p class="text-sm text-slate-400 mb-6">Sigue este flujo secuencial para automatizar el análisis estático de tu código de forma segura en tus pipelines.</p>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/60 flex gap-3 items-start hover:border-slate-700 transition-colors">
                            <div class="bg-emerald-500/10 text-emerald-400 p-1.5 rounded-lg shrink-0 mt-0.5">
                                <i data-lucide="check" class="w-4 h-4"></i>
                            </div>
                            <div>
                                <h3 class="text-sm font-semibold text-slate-200">¿Qué es SonarQube Cloud?</h3>
                                <p class="text-xs text-slate-400 mt-0.5">Comprensión de la plataforma SaaS para la inspección continua de la calidad del código.</p>
                            </div>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/60 flex gap-3 items-start hover:border-slate-700 transition-colors">
                            <div class="bg-emerald-500/10 text-emerald-400 p-1.5 rounded-lg shrink-0 mt-0.5">
                                <i data-lucide="check" class="w-4 h-4"></i>
                            </div>
                            <div>
                                <h3 class="text-sm font-semibold text-slate-200">Vinculación de Repositorios</h3>
                                <p class="text-xs text-slate-400 mt-0.5">Conexión e importación segura de proyectos desde GitHub a SonarQube Cloud.</p>
                            </div>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/60 flex gap-3 items-start hover:border-slate-700 transition-colors">
                            <div class="bg-emerald-500/10 text-emerald-400 p-1.5 rounded-lg shrink-0 mt-0.5">
                                <i data-lucide="check" class="w-4 h-4"></i>
                            </div>
                            <div>
                                <h3 class="text-sm font-semibold text-slate-200">Generación de Sonar Token</h3>
                                <p class="text-xs text-slate-400 mt-0.5">Creación de credenciales seguras de autenticación para el escáner.</p>
                            </div>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/60 flex gap-3 items-start hover:border-slate-700 transition-colors">
                            <div class="bg-emerald-500/10 text-emerald-400 p-1.5 rounded-lg shrink-0 mt-0.5">
                                <i data-lucide="check" class="w-4 h-4"></i>
                            </div>
                            <div>
                                <h3 class="text-sm font-semibold text-slate-200">Configuración de GitHub Secrets</h3>
                                <p class="text-xs text-slate-400 mt-0.5">Inyección de variables de entorno y tokens cifrados de manera segura.</p>
                            </div>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/60 flex gap-3 items-start hover:border-slate-700 transition-colors">
                            <div class="bg-emerald-500/10 text-emerald-400 p-1.5 rounded-lg shrink-0 mt-0.5">
                                <i data-lucide="check" class="w-4 h-4"></i>
                            </div>
                            <div>
                                <h3 class="text-sm font-semibold text-slate-200">Flujo de Trabajo YAML</h3>
                                <p class="text-xs text-slate-400 mt-0.5">Diseño y automatización del pipeline con GitHub Actions.</p>
                            </div>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/60 flex gap-3 items-start hover:border-slate-700 transition-colors">
                            <div class="bg-emerald-500/10 text-emerald-400 p-1.5 rounded-lg shrink-0 mt-0.5">
                                <i data-lucide="check" class="w-4 h-4"></i>
                            </div>
                            <div>
                                <h3 class="text-sm font-semibold text-slate-200">Análisis Estático (SAST)</h3>
                                <p class="text-xs text-slate-400 mt-0.5">Ejecución automatizada de escaneos para detectar Code Smells y Bugs.</p>
                            </div>
                        </div>
                    </div>

                    <div class="mt-6 border border-slate-800 rounded-xl overflow-hidden bg-slate-950/40 p-2">
                        <img src="assets/dashboard-mockup.png" alt="Esquema de Arquitectura CI/CD" class="w-full h-auto rounded-lg opacity-90 hover:opacity-100 transition-opacity">
                    </div>
                </div>

                <div class="border border-slate-800 bg-gradient-to-br from-slate-900 to-slate-950 rounded-2xl p-6 shadow-xl">
                    <h2 class="text-xl font-semibold text-white mb-4 flex items-center gap-2">
                        <span class="w-1 h-5 bg-amber-500 rounded-full inline-block"></span>
                        🔐 ¿Por qué es crítico implementar esta arquitectura?
                    </h2>
                    <div class="space-y-3">
                        <div class="flex items-center gap-3 p-3 rounded-lg hover:bg-slate-900/50 transition-colors target-search">
                            <i data-lucide="shield-alert" class="w-5 h-5 text-amber-500 shrink-0"></i>
                            <span class="text-sm text-slate-300 font-medium">Seguridad desde las primeras etapas del desarrollo (Shift Left Security)</span>
                        </div>
                        <div class="flex items-center gap-3 p-3 rounded-lg hover:bg-slate-900/50 transition-colors target-search">
                            <i data-lucide="zap" class="w-5 h-5 text-amber-500 shrink-0"></i>
                            <span class="text-sm text-slate-300 font-medium">Calidad de código y detección de vulnerabilidades 100% automatizada</span>
                        </div>
                        <div class="flex items-center gap-3 p-3 rounded-lg hover:bg-slate-900/50 transition-colors target-search">
                            <i data-lucide="git-branch" class="w-5 h-5 text-amber-500 shrink-0"></i>
                            <span class="text-sm text-slate-300 font-medium">Garantía de mejores prácticas en flujos modernos de CI/CD</span>
                        </div>
                        <div class="flex items-center gap-3 p-3 rounded-lg hover:bg-slate-900/50 transition-colors target-search">
                            <i data-lucide="building" class="w-5 h-5 text-amber-500 shrink-0"></i>
                            <span class="text-sm text-slate-300 font-medium">Implementación estandarizada de DevSecOps a nivel empresarial</span>
                        </div>
                    </div>
                </div>
            </div>

            <div id="audience" class="tab-content space-y-6">
                <div class="border border-slate-800 bg-slate-900/30 rounded-2xl p-6 shadow-xl">
                    <h2 class="text-xl font-semibold text-white mb-2 flex items-center gap-2">
                        <span class="w-1 h-5 bg-purple-500 rounded-full inline-block"></span>
                        Esta integración es fundamental para:
                    </h2>
                    <p class="text-sm text-slate-400 mb-6">Roles de ingeniería encargados de velar por la estabilidad, la infraestructura y el gobierno de TI.</p>
                    
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/50 flex items-center justify-between target-search">
                            <span class="text-sm font-semibold text-slate-200">Ingenieros de DevOps</span>
                            <span class="text-xs bg-purple-500/10 text-purple-400 px-2.5 py-1 rounded-full border border-purple-500/20 font-medium">Pipeline Target</span>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/50 flex items-center justify-between target-search">
                            <span class="text-sm font-semibold text-slate-200">Ingenieros de DevSecOps</span>
                            <span class="text-xs bg-red-500/10 text-red-400 px-2.5 py-1 rounded-full border border-red-500/20 font-medium">Security Target</span>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/50 flex items-center justify-between target-search">
                            <span class="text-sm font-semibold text-slate-200">Ingenieros de la Nube</span>
                            <span class="text-xs bg-blue-500/10 text-blue-400 px-2.5 py-1 rounded-full border border-blue-500/20 font-medium">Cloud Target</span>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/50 flex items-center justify-between target-search">
                            <span class="text-sm font-semibold text-slate-200">Administradores de GitHub Enterprise</span>
                            <span class="text-xs bg-slate-500/10 text-slate-300 px-2.5 py-1 rounded-full border border-slate-500/20 font-medium">Governance Target</span>
                        </div>
                    </div>
                </div>
            </div>

            <div id="stack" class="tab-content space-y-6">
                <div class="border border-slate-800 bg-slate-900/30 rounded-2xl p-6 shadow-xl">
                    <h2 class="text-xl font-semibold text-white mb-2 flex items-center gap-2">
                        <span class="w-1 h-5 bg-cyan-500 rounded-full inline-block"></span>
                        Herramientas utilizadas en el Stack
                    </h2>
                    <p class="text-sm text-slate-400 mb-6">Componentes técnicos clave requeridos para aprovisionar el entorno de desarrollo y validación.</p>
                    
                    <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/50 text-center space-y-2 target-search">
                            <div class="w-10 h-10 bg-slate-800 rounded-lg flex items-center justify-center mx-auto text-white">
                                <i data-lucide="github" class="w-5 h-5"></i>
                            </div>
                            <p class="text-sm font-medium text-slate-300">GitHub</p>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/50 text-center space-y-2 target-search">
                            <div class="w-10 h-10 bg-blue-500/10 rounded-lg flex items-center justify-center mx-auto text-blue-400">
                                <i data-lucide="play-circle" class="w-5 h-5"></i>
                            </div>
                            <p class="text-sm font-medium text-slate-300">GitHub Actions</p>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/50 text-center space-y-2 target-search">
                            <div class="w-10 h-10 bg-orange-500/10 rounded-lg flex items-center justify-center mx-auto text-orange-400">
                                <i data-lucide="cloud" class="w-5 h-5"></i>
                            </div>
                            <p class="text-sm font-medium text-slate-300">SonarQube Cloud</p>
                        </div>
                        <div class="p-4 rounded-xl border border-slate-800 bg-slate-900/50 text-center space-y-2 target-search">
                            <div class="w-10 h-10 bg-red-500/10 rounded-lg flex items-center justify-center mx-auto text-red-400">
                                <i data-lucide="code-2" class="w-5 h-5"></i>
                            </div>
                            <p class="text-sm font-medium text-slate-300">Maven / Java</p>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </main>

    <footer class="border-t border-slate-800 bg-slate-950 py-4 text-center text-xs text-slate-500">
        &copy; 2026 FhasfDev — Universidad Central del Ecuador — Dispositivos Móviles.
    </footer>

    <script>
        // Inicializar los íconos Lucide
        lucide.createIcons();

        // Lógica para cambiar de pestañas (Tabs)
        function switchTab(event, tabId) {
            // Ocultar todo el contenido de las pestañas
            const contents = document.querySelectorAll('.tab-content');
            contents.forEach(content => content.classList.remove('active'));

            // Quitar estilos activos de todos los botones
            const buttons = document.querySelectorAll('.tab-btn');
            buttons.forEach(btn => {
                btn.classList.remove('bg-blue-600/10', 'text-blue-400', 'border-blue-500/20', 'shadow-sm');
                btn.classList.add('text-slate-400');
            });

            // Mostrar pestaña seleccionada
            document.getElementById(tabId).classList.add('active');

            // Dar estilos activos al botón presionado
            event.currentTarget.classList.add('bg-blue-600/10', 'text-blue-400', 'border-blue-500/20', 'shadow-sm');
            event.currentTarget.classList.remove('text-slate-400');
        }

        // Buscador interactivo en tiempo real
        function searchFunction() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            
            // 1. Si busca algo, forzamos la visualización de todas las pestañas para auditar el contenido global
            const contents = document.querySelectorAll('.tab-content');
            if(input.length > 0) {
                contents.forEach(content => content.classList.add('active'));
            } else {
                // Si limpia el buscador, restablecemos el comportamiento inicial (solo roadmap activo)
                contents.forEach((content, index) => {
                    if(index === 0) content.classList.add('active');
                    else content.classList.remove('active');
                });
            }

            // 2. Filtrar elementos individuales que tengan la clase 'target-search' o las sub-tarjetas
            let items = document.querySelectorAll('.target-search, .p-4.rounded-xl.border');
            items.forEach(item => {
                let text = item.textContent.toLowerCase();
                if(text.includes(input)) {
                    item.style.display = ""; // Muestra el elemento
                    item.style.opacity = "1";
                } else {
                    item.style.display = "none"; // Oculta el elemento si no coincide
                }
            });
        }
    </script>
</body>
</html>
