CREATE TABLE IF NOT EXISTS `plans` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(255) NOT NULL,
    `description` text,
    `price` int(11) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS `students` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `surname` varchar(255) NOT NULL,
    `first_name` varchar(255) NOT NULL,
    `other_name` varchar(255) NOT NULL,
    `dob` date NOT NULL,
    `reg_no` varchar(255) NOT NULL,
    `date_joined` date NOT NULL,
    `email` varchar(255) NOT NULL,
    `phone` varchar(255) NOT NULL,
    `disability` varchar(255),
    `gender` ENUM('Male', 'Female'),
    `address` TEXT,
    `password` VARCHAR(15) NOT NULL,
    `plan_id` INT(11) UNSIGNED,
    FOREIGN KEY `fk_student_plan` (`plan_id`) REFERENCES plans(id) ON DELETE RESTRICT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE `plans` CHANGE `price` `price` DOUBLE(10,2) UNSIGNED NOT NULL;

CREATE TABLE IF NOT EXISTS `instructors` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` varchar(255),
    `surname` varchar(255) NOT NULL,
    `first_name` varchar(255) NOT NULL,
    `other_name` varchar(255) NOT NULL,
    `dob` date NOT NULL,
    `staff_no` varchar(255) NOT NULL,
    `employment_joined` date NOT NULL,
    `email` varchar(255) NOT NULL,
    `phone` varchar(255) NOT NULL,
    `gender` ENUM('Male', 'Female'),
    `address` TEXT,
    `password` VARCHAR(15) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `courses` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(255) NOT NULL,
    `description` text,
    `instructor_id` int(11) UNSIGNED,
    FOREIGN KEY `fk_course_instructor` (`instructor_id`) REFERENCES instructors(id) ON DELETE RESTRICT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE students DROP FOREIGN KEY `fk_student_plan`;
ALTER TABLE students DROP COLUMN plan_id;

CREATE TABLE IF NOT EXISTS `plans_students` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `student_id` int(11) UNSIGNED NOT NULL,
    `plan_id` int(11) UNSIGNED NOT NULL,
    FOREIGN KEY `fk_plans_students_student` (`student_id`) REFERENCES students(id) ON DELETE RESTRICT,
    FOREIGN KEY `fk_plans_students_plan` (`plan_id`) REFERENCES plans(id) ON DELETE RESTRICT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `courses_plans` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `course_id` int(11) UNSIGNED NOT NULL,
    `plan_id` int(11) UNSIGNED NOT NULL,
    FOREIGN KEY `fk_course_plan` (`course_id`) REFERENCES courses(id) ON DELETE RESTRICT,
    FOREIGN KEY `fk_courses_plans_plan` (`plan_id`) REFERENCES plans(id) ON DELETE RESTRICT,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
ALTER TABLE `instructors` CHANGE `employment_joined` `employment_date` DATE NOT NULL;