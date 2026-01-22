# PetAuthority 🐾

A premium pet management platform featuring a "Liquid Glass" aesthetic mobile app, a modern web dashboard, and a robust microservices backend. Inspired by high-end vehicle management systems, adapted for the care of your pets.

---

## 🚀 Quick Start Guide

Follow these steps to get the entire system running on your local machine.

### Prerequisites
Ensure you have the following installed:
- **Docker Desktop** (for databases)
- **Java 17 JDK** (for backend)
- **Node.js 18+** (for web portal)
- **Flutter SDK 3.10+** (for mobile app)

---

### 1. Infrastructure (Database)
Start the necessary databases (PostgreSQL) using Docker.

```bash
docker-compose up -d
```
*Wait a few seconds for the containers to initialize.*

---

### 2. Backend Services
The backend powers the data for both the mobile and web apps. It is a Spring Boot application.

**Location**: `backend/pet-service`

1. Open a terminal.
2. Navigate to the service directory:
   ```bash
   cd backend/pet-service
   ```
3. Run the application:
   ```bash
   # If you have Maven installed globally:
   mvn spring-boot:run
   
   # OR using the wrapper (if available):
   ./mvnw spring-boot:run
   ```
   
*The server will start on port **8082**.*

---

### 3. Web Portal (React + Vite)
The web interface for veterinarians and pet owners.

**Location**: `web_portal`

1. Open a **new** terminal.
2. Navigate to the web portal directory:
   ```bash
   cd web_portal
   ```
3. Install dependencies (first time only):
   ```bash
   npm install
   ```
4. Start the development server:
   ```bash
   npm run dev
   ```
5. Open your browser and go to: **http://localhost:5173**

---

### 4. Mobile App (Flutter)
The premium "Liquid Glass" mobile application.

**Location**: `mobile`

1. Open a **new** terminal.
2. Navigate to the mobile directory:
   ```bash
   cd mobile
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run on your Simulator/Emulator:
   ```bash
   flutter run
   ```

---

## 📂 Project Structure

- **`mobile/`**: Flutter application with "Liquid Glass" UI.
  - `lib/theme.dart`: Premium dark theme configuration.
  - `lib/widgets/glass_container.dart`: Custom glassmorphism component.
- **`web_portal/`**: React application with Tailwind CSS.
  - `src/components/Dashboard.jsx`: Main stats view.
- **`backend/`**: Java Spring Boot microservices.
  - `pet-service/`: Core logic for Pets, Medical Records, and Vaccines.

## 🔑 Key Features
- **Liquid Glass UI**: Premium aesthetic with blur effects and gradients.
- **Medical Tracking**: Track vaccines, vet visits, and medical notes.
- **Service Marketplace**: Find veterinarians, groomers, and more.
- **Cross-Platform**: Seamless experience on Mobile and Web.

---

## ❓ Troubleshooting

### Web Portal: "Safari Can't Open the Page" (HTTPS Error)
If Safari refuses to open `http://localhost:5173` because of "HTTPS-Only", try one of the following:
1.  **Use Chrome or Firefox**: They are less strict with localhost.
2.  **Use 127.0.0.1**: Open **http://127.0.0.1:5173** instead of localhost.
3.  **Disable HTTPS Upgrade**: In Safari Settings, ensure you don't have a setting enforcing HTTPS for all local connections.

---

*PetAuthority - Your Pet's Best Friend.*
*Elaborado por Mateo Cisneros y Jesus Guaygua*
