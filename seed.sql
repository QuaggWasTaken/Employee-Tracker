DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `departments` WRITE;
INSERT INTO `departments` VALUES (1,'Sales'),(2,'Engineering'),(3,'Finance'),(4,'Legal');
UNLOCK TABLES;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `salary` double NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_fk0` (`department_id`),
  CONSTRAINT `roles_fk0` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `roles` WRITE;
INSERT INTO `roles` VALUES (1,'Sales Lead',100000,1),(2,'Salesperson',80000,1),(3,'Lead Engineer',150000,2),(4,'Software Engineer',120000,2),(5,'Accountant',125000,3),(6,'Legal Team Lead',250000,4),(7,'Lawyer',190000,4);
UNLOCK TABLES;

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_fk0` (`role_id`),
  KEY `employees_fk1` (`manager_id`),
  CONSTRAINT `employees_fk0` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `employees_fk1` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `employees` WRITE;
INSERT INTO `employees` VALUES (1,'John','Doe',1,3),(2,'Mike','Chan',2,1),(3,'Ashley','Rodriguez',3,NULL),(4,'Kevin','Tupik',4,3),(6,'Malia','Brown',5,NULL),(7,'Sarah','Lourd',6,NULL),(8,'Tom','Allen',7,7);
UNLOCK TABLES;