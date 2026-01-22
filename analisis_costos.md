# PetAuthority - Análisis de Costos 💰

## Resumen Ejecutivo

| Categoría | Costo Inicial | Costo Mensual | Costo Anual |
|-----------|---------------|---------------|-------------|
| **Desarrollo** | $15,000 - $35,000 | - | - |
| **Infraestructura** | - | $85 - $200 | $1,020 - $2,400 |
| **GPS Tracking (100 usuarios)** | $5,000 - $15,000 | $500 - $1,000 | $6,000 - $12,000 |
| **TOTAL ESTIMADO** | $20,000 - $50,000 | $585 - $1,200 | $7,020 - $14,400 |

---

## 1. Costos de Desarrollo 👨‍💻

### Estimación por Componente

| Componente | Horas Estimadas | Tarifa/Hora (LATAM) | Costo Total |
|------------|-----------------|---------------------|-------------|
| **Backend (Spring Boot)** | 80-120 hrs | $40-60/hr | $3,200 - $7,200 |
| **App Móvil (Flutter)** | 120-180 hrs | $40-65/hr | $4,800 - $11,700 |
| **Portal Web (React)** | 60-100 hrs | $35-55/hr | $2,100 - $5,500 |
| **Base de Datos + Infraestructura** | 30-50 hrs | $50-70/hr | $1,500 - $3,500 |
| **Testing + QA** | 40-60 hrs | $30-45/hr | $1,200 - $2,700 |
| **DevOps + Deployment** | 30-50 hrs | $45-65/hr | $1,350 - $3,250 |

**Total Desarrollo: $14,150 - $33,850 USD**

### Tarifas por Hora en Latinoamérica (2025)
| Nivel | Rango |
|-------|-------|
| Junior (1-2 años) | $25-40/hr |
| Mid-level (3-4 años) | $40-65/hr |
| Senior (5+ años) | $65-95/hr |
| Tech Lead | $95-145/hr |

---

## 2. Infraestructura Cloud ☁️

### Opción A: AWS (Producción Básica)

| Servicio | Especificaciones | Costo Mensual |
|----------|------------------|---------------|
| **EC2 t3.small** (Backend) | 2 vCPU, 2GB RAM | $15 |
| **EC2 t3.micro** (Web) | 1 vCPU, 1GB RAM | $8 |
| **RDS PostgreSQL** (db.t3.micro) | 1 vCPU, 1GB RAM, 20GB | $15 |
| **DocumentDB/MongoDB Atlas** | Shared Tier | $0 (Free) - $25 |
| **S3** (Imágenes) | 50GB | $1 |
| **CloudFront CDN** | 100GB transfer | $10 |
| **Route 53** (DNS) | 1 zona | $0.50 |
| **Elastic Load Balancer** | 1 ALB | $18 |
| **Data Transfer** | 100GB out | $9 |

**Total AWS Estimado: $77 - $100/mes**

### Opción B: DigitalOcean (Más Económica)

| Servicio | Especificaciones | Costo Mensual |
|----------|------------------|---------------|
| **Droplet** (Backend + Web) | 2 vCPU, 4GB RAM | $24 |
| **Managed PostgreSQL** | Basic, 1GB | $15 |
| **Spaces** (Storage) | 250GB + CDN | $5 |
| **Load Balancer** | 1 | $12 |

**Total DigitalOcean: $56/mes**

### Opción C: Heroku/Railway (Startups)

| Servicio | Especificaciones | Costo Mensual |
|----------|------------------|---------------|
| **Heroku Eco Dynos** | 2 apps | $10 |
| **Heroku Postgres** | Mini | $5 |
| **MongoDB Atlas** | Shared | $0 |

**Total Heroku: $15/mes** (limitado, solo para MVP)

---

## 3. Licencias API GPS & Tracking 📍

### APIs de Mapas y Geolocalización

| Proveedor | Límite Gratis | Costo Después del Límite |
|-----------|---------------|-------------------------|
| **Google Maps Platform** | $200/mes crédito | $7/1000 llamadas geolocation |
| **Mapbox** | 100k requests/mes | $0.50-1.00/1000 requests |
| **OpenStreetMap (Nominatim)** | Sin límite | GRATIS (self-hosted) |
| **HERE Location Services** | 250k requests/mes | $1/1000 requests |

### Plataformas de Tracking como Servicio

| Plataforma | Uso | Costo |
|------------|-----|-------|
| **Tractive API** (si disponible) | Integración B2B | Bajo NDA, contactar ventas |
| **Tile Location Platform** | SDK Enterprise | $10,000+ contrato |
| **TrackR/Amazon Sidewalk** | Consumer grade | No API pública |

### Estimación para 100 usuarios activos
| Concepto | Costo Mensual |
|----------|---------------|
| Google Maps (ubicaciones) | $20-50 |
| Reverse Geocoding | $10-30 |
| Push Notifications (Firebase) | $0 (gratis hasta 10k/día) |

**Total APIs Mapping: $30-80/mes**

---

## 4. Dispositivos GPS para Mascotas 🐕

### Opciones de Dispositivos GPS

| Dispositivo | Precio Unitario | Suscripción/Mes | Target |
|-------------|-----------------|-----------------|--------|
| **Tractive GPS Dog 4** | $50 | $5-8 | Consumer |
| **Fi Smart Collar v3** | $149-199 | $8-19 | Premium |
| **Whistle Go Explore** | $130 | $8 | Consumer |
| **AirTag + Holder** | $35 | $0 | Bajo costo (sin GPS real) |
| **Petcube GPS** | $159 | $9-13 | Premium |

### Opción Mayorista (White-Label)

| Proveedor | Precio/Unidad (MOQ 100+) | Características |
|-----------|-------------------------|-----------------|
| **ReachFar Factory** | $7-27 | GPS, SIM, API básica |
| **Generic China GPS** | $7-15 | Básico, sin garantía |
| **Queclink** | $25-45 | Industrial, alta calidad |

### Modelo de Negocio PetAuthority

**Opción 1: Revender dispositivos existentes**
- Compra: $50 (Tractive) → Venta: $80-100
- Margen: 60-100%
- Suscripción: $10/mes (compartida con proveedor)

**Opción 2: White-Label propio**
- Inversión inicial: $10,000-25,000 (100-500 dispositivos)
- Costo unitario: $15-25
- Venta: $60-80
- Margen: 200-300%
- Requiere: Acuerdo con carrier celular para SIM/datos

---

## 5. Costos Celulares (Datos GPS) 📶

Los dispositivos GPS requieren conexión celular (2G/LTE-M) para transmitir ubicación.

| Tipo | Costo/SIM/Mes | Proveedor |
|------|---------------|-----------|
| **IoT SIM Global** | $1-3 | Hologram, Twilio, 1NCE |
| **Plan carrier nacional** | $3-8 | Claro, Movistar, etc. |
| **eSIM IoT** | $1.50-4 | Truphone, Soracom |

**Para 100 dispositivos: $150-400/mes**

---

## 6. Resumen de Costos Totales

### Escenario: Startup (100 usuarios, 50 dispositivos GPS)

| Concepto | Inicial | Mensual | Anual |
|----------|---------|---------|-------|
| Desarrollo | $15,000 | - | - |
| AWS/Cloud | - | $85 | $1,020 |
| APIs (Maps, etc.) | - | $50 | $600 |
| Dispositivos GPS (50 units) | $2,500 | - | - |
| SIM/Datos IoT (50 devices) | - | $100 | $1,200 |
| Dominio + SSL | $50 | - | $50 |
| Apple Developer | $99 | - | $99 |
| Google Play Developer | $25 | - | $25 |
| **TOTAL** | **$17,674** | **$235** | **$2,994** |

### Escenario: Crecimiento (1,000 usuarios, 500 dispositivos)

| Concepto | Inicial | Mensual | Anual |
|----------|---------|---------|-------|
| Desarrollo + mejoras | $35,000 | - | - |
| AWS/Cloud (escalado) | - | $350 | $4,200 |
| APIs Premium | - | $200 | $2,400 |
| Dispositivos GPS (500 units) | $12,500 | - | - |
| SIM/Datos IoT (500 devices) | - | $1,000 | $12,000 |
| Marketing inicial | $5,000 | - | - |
| Soporte técnico | - | $500 | $6,000 |
| **TOTAL** | **$52,500** | **$2,050** | **$24,600** |

---

## 7. Modelo de Monetización Sugerido

| Producto | Precio Sugerido | Margen |
|----------|-----------------|--------|
| **App Premium** (mensual) | $4.99/mes | Alto |
| **App Premium** (anual) | $39.99/año | Alto |
| **GPS Device** (venta) | $79.99 | 50-100% |
| **GPS Tracking** (suscripción) | $9.99/mes | 40-60% |
| **Pack Completo** (device + 1 año) | $159.99 | 45% |

### Break-Even Analysis (100 usuarios premium)
- Ingresos: 100 × $9.99 = **$999/mes**
- Costos operativos: ~$235/mes
- **Profit: ~$764/mes** ✅

---

*Documento generado: Enero 2026*
*Precios sujetos a variación según región y proveedores*

