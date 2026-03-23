# Online Craft Business Management System (OCBMS)

**A Final Year BCA Project**
- **Student Name:** SOUMILY DAS
- **Enrolment No:** 2300785285
- **Study Centre Code:** 2800P (BIKASH BHAVAN)
- **Project Title:** ONLINE CRAFT BUSINESS MANAGEMENT SYSTEM

## Project Overview
The OCBMS is a complete, production-ready Full-Stack web application developed strictly according to the Software Development Life Cycle (SDLC) and IGNOU's technical constraints. It serves as a secure digital marketplace connecting Artisans directly with Customers, managed by System Administrators.

## Detailed Technical Stack
- **Back-End Application Logic:** Node.js
- **Web Framework:** Express.js (Modular Object-Oriented routes)
- **Database Architecture:** MySQL 8.0 (Relational Database Management System fully normalized to 3NF)
- **Front-End Interfaces:** HTML5, CSS3
- **Responsive Design System:** Bootstrap 5.3 Framework
- **Client-Side Scripting & AJAX:** JavaScript (jQuery 3.6.0)
- **Data Exchange Format:** JSON over REST APIs
- **Cryptographic Hashing:** `bcrypt` (10 salt rounds for secure password storage)
- **Authentication Mechanism:** JSON Web Tokens (JWT) mapped to secure `httpOnly` server-side Cookies
- **Database Security:** Parameterized Queries (PDO-style) via `mysql2/promise` to systematically prevent SQL Injection attacks.
- **Environment Management:** `dotenv` for handling secure server variables.

## Key Features Developed
- **Secure Authentication & RBAC**: Role-based access control exclusively tailored for Admins, Artisans, and Customers ensuring separation of concerns.
- **Product & Inventory Management**: Artisans can list, manage, and intricately track the physical stock quantities of their handcrafted items (Pottery, Woodwork, Jewelry, Textiles, Glass Art).
- **Shopping Cart & Checkout Flow**: Customers can seamlessly browse dynamically loaded storefronts, add items to a persistent cart, and process secure transactions with immediate stock deductibility directly written to the database.
- **Dynamic Dashboards**: Dedicated UI dashboards for every role showing distinct analytics, robust sales summaries, and custom order tracking.

---

## Deliverables Walkthrough
1. **Database Schema**: Fully normalized to 3NF in `schema.sql` supporting constraints and logical foreign keys. Includes data seeding scripts (`seed.sql`) to prepare the production environment.
2. **Backend Infrastructure**: `server.js` acts as the primary monolithic controller, handling cross-origin policies and static asset delivery.
3. **Business APIs**: Secure, modular routes for authentication (`/api/auth`), inventory management (`/api/inventory`), secure transactional order flows (`/api/orders`), and administrative analytical reports (`/api/reports`).
4. **Frontend Pages**: Responsive Bootstrap 5 enabled interfaces integrated securely via AJAX with our REST APIs (`index.html`, `login.html`, `dashboard.html`, `checkout.html`, etc.).

## Instructions to Run Locally
1. **Database Initialization Setup**
   - Open MySQL Workbench or the MySQL Command Line.
   - Run `schema.sql` to initialize the secure `ocbms` database and core relational tables.
   - Run `seed.sql` to populate sample products and test user accounts for immediate evaluation.
   - Ensure your `.env` contains the correct database operational credentials.
2. **Start the Node.js Main Server**
   - Open your command line terminal in the primary project directory.
   - Run `npm install` to build the `node_modules` dependency tree.
   - Run `node server.js`.
3. **Access the Web Application**
   - Navigate to `http://localhost:3000` in any web browser.
   - Log in seamlessly using a sample account (e.g., `admin@example.com` with the default password `pss123`).

---

## Application Gallery & Interfaces
*Below are the captured interface screenshots graphically showcasing the various views and responsive functional components underlying the complete Online Craft Business Management System.*

<br>

### 1. SQL Schema Run outputs
*main schema is in ```schema.sql``` and seed data is in ```seed.sql```*
![ss1](screenshots/Screenshot%20(38).png)

![ss2](screenshots/Screenshot%20(39).png)

![ss3](screenshots/Screenshot%20(40).png)

![ss4](screenshots/Screenshot%20(41).png)

### 2. Project folder architecture
*This is the project folder architecture of the project*
![Project folder architecture](screenshots/Screenshot%20(42).png)

### 3. Landing Page
*This is the landing page of the project*
![Landing Page](screenshots/Screenshot%20(43).png)

### 4. Login Page
*This is the login page of the project*
![Login Page](screenshots/Screenshot%20(44).png)

### 5. Registration Page
*This is the registration page of the project*
![Registration Page](screenshots/Screenshot%20(45).png)

### 6. User cart
*This is the user cart page of the project*
![User cart](screenshots/Screenshot%20(46).png)

### 7. User checkout
*This is the user checkout page of the project*
![User checkout](screenshots/Screenshot%20(47).png)

### 8. Admin Dashboard
*This is the admin dashboard of the project*
![Admin orders](screenshots/Screenshot%20(48).png)

### 9. Admin orders
*This is the admin orders page of the project*
![Admin orders](screenshots/Screenshot%20(49).png)

### 10. Seller dashboard
*This is the seller dashboard of the project*
![Seller dashboard](screenshots/Screenshot%20(50).png)

### 11. Seller add new product
*This is the seller add new product page of the project*
![Seller add new product](screenshots/Screenshot%20(51).png)

### 12. Seller add new product category
*This is the seller add new product category page of the project*
![Seller add new product category](screenshots/Screenshot%20(52).png)


