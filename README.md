# Tutorial App - eLearning Web Application

This is an *eLearning web app* that I’ve been working on for the past month. The project focuses on *backend development* using *Spring Boot, Spring MVC, Spring Security, Lombok, Core Java, JSP, JSTL, Spring Data JPA, Maven, and validation techniques**.  

The app has two sides:
- *User Interface* – for students to explore courses, enroll, and access content.
- *Admin Dashboard* – to manage courses, instructors, and users.  

Most of the functionality is complete; content sections are left to finalize. Feedback and suggestions are welcome from fellow developers.

---

## Tools and Technologies Used

- **Backend:** Spring Boot, Spring MVC, Spring Security, Spring Data JPA  
- **Frontend:** JSP, JSTL, Bootstrap  
- **Database:** MySQL  
- **Java:** Core Java, Lombok  
- **Build Tool:** Maven  
- **Validation:** Bean Validation (JSR 380)  
- **Other:** Git,

  
## Database Setup

1. **Create a MySQL Database**
   - Example database name: `tutorial_app_db`
   - Use MySQL Workbench, phpMyAdmin, or CLI:
     ```sql
     CREATE DATABASE tutorial_app_db;
     ```

2. **Update Database Credentials**
   - Open `src/main/resources/application.properties`
   - Replace with your own MySQL username, password, and database name:

     ```properties
     # MySQL Database Configuration
     spring.datasource.url=jdbc:mysql://localhost:3306/tutorial_app_db
     spring.datasource.username=YOUR_DB_USERNAME
     spring.datasource.password=YOUR_DB_PASSWORD

     # JPA/Hibernate Configuration
     spring.jpa.hibernate.ddl-auto=update
     spring.jpa.show-sql=true
     spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
     ```

3. **Run the Application**
   - Build the project:
     ```bash
     mvn clean install
     ```
   - Run the Spring Boot app:
     ```bash
     mvn spring-boot:run
     ```
   - Access in browser: `http://localhost:8080/`

*⚠️ Important Notes*
- There is a .sql file for the admin uncomment it and its configuration in application.properties when you run the project for the first time.
- Ensure the **database exists** and credentials are correct before running the app.
- Tables will be **auto-generated** using Spring JPA.
- Admin and User accounts can be created manually in the DB or via registration forms.

---

# Features

- User registration, login, and profile management
- Admin dashboard to manage courses, instructors, and users
- Course browsing and enrollment for students
- Role-based access with Spring Security
- Form validations and error handling

---

# Project Structure

Tutorial-App/
├── src/
│ ├── main/
│ │ ├── java/
│ │ │ └── com/itn/TutorialApp/
│ │ │ ├── controller/ # Controllers for User and Admin
│ │ │ ├── entity/ # JPA Entity classes
│ │ │ ├── repository/ # JPA Repositories
│ │ │ ├── service/ # Service layer (business logic)
│ │ │ └── security/ # Spring Security configurations
│ │ ├── resources/
│ │ │ ├── application.properties # DB & app config
│ │ │ └── templates/ # JSP pages
│ │ └── webapp/
│ │ └── Frontend/ # CSS, JS, images
├── pom.xml # Maven dependencies
└── README.md # Project overview


## How to Contribute

- Fork the repository
- Clone locally
- Set up your own MySQL database and update credentials
- Implement features or improvements
- Create a pull request for review

---

## Project Link

GitHub: [https://github.com/ronny7-code/Tutorial-App](https://github.com/ronny7-code/Tutorial-App)

---

## License

This project is for **learning and portfolio purposes**. Feel free to review, suggest improvements, or contribute.

