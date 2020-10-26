var inquirer = require('inquirer');
const mysql = require('mysql2/promise');
const bluebird = require('bluebird');

var main = {
    type: 'list',
    name: 'main',
    message: 'What would you like to do?',
    choices: ['View All Departments', 'View All Roles', 'View All Employees', 'Add A Department', 'Add A Role', 'Add An Employee', 'Update An Employee Role'],
    filter: function (val) {
        return val.toLowerCase();
    },
}

inquirer
    .prompt(main).then((answers) => {
        console.log(answers)

        switch (answers.main.substr(0, 4)) {
            case 'view':
                view(answers.main.substring(9, answers.main.length))
                break;
            case 'add ':
                console.log("add ")
                break;
            case 'upda':
                console.log("upda")
                break;
            default:
                break;
        }
        return 1;
    });

function view(table) {
    query = `select * from ${table}`;
    switch (table) {
        case 'departments':
            query = `select * from departments`;
            break;
        case 'roles':
            query = `SELECT roles.id, roles.title, roles.salary, departments.name AS department FROM roles JOIN departments ON roles.department_id=departments.id`;
            break;
        case 'employees':
            query = `SELECT employees.id ,employees.first_name, employees.last_name, roles.title, departments.name AS department, roles.salary, manager.first_name AS ManagerFirstName, manager.last_name AS ManagerLastName
            FROM employees
            LEFT JOIN roles ON employees.role_id=roles.id
            LEFT JOIN departments ON roles.department_id=departments.id
            LEFT JOIN employees AS manager ON employees.manager_id=manager.id`;
            break;
        default:
            break;
    }
    mysql.createConnection({
            host: 'localhost',
            user: 'root',
            database: 'employee_tracking',
            password: 'password'
        })
        .then(conn => {
            const res = conn.query(query);
            return res;
        }).then(result => {
            console.table(result[0])
        }).catch(err => {
            console.log(err); // any of connection time or query time errors from above
        });
}