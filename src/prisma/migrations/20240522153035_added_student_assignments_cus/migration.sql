-- CreateTable
CREATE TABLE `assignments` (
    `AssignmentID` INTEGER NOT NULL AUTO_INCREMENT,
    `SessionID` INTEGER NULL,
    `Title` VARCHAR(255) NOT NULL,
    `Deadline` VARCHAR(191) NULL,
    `FilePath` VARCHAR(255) NULL,
    `ParticipantID` INTEGER NULL,
    `isUploadedByTrainer` BOOLEAN NOT NULL DEFAULT false,
    `Grade` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `SessionID`(`SessionID`),
    PRIMARY KEY (`AssignmentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `student_assignments_cust` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `AssignmentID` INTEGER NULL,
    `Title` VARCHAR(255) NOT NULL,
    `FilePath` VARCHAR(255) NULL,
    `ParticipantID` INTEGER NULL,
    `status` BOOLEAN NOT NULL DEFAULT false,
    `Grade` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `AssignmentID`(`AssignmentID`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `materials` (
    `MaterialID` INTEGER NOT NULL AUTO_INCREMENT,
    `SessionID` INTEGER NULL,
    `Title` VARCHAR(255) NOT NULL,
    `DocumentType` VARCHAR(255) NOT NULL,
    `FilePath` VARCHAR(255) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `SessionID`(`SessionID`),
    PRIMARY KEY (`MaterialID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `centers` (
    `CenterID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(22) NOT NULL,
    `City` VARCHAR(22) NOT NULL,
    `FocalPerson` VARCHAR(22) NOT NULL,
    `SeatingCapacity` INTEGER NOT NULL,
    `haveComputerLab` BOOLEAN NOT NULL,

    PRIMARY KEY (`CenterID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Feedback` (
    `FeedbackID` INTEGER NOT NULL AUTO_INCREMENT,
    `SessionID` VARCHAR(22) NULL,
    `ProgramID` VARCHAR(22) NULL DEFAULT '1',
    `UserID` VARCHAR(22) NULL,
    `CreatedByAdmin` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`FeedbackID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FeedbackInput` (
    `InputID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(191) NOT NULL,
    `Value` VARCHAR(191) NULL,
    `feedbackID` INTEGER NOT NULL,

    PRIMARY KEY (`InputID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `documents` (
    `DocumentID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER NULL,
    `SessionID` INTEGER NULL,
    `DocumentType` VARCHAR(50) NOT NULL,
    `FilePath` VARCHAR(255) NOT NULL,
    `IsVerified` BOOLEAN NULL,

    INDEX `SessionID`(`SessionID`),
    INDEX `UserID`(`UserID`),
    PRIMARY KEY (`DocumentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `marks` (
    `MarkID` INTEGER NOT NULL AUTO_INCREMENT,
    `AssignmentID` INTEGER NULL,
    `UserID` INTEGER NULL,
    `Mark` INTEGER NULL,

    INDEX `AssignmentID`(`AssignmentID`),
    INDEX `UserID`(`UserID`),
    PRIMARY KEY (`MarkID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notifications` (
    `NotificationID` INTEGER NOT NULL,
    `UserID` INTEGER NULL,
    `Message` TEXT NOT NULL,
    `IsRead` BOOLEAN NULL,

    INDEX `UserID`(`UserID`),
    PRIMARY KEY (`NotificationID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `documentType` (
    `DocumentTypeID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`DocumentTypeID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `documentTypeProgram` (
    `DocumentTypeID` INTEGER NOT NULL,
    `ProgramID` INTEGER NOT NULL,

    PRIMARY KEY (`DocumentTypeID`, `ProgramID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `programs` (
    `ProgramID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NOT NULL,
    `Startdate` VARCHAR(191) NOT NULL,
    `EndDate` VARCHAR(191) NOT NULL,
    `Category` VARCHAR(191) NOT NULL,
    `ManagerID` INTEGER NULL,
    `Age` VARCHAR(191) NULL,
    `Education` VARCHAR(191) NULL,
    `Gender` ENUM('MALE', 'FEMALE', 'BOTH') NULL DEFAULT 'BOTH',
    `DonorOrganizationID` INTEGER NULL,
    `Description` TEXT NULL,
    `EligibilityCriteria` TEXT NULL,
    `DocumentRequirements` INTEGER NULL,

    PRIMARY KEY (`ProgramID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `report` (
    `ReportID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(191) NOT NULL,
    `ProgramID` INTEGER NOT NULL,
    `FilePath` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`ReportID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `submitedReport` (
    `SubmitedReportID` INTEGER NOT NULL AUTO_INCREMENT,
    `ReportID` INTEGER NOT NULL,
    `SessionID` INTEGER NOT NULL,
    `Value` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`SubmitedReportID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `course` (
    `CourseID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(191) NOT NULL,
    `ProgramID` INTEGER NULL,

    PRIMARY KEY (`CourseID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Participant` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `cnic` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `contact` VARCHAR(191) NOT NULL,
    `sessionId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Quiz` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `SessionID` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubmittedQuiz` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `score` INTEGER NOT NULL,
    `UserID` INTEGER NOT NULL,
    `QuizID` INTEGER NOT NULL,
    `SessionID` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QuizQuestion` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `question` VARCHAR(191) NOT NULL,
    `answer` VARCHAR(191) NOT NULL,
    `quizId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Option` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `value` VARCHAR(191) NOT NULL,
    `questionId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `progresstracking` (
    `ProgressID` INTEGER NOT NULL,
    `SessionID` INTEGER NULL,
    `UserID` INTEGER NULL,
    `Status` VARCHAR(50) NULL,

    INDEX `SessionID`(`SessionID`),
    INDEX `UserID`(`UserID`),
    PRIMARY KEY (`ProgressID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `thirdparties` (
    `ThirdPartyID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`ThirdPartyID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `thirdpartytracking` (
    `TrackingID` INTEGER NOT NULL,
    `ThirdPartyID` INTEGER NULL,
    `SessionID` INTEGER NULL,
    `Insights` TEXT NULL,

    INDEX `SessionID`(`SessionID`),
    INDEX `ThirdPartyID`(`ThirdPartyID`),
    PRIMARY KEY (`TrackingID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trainingsessions` (
    `SessionID` INTEGER NOT NULL AUTO_INCREMENT,
    `ProgramID` INTEGER NULL,
    `Center` VARCHAR(255) NOT NULL,
    `StartDate` VARCHAR(255) NULL,
    `EndDate` VARCHAR(255) NULL,
    `TrainerID` INTEGER NULL,
    `MonitorID` INTEGER NULL,
    `DeliverablesStatus` VARCHAR(50) NULL,
    `CourseID` INTEGER NOT NULL,

    INDEX `MonitorID`(`MonitorID`),
    INDEX `ProgramID`(`ProgramID`),
    INDEX `TrainerID`(`TrainerID`),
    PRIMARY KEY (`SessionID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `UserID` INTEGER NOT NULL AUTO_INCREMENT,
    `Username` VARCHAR(255) NOT NULL,
    `Password` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `FirstName` VARCHAR(255) NULL,
    `userData` VARCHAR(255) NULL,
    `SessionID` VARCHAR(255) NULL,
    `ProgramID` VARCHAR(255) NULL,
    `LastName` VARCHAR(255) NULL,
    `ProfilePicture` VARCHAR(255) NULL,
    `ContactNumber` VARCHAR(255) NULL,
    `UserType` ENUM('STUDENT', 'ADMIN', 'TRAINER', 'MONITOR', 'CLIENT', 'MANAGER') NOT NULL DEFAULT 'STUDENT',

    PRIMARY KEY (`UserID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client` (
    `ClientID` INTEGER NOT NULL AUTO_INCREMENT,
    `ThirdPartyID` INTEGER NOT NULL,

    PRIMARY KEY (`ClientID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `assignments` ADD CONSTRAINT `Assignments_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `trainingsessions`(`SessionID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `student_assignments_cust` ADD CONSTRAINT `student_assignments_cust_AssignmentID_fkey` FOREIGN KEY (`AssignmentID`) REFERENCES `assignments`(`AssignmentID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `FeedbackInput` ADD CONSTRAINT `FeedbackInput_feedbackID_fkey` FOREIGN KEY (`feedbackID`) REFERENCES `Feedback`(`FeedbackID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `documents` ADD CONSTRAINT `Documents_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `documents` ADD CONSTRAINT `Documents_ibfk_2` FOREIGN KEY (`SessionID`) REFERENCES `trainingsessions`(`SessionID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `marks` ADD CONSTRAINT `Marks_ibfk_1` FOREIGN KEY (`AssignmentID`) REFERENCES `assignments`(`AssignmentID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `marks` ADD CONSTRAINT `Marks_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `notifications` ADD CONSTRAINT `Notifications_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `documentTypeProgram` ADD CONSTRAINT `documentTypeProgram_ProgramID_fkey` FOREIGN KEY (`ProgramID`) REFERENCES `programs`(`ProgramID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `documentTypeProgram` ADD CONSTRAINT `documentTypeProgram_DocumentTypeID_fkey` FOREIGN KEY (`DocumentTypeID`) REFERENCES `documentType`(`DocumentTypeID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `programs` ADD CONSTRAINT `programs_DonorOrganizationID_fkey` FOREIGN KEY (`DonorOrganizationID`) REFERENCES `thirdparties`(`ThirdPartyID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `submitedReport` ADD CONSTRAINT `submitedReport_ReportID_fkey` FOREIGN KEY (`ReportID`) REFERENCES `report`(`ReportID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `course` ADD CONSTRAINT `course_ProgramID_fkey` FOREIGN KEY (`ProgramID`) REFERENCES `programs`(`ProgramID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Participant` ADD CONSTRAINT `Participant_sessionId_fkey` FOREIGN KEY (`sessionId`) REFERENCES `trainingsessions`(`SessionID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Quiz` ADD CONSTRAINT `Quiz_SessionID_fkey` FOREIGN KEY (`SessionID`) REFERENCES `trainingsessions`(`SessionID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubmittedQuiz` ADD CONSTRAINT `SubmittedQuiz_QuizID_fkey` FOREIGN KEY (`QuizID`) REFERENCES `Quiz`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QuizQuestion` ADD CONSTRAINT `QuizQuestion_quizId_fkey` FOREIGN KEY (`quizId`) REFERENCES `Quiz`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Option` ADD CONSTRAINT `Option_questionId_fkey` FOREIGN KEY (`questionId`) REFERENCES `QuizQuestion`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `progresstracking` ADD CONSTRAINT `ProgressTracking_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `trainingsessions`(`SessionID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `progresstracking` ADD CONSTRAINT `ProgressTracking_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users`(`UserID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `thirdpartytracking` ADD CONSTRAINT `ThirdPartyTracking_ibfk_1` FOREIGN KEY (`ThirdPartyID`) REFERENCES `thirdparties`(`ThirdPartyID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `thirdpartytracking` ADD CONSTRAINT `ThirdPartyTracking_ibfk_2` FOREIGN KEY (`SessionID`) REFERENCES `trainingsessions`(`SessionID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `trainingsessions` ADD CONSTRAINT `trainingsessions_CourseID_fkey` FOREIGN KEY (`CourseID`) REFERENCES `course`(`CourseID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `trainingsessions` ADD CONSTRAINT `trainingsessions_ProgramID_fkey` FOREIGN KEY (`ProgramID`) REFERENCES `programs`(`ProgramID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `trainingsessions` ADD CONSTRAINT `trainingsessions_TrainerID_fkey` FOREIGN KEY (`TrainerID`) REFERENCES `users`(`UserID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `trainingsessions` ADD CONSTRAINT `trainingsessions_MonitorID_fkey` FOREIGN KEY (`MonitorID`) REFERENCES `users`(`UserID`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `client` ADD CONSTRAINT `client_ClientID_fkey` FOREIGN KEY (`ClientID`) REFERENCES `users`(`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `client` ADD CONSTRAINT `client_ThirdPartyID_fkey` FOREIGN KEY (`ThirdPartyID`) REFERENCES `thirdparties`(`ThirdPartyID`) ON DELETE CASCADE ON UPDATE CASCADE;
