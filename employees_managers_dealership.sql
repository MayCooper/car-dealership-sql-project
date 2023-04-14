--I'll display a list of employees and their immediate managers.

SELECT e.firstName,
    e.lastName,
    e.title,
    mng.firstName AS ManagerFirstName,
    mng.lastName AS ManagerLastName
FROM employee e
INNER JOIN employee mng
    ON e.managerId = mng.employeeId

