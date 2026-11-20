# Chris Torres, portafolio de redacción

Sitio web estático (HTML y CSS, sin build) y versión PDF del portafolio.

## Estructura

| Ruta | Contenido |
|---|---|
| `public/` | Sitio publicado: `index.html`, `404.html`, `assets/`, `_headers`, PDF descargable |
| `pdf/portafolio.html` | Fuente de la versión PDF (A4, 4 páginas) |
| `scripts/build-pdf.ps1` | Genera `public/chris-torres-portafolio.pdf` con Chrome o Edge headless |
| `design/` | Diseño aprobado original (export de Claude Design) y su PDF |
| `wrangler.jsonc` | Configuración opcional para desplegar como Cloudflare Worker |

## Ver en local

```powershell
py -m http.server 8080 --directory public
```

Abrir http://localhost:8080.

## Regenerar el PDF

Cuando cambie el contenido o la URL pública:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/build-pdf.ps1 -SiteUrl "https://chris-torres.pages.dev"
```

## Publicación en Cloudflare Pages (integración con Git)

1. Cloudflare dashboard > Workers & Pages > Create > Pages > Connect to Git.
2. Autorizar la GitHub App de Cloudflare para la cuenta `ateneart10` y elegir este repositorio.
3. Configuración de build:
   - Production branch: `main`
   - Framework preset: `None`
   - Build command: vacío
   - Build output directory: `public`
4. Save and Deploy. Cada `git push` a `main` vuelve a publicar el sitio; las otras ramas generan previews.

Alternativa con Workers: Create > Workers > Import a repository. `wrangler.jsonc` ya apunta los assets a `public/`. Deploy command: `npx wrangler deploy`.

## Accesibilidad

- Estructura semántica (`header`, `nav`, `main`, `footer`), jerarquía de encabezados y `lang="es"`.
- Enlace "Saltar al contenido", foco visible y menú móvil con `aria-expanded` y cierre con Escape.
- Enlaces externos con texto descriptivo para lectores de pantalla y aviso de pestaña nueva.
- Contraste AA en textos, `prefers-reduced-motion` y `forced-colors` respetados.
