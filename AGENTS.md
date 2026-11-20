# AGENTS.md

Proyecto: portafolio web y PDF de Chris Torres (redacción editorial). Fuente de verdad: este archivo y `README.md`.
El punto de retomar vive en la sección "Retomar aquí" de este archivo.

## Reglas del proyecto

- Sitio estático puro en `public/`; sin frameworks ni build. Mantener el diseño aprobado de `design/CV Chris Torres.html`.
- Tokens de color y tipografía en `:root` de `public/assets/css/styles.css`.
- Si cambia el contenido de trabajos, servicios o trayectoria, actualizar también `pdf/portafolio.html` y regenerar el PDF con `scripts/build-pdf.ps1`.
- Python local: `py` (venv si hace falta). PDF: Chrome o Edge headless.

## Retomar aquí

- Fase: publicación.
- Hecho (2026-11-20): sitio estático responsive y accesible en `public/`; PDF de 4 páginas en `public/chris-torres-portafolio.pdf`; enlaces externos verificados (HTTP 200); repo Git local inicializado con commit en `main`.
- Última decisión: Cloudflare Pages con Git integration, build output `public`, sin build command. `wrangler.jsonc` queda para la alternativa Workers.
- Pendiente de aprobación / acción del usuario:
  1. Autenticar `gh` con la cuenta `ateneart10` (hoy `gh` está logueado como otra cuenta) para crear el repo y hacer push.
  2. Conectar el repo en Cloudflare dashboard (requiere login y autorizar la GitHub App; lo hace el usuario).
- Decisiones abiertas: nombre del repo (propuesto `portafolio`), nombre del proyecto Cloudflare (propuesto `chris-torres`, URL `chris-torres.pages.dev`), dominio propio opcional.
- Siguiente paso exacto: con la URL pública final, regenerar el PDF con `-SiteUrl <url>`, poner `og:image` y `canonical` absolutos en `public/index.html`, commit y push.
