# Banking Consultancy
## SQL
Database: `EconomiaDB``

This project involves the creation and management of a database named `EconomiaDB``, designed specifically for a banking consultancy. The database focuses on storing and processing information related to banks, currencies, countries, clients, and financial transactions. MySQL is used as the database management system.

### Structure and Design of Tables
File: `BD/economia.sql`
1. **Divisa**: Stores information about various currencies, including a code and exchange rate.

2. **Country**: Contains data on different countries, their population, and the currency they use.

3. **Bank**: Records information about various banks, including their name and headquarters.

4. **Bank_Country**: Associates banks with the countries in which they operate.

5. **Client**: Keeps data on clients, such as name, surname, and date of birth.

6. **Account**: Stores information on bank accounts, including the type (Savings or Current), balance, and references to the corresponding bank and currency.

7. **Transaction**: Records financial transactions, with details such as date, amount, description, and references to account and currency.

8. **Client_Account**: Links clients to their bank accounts.

9. **Loan**: Details the loans made, including amount, start and maturity dates, and references to the client and currency.

10. **Client_Loan_Bank**: Associates clients with loans and banks.

11. **Employee**: Contains information about bank employees.

12. **Supervisor**: Identifies employees who are supervisors.

13. **Team_Member**: Links team members to their respective supervisors.

### SQL Scripts for Queries and Data Manipulation

- `BD/economia_insert.sql`: This script is responsible for populating the tables with initial data. It includes the insertion of currencies, countries, banks, clients, accounts, transactions, loans, and the assignment of employees to banks and roles (supervisors and team members).
- `BD/queries.sql`: Includes a series of SQL queries to extract specific information from the database, such as clients born after 1960, clients with accounts in specific banks, transactions in different currencies, and more.

## NoSQL Adaptation
A section of the EconomiaDB relational database is adapted to a NoSQL format, specifically using MongoDB. This adaptation involves restructuring the data storage and querying approach to fit the NoSQL paradigm, focusing on collections like banks, clients, accounts, currencies, and employees.

### Collections and Their Structures
Files: `BD/MongoDB`

1. Banco (Bank) Collection:
- Stores bank details including name, headquarters (Sede), and a list of countries (Pais) in which each bank operates.
- Example Document:
```json
{
  "Nombre": "Banco Santander",
  "Sede": "Santander",
  "Pais": [1, 3, 6, 7, 8, 11]
}
```

2. Cliente (Client) Collection:
- Contains client information such as ID, name, surname, and date of birth.
- Example Document:

```json
{
  "ID_Cliente": 1,
  "Nombre": "Juan",
  "Apellido": "Pérez",
  "Fecha_nacimiento": "1985-01-15"
}
```

3. Cuenta (Account) Collection:
- Records details of accounts, including type, balance, associated bank ID, currency details, and linked clients.
- Example Document:
```json
{
  "Tipo": "Ahorros",
  "Balance": 1500.00,
  "ID_Banco": 1,
  "Divisa": {"Codigo": "EUR", "Tasa_cambio": 1.0},
  "ID_Cliente": [1, 2]
}
```

4. Divisa (Currency) Collection:
- Stores information about various currencies, including their code and exchange rate.
- Example Document:
```json
{
  "Codigo": "EUR",
  "Tasa_cambio": 1.1000
}
```

5. Empleado (Employee) Collection:
- Details employees, including their ID, name, surname, bank ID, and supervisor ID.
- Example Document:
```json
{
  "ID_Empleado": 1,
  "Nombre": "Pedro",
  "Apellido": "Martínez",
  "ID_Banco": 1,
  "Supervisor_ID": 4
}
```

6. Pais (Country) Collection:
- Contains country details such as name, population, and currency information.
- Example Document:
```json
{
  "Nombre": "España",
  "Poblacion": 47.0,
  "Divisa": {"Codigo": "EUR", "Tasa_cambio": 1.0}
}
```

### Queries in MongoDB
File: `BD/MongoDB/consultas.txt`
The project also includes various MongoDB queries to interact with the NoSQL database. These queries are designed to retrieve specific information such as:

- All banks with headquarters in a particular city.
- Accounts with a balance over a certain amount.
- Employees working at a bank's specific location.
- Clients with a particular name.
- Countries with a population over a certain threshold.
- Accounts in a specific currency with a balance over a set amount.
- Employees without a supervisor.
- Banks operating in more than a certain number of countries.

Each query is structured to leverage MongoDB's querying capabilities, providing efficient access and manipulation of data stored in the NoSQL database. This approach demonstrates the adaptability of the banking consultancy data model to different database paradigms, showcasing the flexibility required in modern data management.

## Web Development and database integration
1. `index.html`
- Function: Main webpage for BankConsulting.
- Structure: Includes a navigation bar, different interactive sections (tabs for About Us, Client Query, Transaction Query, Data Insertion, and Suggestions), and a footer.
- Key Elements:
  - Bootstrap Navigation Bar: Links to various sections.
  - About Us: Describes BankConsulting's philosophy and approach.
  - Client Query: Form to search clients by name and surname.
  - Transaction Query: Filters for transactions by date and currency.
  - Data Insertion: Form for adding or deleting client data.
  - Suggestions: Section for submitting suggestions.
  - Footer: Contact information.

2. `main.js`
- Function: JavaScript file for adding interactivity to index.html.
- Features:
  - Mouseover Effects: Changes styles of paragraphs and images on hover.
  - Suggestion Box Interactivity: Dynamically adds user suggestions to the webpage.
  - Event Listeners: Attached to forms and elements for handling user interactions.
3. `anadir_eliminar.js`
- Function: Handles the client data insertion and deletion functionality in index.html.
- Operation:
  - Form Submission: Manages the submission of the form for adding or deleting data.
  - Data Handling: Collects form data and sends it to anadir_eliminar.php using AJAX.
  - Validation: Checks whether the user wants to add or delete data and adjusts input field availability accordingly.
4. `anadir_eliminar.php`
- Function: Server-side script for processing data addition or removal requests.
- Process:
  - Database Interaction: Connects to the MySQL database to perform insertion or deletion.
  - Data Handling: Receives data from anadir_eliminar.js, executes SQL queries based on user action (add or delete).
  - Error Handling: Manages connection errors and query execution issues.

5. `consulta_nombres.js`
- Function: Manages the client name query functionality.
- Functionality:
  - Form Handling: Captures data from the client query form.
  - AJAX Request: Sends a request to consulta_nombres.php and handles the response.
  - Dynamic Content Update: Updates the webpage with query results without reloading.

6. `consulta_nombres.php`
- Function: Back-end script for executing client name queries.
- Details:
  - Database Query: Performs a SELECT query based on received names and surnames.
  - Response Format: Returns the query results in JSON format for easy handling by JavaScript.

The front-end HTML and CSS provide the structure and style, while JavaScript files add interactivity and connect to PHP scripts for server-side data processing. This structure ensures a dynamic, user-friendly experience with efficient data management and presentation.