# AGENTS.md

Proyecto: portafolio web y PDF de Chris Torres (redacción editorial). Fuente de verdad: este archivo y `README.md`.
El punto de retomar vive en la sección "Retomar aquí" de este archivo.

## Reglas del proyecto

- Sitio estático puro en `public/`; sin frameworks ni build. Mantener el diseño aprobado de `design/CV Chris Torres.html`.
- Tokens de color y tipografía en `:root` de `public/assets/css/styles.css`.
- Si cambia el contenido de trabajos, servicios o trayectoria, actualizar también `pdf/portafolio.html` y regenerar el PDF con `scripts/build-pdf.ps1`.
- Python local: `py` (venv si hace falta). PDF: Chrome o Edge headless.

## Retomar aquí

- Fase: publicado y en mantenimiento.
- Hecho (2026-11-20): sitio estático responsive y accesible en `public/`; PDF de 4 páginas en `public/chris-torres-portafolio.pdf` (ya apunta a la URL final); enlaces externos verificados (HTTP 200).
- Repo: https://github.com/ateneart10/portafolio (público, rama `main`). En esta máquina `gh` tiene dos cuentas; la activa es `ateneart10`.
- Producción: https://chris-torres.pages.dev (Cloudflare Pages, proyecto `chris-torres`, cuenta Cloudflare de ateneart10, build output `public`, sin build command). Cada push a `main` despliega solo.
- Última decisión: `canonical`, `og:url` y `og:image` absolutos hacia `chris-torres.pages.dev`.
- Pendiente de aprobación: ninguno.
- Decisiones abiertas: dominio propio opcional (si se agrega, actualizar `canonical`/`og:*` y regenerar el PDF con `-SiteUrl`).
- Siguiente paso exacto: ninguno obligatorio; para cambios de contenido, editar `public/index.html` y `pdf/portafolio.html`, regenerar PDF, commit y push.
