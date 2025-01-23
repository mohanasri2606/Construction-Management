create database Task_management;
use Task_management
   create table Clients (
   Client_Id int auto_increment primary key,
   Company_Name varchar(100) not null, 
   Client_Name varchar(100),
   Email varchar(100) unique not null,
   Phone_Number varchar(15),
   Address text,
   Project varchar(100),
   Created_at datetime default current_timestamp,
   Updated_at datetime default current_timestamp on update current_timestamp
)Auto_increment=101;
create table Users(
   User_Id int auto_increment primary key,
   User_Name varchar(100) not null,
   Email varchar(100) not null,
   Phone_Number varchar(15) not null,
   Role varchar(100) not null,
   Registration_Date datetime default current_timestamp
   )auto_increment=1001;
   create table Task_Categories(
   Category_Id int auto_increment primary key,
   Category_Name varchar(100) unique,
   Description text,
   In_Active BOOLEAN DEFAULT FALSE,
   Created_at datetime default current_timestamp,
   Updated_at datetime default current_timestamp on update current_timestamp
   )auto_increment=801;
create table Project(
   Project_Id int auto_increment primary key,
   Project_Name varchar(100) not null,
   Client_Id int not null,
   Description text,
   Start_Date date not null, 
   End_Date date,
   Status enum('Planned','In Progress','Completed','On Hold') default 'Planned',
   Created_at datetime default current_timestamp,
   Updated_at datetime default current_timestamp on update current_timestamp,
   FOREIGN KEY (Client_Id) REFERENCES Clients(Client_Id)
   )auto_increment=1;
CREATE TABLE Tasks (
    Task_Id INT AUTO_INCREMENT PRIMARY KEY,
    Project_Id INT NOT NULL,
    Assigned_To INT NOT NULL,
    Category_Id INT,
    Task_Title VARCHAR(100) NOT NULL,
    Description VARCHAR(150), 
    Start_Date DATE,
    End_Date DATE,
    Priority ENUM('Low', 'High', 'Medium') DEFAULT 'Medium',
    Status ENUM('Not Started', 'In Progress', 'Completed') DEFAULT 'Not Started',
    Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Project_Id) REFERENCES Project(Project_Id),
    FOREIGN KEY (Assigned_To) REFERENCES Users(User_Id),
    FOREIGN KEY (Category_Id) REFERENCES Task_Categories(Category_Id)
) AUTO_INCREMENT = 2001;
create table milestones(
   Milestone_Id int auto_increment primary key,
   Project_ID int not null,
   Name varchar(100) not null,
   Description varchar(150),
   Due_Date date,
   Status enum('Planned','Archived','Delayed') default 'Planned',
   Created_at datetime default current_timestamp,
   Updated_at datetime default current_timestamp on update current_timestamp,
   foreign key (Project_Id) references Project(Project_Id)
   )auto_increment=3001;
INSERT INTO Clients (Company_Name, Client_Name, Email, Phone_Number, Address, Project, Created_at, Updated_at) 
VALUES
 ('Alpha Builders Pvt Ltd', 'Rakesh Kumar', 'rakesh.kumar@gmail.com', '9876543210', 'Chennai, Tamil Nadu', 'Residential Complex', '2024-11-01 08:30:00', '2024-11-01 08:45:00'),
 ('Beta Constructions', 'Sneha Raj', 'sneha.raj@gmail.com', '9876501234', 'Coimbatore, Tamil Nadu', 'Corporate Office', '2024-11-02 09:15:00', '2024-11-02 09:30:00'),
('Gamma Contractors', 'Vikram Selvam', 'vikram.selvam@gmail.com', '9988776655', 'Madurai, Tamil Nadu', 'Shopping Mall', '2024-11-03 10:00:00', '2024-11-03 10:15:00'),
('Delta Builders', 'Anjali Nair', 'anjali.nair@gmail.com', '9898765432', 'Salem, Tamil Nadu', 'Luxury Villas', '2024-11-04 11:20:00', '2024-11-04 11:30:00'),
('Epsilon Infra', 'Rajesh Kumar', 'rajesh.kumar@gmail.com', '9765432109', 'Tiruchirappalli, Tamil Nadu', 'Office Tower', '2024-11-05 12:00:00', '2024-11-05 12:30:00'),
('Zeta Structures', 'Priya Rani', 'priya.rani@gmail.com', '9601234567', 'Vellore, Tamil Nadu', 'Residential Complex', '2024-11-06 13:00:00', '2024-11-06 13:20:00'),
('Eta Infrastructure', 'Vishal Suresh', 'vishal.suresh@gmail.com', '9345678901', 'Chidambaram, Tamil Nadu', 'Industrial Park', '2024-11-07 14:10:00', '2024-11-07 14:25:00'),
('Theta Build', 'Manoj Kumar', 'manoj.kumar@gmail.com', '9283746501', 'Trichy, Tamil Nadu', 'Retail Store', '2024-11-08 15:05:00', '2024-11-08 15:15:00'),
('Iota Constructions', 'Lakshmi Krishnan', 'lakshmi.krishnan@gmail.com', '9485726013', 'Tirunelveli, Tamil Nadu', 'Residential Flats', '2024-11-09 16:00:00', '2024-11-09 16:10:00'),
('Kappa Builders', 'Ajith Rajan', 'ajith.rajan@gmail.com', '9348657021', 'Thoothukudi, Tamil Nadu', 'Community Center', '2024-11-10 17:00:00', '2024-11-10 17:30:00'),
('Lambda Constructions', 'Vani Ravi', 'vani.ravi@gmail.com', '9876543211', 'Kanyakumari, Tamil Nadu', 'Luxury Apartments', '2024-11-11 18:00:00', '2024-11-11 18:15:00'),
('Mu Infra', 'Manoj Nair', 'manoj.nair@gmail.com', '8765432108', 'Chengalpattu, Tamil Nadu', 'Government Building', '2024-11-12 19:00:00', '2024-11-12 19:30:00'),
('Nu Builders', 'Priyanka Singh', 'priyanka.singh@gmail.com', '9765321098', 'Kanchipuram, Tamil Nadu', 'Residential Township', '2024-11-13 20:00:00', '2024-11-13 20:15:00'),
('Xi Constructions', 'Karthik Subramani', 'karthik.subramani@gmail.com', '9611223344', 'Cuddalore, Tamil Nadu', 'Education Center', '2024-11-14 21:00:00', '2024-11-14 21:10:00'),
('Omicron Infra', 'Lalitha Kumar', 'lalitha.kumar@gmail.com', '9554332211', 'Vellore, Tamil Nadu', 'Healthcare Facility', '2024-11-15 22:00:00', '2024-11-15 22:30:00'),
('Pi Builders', 'Ravi Kumar', 'ravi.kumar@gmail.com', '9291827364', 'Tiruvannamalai, Tamil Nadu', 'Shopping Complex', '2024-11-16 23:00:00', '2024-11-16 23:20:00'),
('Rho Constructions', 'Asha Menon', 'asha.menon@gmail.com', '9685748392', 'Thanjavur, Tamil Nadu', 'Housing Scheme', '2024-11-17 00:00:00', '2024-11-17 00:20:00'),
('Sigma Developers', 'Vikram Suresh', 'vikram.suresh@gmail.com', '9603284943', 'Puducherry, Tamil Nadu', 'Beach Resort', '2024-11-18 01:00:00', '2024-11-18 01:15:00'),
('Tau Infra', 'Neelima Rani', 'neelima.rani@gmail.com', '9736548291', 'Karur, Tamil Nadu', 'Hotel Complex', '2024-11-19 02:00:00', '2024-11-19 02:30:00'),
('Upsilon Constructions', 'Suresh Kumar', 'suresh.kumar@gmail.com', '9812365497', 'Tirupur, Tamil Nadu', 'Factory Building', '2024-11-20 03:00:00', '2024-11-20 03:20:00'),
('Phi Infra', 'Shweta Rao', 'shweta.rao@gmail.com', '9445671234', 'Dharmapuri, Tamil Nadu', 'Apartment Complex', '2024-11-21 04:00:00', '2024-11-21 04:30:00'),
('Chi Builders', 'Krishnan Srinivasan', 'krishnan.srinivasan@gmail.com', '9337421908', 'Virudhunagar, Tamil Nadu', 'Mixed Use Development', '2024-11-22 05:00:00', '2024-11-22 05:30:00'),
('Psi Constructions', 'Manju Sharma', 'manju.sharma@gmail.com', '9546218730', 'Kumbakonam, Tamil Nadu', 'Industrial Complex', '2024-11-23 06:00:00', '2024-11-23 06:20:00'),
('Omega Infra', 'Vijay Raj', 'vijay.raj@gmail.com', '9123456789', 'Erode, Tamil Nadu', 'Retail Plaza', '2024-11-24 07:00:00', '2024-11-24 07:30:00'),
('Beta Constructions', 'Ramkumar Sundar', 'ramkumar.sundar@gmail.com', '9876543210', 'Chennai, Tamil Nadu', 'Luxury Apartments', '2024-11-25 08:00:00', '2024-11-25 08:30:00'),
('Gamma Builders', 'Pradeep Rajan', 'pradeep.rajan@gmail.com', '9776655443', 'Chidambaram, Tamil Nadu', 'Corporate Headquarters', '2024-11-26 09:00:00', '2024-11-26 09:30:00'),
('Alpha Infra', 'Devi Raghavan', 'devi.raghavan@gmail.com', '9654783921', 'Tiruchirappalli, Tamil Nadu', 'Residential Tower', '2024-11-27 10:00:00', '2024-11-27 10:30:00'),
('Beta Developers', 'Shankar Kumar', 'shankar.kumar@gmail.com', '9423312765', 'Madurai, Tamil Nadu', 'Township Project', '2024-11-28 11:00:00', '2024-11-28 11:30:00'),
('Zeta Constructions', 'Laxmi Sivaraman', 'laxmi.sivaraman@gmail.com', '9673458961', 'Tiruvannamalai, Tamil Nadu', 'Hospital Building', '2024-11-29 12:00:00', '2024-11-29 12:30:00'),
('Epsilon Developers', 'Vijayan Prakash', 'vijayan.prakash@gmail.com', '9227885221', 'Puducherry, Tamil Nadu', 'Mixed Use Development', '2024-11-30 13:00:00', '2024-11-30 13:30:00'),
('Delta Builders', 'Sundari Devi', 'sundari.devi@gmail.com', '9365821082', 'Tirunelveli, Tamil Nadu', 'Shopping Mall', '2024-12-01 14:00:00', '2024-12-01 14:30:00'),
('Gamma Builders', 'Vishal Anand', 'vishal.anand@gmail.com', '9317846510', 'Chennai, Tamil Nadu', 'Factory Complex', '2024-12-02 15:00:00', '2024-12-02 15:20:00'),
('Omega Infra', 'Sundar Raj', 'sundar.raj@gmail.com', '9224776610', 'Salem, Tamil Nadu', 'Office Building', '2024-12-03 16:00:00', '2024-12-03 16:15:00'),
('Psi Developers', 'Ranjith Kumar', 'ranjith.kumar@gmail.com', '9336420175', 'Kanyakumari, Tamil Nadu', 'Residential Development', '2024-12-04 17:00:00', '2024-12-04 17:20:00'),
('Sigma Constructions', 'Krishna Selvam', 'krishna.selvam@gmail.com', '9442058762', 'Vellore, Tamil Nadu', 'Educational Institute', '2024-12-05 18:00:00', '2024-12-05 18:30:00'),
('Theta Infra', 'Siva Prasad', 'siva.prasad@gmail.com', '9278365124', 'Tirupur, Tamil Nadu', 'Hotel Complex', '2024-12-06 19:00:00', '2024-12-06 19:30:00'),
('Pi Developers', 'Ravi Kumar', 'ravik.kumar@gmail.com', '9147756340', 'Kanchipuram, Tamil Nadu', 'Apartment Complex', '2024-12-07 20:00:00', '2024-12-07 20:30:00'),
('Nu Infra', 'Meena Karthik', 'meena.karthik@gmail.com', '9845312769', 'Coimbatore, Tamil Nadu', 'Residential Flats', '2024-12-08 21:00:00', '2024-12-08 21:20:00'),
('Rho Builders', 'Rajeev Kumar', 'rajeev.kumar@gmail.com', '9376289104', 'Cuddalore, Tamil Nadu', 'Commercial Tower', '2024-12-09 22:00:00', '2024-12-09 22:20:00'),
('Chi Infra', 'Vikram Rani', 'vikram.rani@gmail.com', '9834162540', 'Tiruvannamalai, Tamil Nadu', 'Office Complex', '2024-12-10 23:00:00', '2024-12-10 23:20:00'),
('Tau Constructions', 'Lalitha Ram', 'lalitha.ram@gmail.com', '9582734621', 'Karur, Tamil Nadu', 'Industrial Facility', '2024-12-11 00:00:00', '2024-12-11 00:30:00'),
('Xi Builders', 'Srinivas Iyer', 'srinivas.iyer@gmail.com', '9776554330', 'Madurai, Tamil Nadu', 'Retail Space', '2024-12-12 01:00:00', '2024-12-12 01:30:00'),
('Iota Developers', 'Deepa Nair', 'deepa.nair@gmail.com', '9665423789', 'Tiruvallur, Tamil Nadu', 'Healthcare Center', '2024-12-13 02:00:00', '2024-12-13 02:30:00')
;
INSERT INTO Users (User_Name, Email, Phone_Number, Role, Registration_Date)
VALUES
('Divya Iyer', 'divya.iyer@gmail.com', '9345678901', 'Project Coordinator', '2024-11-15 22:00:00'),
('Raghavendra S', 'raghavendra.s@gmail.com', '9798765432', 'Safety Officer', '2024-11-16 08:00:00'),
('Madhavi Kumar', 'madhavi.kumar@gmail.com', '9654312789', 'Architect', '2024-11-17 09:00:00'),
('Karthik Ram', 'karthik.ram@gmail.com', '9758641320', 'Site Supervisor', '2024-11-18 10:00:00'),
('Shankar Prasad', 'shankar.prasad@gmail.com', '9321456789', 'Project Manager', '2024-11-19 11:10:00'),
('Gowri Nair', 'gowri.nair@gmail.com', '9623456789', 'Civil Engineer', '2024-11-20 12:30:00'),
('Vikash Patel', 'vikash.patel@gmail.com', '9871236540', 'Project Architect', '2024-11-21 13:00:00'),
('Ananya Sharma', 'ananya.sharma@gmail.com', '9624875310', 'Construction Manager', '2024-11-22 14:20:00'),
('Ravi Suresh', 'ravi.suresh@gmail.com', '9334765211', 'Quality Control', '2024-11-23 15:10:00'),
('Bhuvanesh Kumar', 'bhuvanesh.kumar@gmail.com', '9765321098', 'Site Engineer', '2024-11-24 16:00:00'),
('Sumathi Rajan', 'sumathi.rajan@gmail.com', '9886321475', 'Project Coordinator', '2024-11-25 17:00:00'),
('Aravind S', 'aravind.s@gmail.com', '9876540321', 'Project Architect', '2024-11-26 18:15:00'),
('Priyanka Iyer', 'priyanka.iyer@gmail.com', '9601234785', 'Civil Engineer', '2024-11-27 19:20:00'),
('Sathish Kumar', 'sathish.kumar@gmail.com', '9345679023', 'Procurement Officer', '2024-11-28 20:30:00'),
('Divakar Rajan', 'divakar.rajan@gmail.com', '9888777741', 'Construction Foreman', '2024-11-29 21:00:00'),
('Kavitha Rani', 'kavitha.rani@gmail.com', '9556432189', 'Structural Engineer', '2024-11-30 22:00:00'),
('Ramasamy V', 'ramasamy.v@gmail.com', '9405267391', 'Quality Assurance', '2024-12-01 08:00:00'),
('Selvi Nair', 'selvi.nair@gmail.com', '9234567891', 'Site Supervisor', '2024-12-02 09:10:00'),
('Vishal Patel', 'vishal.patel@gmail.com', '9341786523', 'Cost Estimator', '2024-12-03 10:15:00'),
('Manoj Raj', 'manoj.raj@gmail.com', '9876543212', 'Project Manager', '2024-12-04 11:20:00'),
('Kalyani R', 'kalyani.r@gmail.com', '9605723810', 'Project Coordinator', '2024-12-05 12:00:00'),
('Sundaram Selvam', 'sundaram.selvam@gmail.com', '9623456780', 'Procurement Officer', '2024-12-06 13:00:00'),
('Suresh Iyer', 'suresh.iyer@gmail.com', '9736214895', 'Site Engineer', '2024-12-07 14:30:00'),
('Pradeep Kumar', 'pradeep.kumar@gmail.com', '9445156710', 'Project Architect', '2024-12-08 15:00:00'),
('Anjali Iyer', 'anjali.iyer@gmail.com', '9623098754', 'Safety Officer', '2024-12-09 16:10:00'),
('Nithya Rajan', 'nithya.rajan@gmail.com', '9601283746', 'Civil Engineer', '2024-12-10 17:00:00'),
('Rajesh R', 'rajesh.r@gmail.com', '9348756120', 'Construction Manager', '2024-12-11 18:00:00'),
('Lakshmi Devi', 'lakshmi.devi@gmail.com', '9776543987', 'Project Coordinator', '2024-12-12 19:10:00'),
('Prakash Subramani', 'prakash.subramani@gmail.com', '9265314280', 'Procurement Manager', '2024-12-13 20:00:00'),
('Sivaraman K', 'sivaraman.k@gmail.com', '9674318290', 'Site Supervisor', '2024-12-14 21:00:00'),
('Nandhini K', 'nandhini.k@gmail.com', '9657384931', 'Cost Estimator', '2024-12-15 22:10:00'),
('Ganesh Iyer', 'ganesh.iyer@gmail.com', '9328745013', 'Quality Control', '2024-12-16 08:30:00'),
('Selvarani Nair', 'selvarani.nair@gmail.com', '9615748903', 'Project Manager', '2024-12-17 09:00:00'),
('Madhavi Shankar', 'madhavi.shankar@gmail.com', '9765217430', 'Construction Foreman', '2024-12-18 10:15:00'),
('Raghav Kumar', 'raghav.kumar@gmail.com', '9816223547', 'Project Coordinator', '2024-12-19 11:25:00'),
('Surya R', 'surya.r@gmail.com', '9745628034', 'Safety Officer', '2024-12-20 12:40:00'),
('Jayakumar V', 'jayakumar.v@gmail.com', '9886777432', 'Architect', '2024-12-21 13:50:00'),
('Gopal Kumar', 'gopal.kumar@gmail.com', '9602134875', 'Construction Foreman', '2024-12-22 14:10:00'),
('Preethi N', 'preethi.n@gmail.com', '9745123498', 'Procurement Officer', '2024-12-23 15:30:00'),
('Ashwin Raj', 'ashwin.raj@gmail.com', '9832476501', 'Project Architect', '2024-12-24 16:20:00'),
('Vidhya Suresh', 'vidhya.suresh@gmail.com', '9865437210', 'Project Manager', '2024-12-25 17:00:00'),
('Ajith Kumar', 'ajith.kumar@gmail.com', '9764283905', 'Site Supervisor', '2024-12-26 18:10:00'),
('Madhuri Selvan', 'madhuri.selvan@gmail.com', '9376348109', 'Civil Engineer', '2024-12-27 19:20:00'),
('Karthik R', 'karthik.r@gmail.com', '9476723581', 'Quality Inspector', '2024-12-28 20:00:00'),
('Jaya Nair', 'jaya.nair@gmail.com', '9705294380', 'Safety Officer', '2024-12-29 21:10:00'),
('Sudha Rani', 'sudha.rani@gmail.com', '9601847592', 'Construction Manager', '2024-12-30 22:00:00'),
('Kumar R', 'kumar.r@gmail.com', '9365418927', 'Procurement Manager', '2024-12-31 23:00:00'),
('Suresh V', 'suresh.v@gmail.com', '9445356789', 'Architect', '2025-01-01 08:00:00'),
('Ananya Raj', 'ananya.raj@gmail.com', '9876342189', 'Site Engineer', '2025-01-02 09:00:00'),
('Krishna N', 'krishna.n@gmail.com', '9756321847', 'Cost Estimator', '2025-01-03 10:00:00'),
('Ashwini Kumar', 'ashwini.kumar@gmail.com', '9323748615', 'Quality Control', '2025-01-04 11:00:00'),
('Madhavi Iyer', 'madhavi.iyer@gmail.com', '9223475186', 'Construction Foreman', '2025-01-05 12:00:00');
INSERT INTO Task_Categories (Category_Name, Description, In_Active, Created_at, Updated_at)
VALUES
('Foundation', 'Tasks related to building the foundation of the structure.', TRUE, '2018-01-15 08:00:00', '2018-01-20 10:00:00'),
('Framing', 'Tasks related to the framing of walls, floors, and ceilings.', FALSE, '2018-03-10 09:00:00', '2018-03-15 09:15:00'),
('Plumbing', 'Installation of plumbing systems, including pipes and fixtures.', TRUE, '2018-06-20 10:00:00', '2018-07-01 12:30:00'),
('Electrical', 'Tasks related to electrical wiring and installations.', TRUE, '2019-02-10 11:00:00', '2019-02-20 14:00:00'),
('Roofing', 'Roof installation and repairs.', FALSE, '2019-05-15 12:00:00', '2019-05-20 12:20:00'),
('Windows & Doors', 'Installation of windows and doors for the building.', TRUE, '2019-09-01 08:00:00', '2019-09-10 10:30:00'),
('Interior Finishing', 'Tasks related to interior finishes like painting, drywall, etc.', TRUE, '2020-01-10 09:00:00', '2020-01-15 11:45:00'),
('Exterior Finishing', 'Tasks related to exterior finishes like cladding, siding, etc.', FALSE, '2020-05-05 14:00:00', '2020-05-10 14:30:00'),
('Landscaping', 'Tasks related to outdoor landscaping and hardscaping.', TRUE, '2020-09-15 16:00:00', '2020-09-25 17:15:00'),
('Demolition', 'Demolition and removal of existing structures or parts.', TRUE, '2021-03-01 17:00:00', '2021-03-10 18:30:00'),
('Masonry', 'Tasks involving stone, brick, or concrete work.', TRUE, '2021-07-15 18:00:00', '2021-07-25 19:00:00'),
('HVAC', 'Heating, ventilation, and air conditioning tasks.', FALSE, '2021-12-10 09:00:00', '2021-12-20 09:30:00'),
('Waterproofing', 'Tasks related to water protection of the building.', TRUE, '2022-03-15 11:00:00', '2022-03-25 12:45:00'),
('Insulation', 'Installation of insulation to regulate temperature.', TRUE, '2022-07-01 12:00:00', '2022-07-10 13:30:00'),
('Concrete Work', 'Tasks involving the mixing, pouring, and finishing of concrete.', TRUE, '2022-11-20 08:00:00', '2022-12-01 09:00:00'),
('Steel Work', 'Installation and welding of steel structures.', FALSE, '2023-01-15 14:00:00', '2023-01-20 14:45:00'),
('Drywall', 'Installation and finishing of drywall.', TRUE, '2023-04-10 10:00:00', '2023-04-15 11:15:00'),
('Flooring', 'Installation of various types of flooring materials.', TRUE, '2023-08-05 11:00:00', '2023-08-15 12:00:00'),
('Painting', 'Tasks related to interior and exterior painting of the structure.', FALSE, '2023-12-01 14:00:00', '2023-12-10 14:45:00'),
('Cabinetry', 'Installation of cabinets, shelves, and storage systems.', TRUE, '2024-02-20 08:00:00', '2024-02-28 09:30:00'),
('Finishing Touches', 'Final finishing tasks like trimming, molding, etc.', TRUE, '2024-04-10 10:00:00', '2024-04-15 11:45:00'),
('Security Systems', 'Installation of security systems like alarms and cameras.', FALSE, '2024-06-05 12:00:00', '2024-06-10 12:15:00'),
('Site Cleanup', 'Cleaning the site after construction is complete.', TRUE, '2024-07-15 14:00:00', '2024-07-20 15:00:00'),
('Transportation', 'Logistics related to transporting materials and workers.', TRUE, '2024-09-01 16:00:00', '2024-09-10 16:45:00'),
('Surveying', 'Land surveying tasks before and during construction.', TRUE, '2024-10-15 18:00:00', '2024-10-20 19:15:00');

INSERT INTO Project (Project_Name, Client_Id, Description, Start_Date, End_Date, Status, Created_at, Updated_at) VALUES
('Mixed-Use Commercial Complex', 144, 'Development of a mixed-use commercial complex in the heart of the city.', '2027-08-01', '2028-08-01', 'Planned', '2027-08-01 09:00:00', '2024-11-26 10:00:00'),
('Corporate Headquarter Tower', 145, 'A modern corporate headquarter tower for a major firm.', '2027-09-01', '2028-09-01', 'In Progress', '2027-09-01 10:00:00', '2024-11-26 10:00:00'),
('Luxury Hotel and Resort', 146, 'High-end hotel and resort with luxurious amenities and sea view.', '2027-10-01', '2028-10-01', 'Planned', '2027-10-01 09:00:00', '2024-11-26 10:00:00'),
('Educational Campus', 147, 'A state-of-the-art educational campus for a leading institution.', '2027-11-01', '2028-11-01', 'Completed', '2027-11-01 09:30:00', '2024-11-26 10:00:00'),
('Healthcare Facility and Research Center', 148, 'A world-class healthcare facility combined with a research center.', '2027-12-01', '2028-12-01', 'Planned', '2027-12-01 10:00:00', '2024-11-26 10:00:00'),
('Residential Tower', 149, 'A high-rise residential tower offering luxury apartments.', '2028-01-01', '2029-01-01', 'In Progress', '2028-01-01 11:00:00', '2024-11-26 10:00:00'),
('Industrial Park Development', 150, 'Large-scale industrial park development with modern facilities.', '2028-02-01', '2029-02-01', 'Planned', '2028-02-01 09:00:00', '2024-11-26 10:00:00'),
('Residential Township', 151, 'A residential township with over 200 homes, including parks and schools.', '2028-03-01', '2029-03-01', 'Completed', '2028-03-01 09:30:00', '2024-11-26 10:00:00'),
('Luxury Apartments', 152, 'Development of exclusive luxury apartments with premium amenities.', '2028-04-01', '2029-04-01', 'In Progress', '2028-04-01 10:00:00', '2024-11-26 10:00:00'),
('Luxury Apartment Complex 200 Units', 164, 'Construction of a luxury apartment complex with 200 units.', '2024-01-10', '2025-01-10', 'In Progress', '2024-01-10 09:00:00', '2024-11-26 10:00:00'),
('Modern Residential Apartment Complex with Amenities', 180, 'A modern residential apartment complex with amenities.', '2024-02-15', '2025-02-15', 'Planned', '2024-02-15 08:30:00', '2024-11-26 10:00:00'),
('Beachfront Resort', 161, 'Development of a beachfront resort with villas and facilities.', '2024-03-01', '2025-03-01', 'Planned', '2024-03-01 08:00:00', '2024-11-26 10:00:00'),
('High-Rise Commercial Tower', 182, 'A high-rise commercial building for office spaces.', '2024-03-15', '2025-03-15', 'In Progress', '2024-03-15 09:00:00', '2024-11-26 10:00:00'),
('Community Center', 153, 'Construction of a community center for social events and gatherings.', '2024-04-01', '2024-10-01', 'Completed', '2024-04-01 10:00:00', '2024-10-01 17:00:00'),
('Corporate Headquarters', 169, 'New headquarters building for a leading tech company.', '2024-05-10', '2025-05-10', 'Planned', '2024-05-10 09:30:00', '2024-11-26 10:00:00'),
('Corporate Office Complex', 145, 'A modern office complex for a corporate client.', '2024-06-01', '2025-06-01', 'In Progress', '2024-06-01 08:00:00', '2024-11-26 10:00:00'),
('Education Center', 157, 'Establishment of an education center for training programs.', '2024-07-01', '2025-07-01', 'Planned', '2024-07-01 09:00:00', '2024-11-26 10:00:00'),
('Educational Institute with Dormitories', 178, 'Development of an educational campus with classrooms and dormitories.', '2024-08-01', '2025-08-01', 'In Progress', '2024-08-01 10:00:00', '2024-11-26 10:00:00'),
('Factory Building', 163, 'Construction of a factory building for manufacturing products.', '2024-09-01', '2025-09-01', 'On Hold', '2024-09-01 11:00:00', '2024-11-26 10:00:00'),
('Factory Complex', 175, 'A large-scale industrial factory complex.', '2024-10-01', '2025-10-01', 'In Progress', '2024-10-01 08:30:00', '2024-11-26 10:00:00'),
('Government Office Building', 155, 'Construction of a government office building.', '2024-11-01', '2025-11-01', 'Completed', '2024-11-01 09:00:00', '2024-11-01 16:00:00'),
('Healthcare Center', 186, 'A healthcare facility for outpatient services.', '2024-12-01', '2025-12-01', 'Planned', '2024-12-01 09:00:00', '2024-11-26 10:00:00'),
('Healthcare Facility', 158, 'Building a healthcare facility with advanced medical equipment.', '2025-01-01', '2026-01-01', 'Planned', '2025-01-01 10:00:00', '2024-11-26 10:00:00'),
('Hospital Building', 172, 'Construction of a new hospital with 500 beds.', '2025-02-01', '2026-02-01', 'In Progress', '2025-02-01 09:00:00', '2024-11-26 10:00:00'),
('Luxury Hotel Complex', 162, 'Development of a luxury hotel complex with suites and restaurants.', '2025-03-01', '2026-03-01', 'In Progress', '2025-03-01 08:00:00', '2024-11-26 10:00:00'),
('Beachfront Hotel Complex', 179, 'A beachfront hotel complex with spa facilities.', '2025-04-01', '2026-04-01', 'Planned', '2025-04-01 09:00:00', '2024-11-26 10:00:00'),
('Urban Housing Scheme', 160, 'A government-sponsored housing scheme for low-income families.', '2025-05-01', '2026-05-01', 'Completed', '2025-05-01 10:00:00', '2025-05-01 18:00:00'),
('Industrial Complex with Warehouses', 166, 'Development of an industrial complex with warehouses and factories.', '2025-06-01', '2026-06-01', 'On Hold', '2025-06-01 08:30:00', '2024-11-26 10:00:00'),
('Industrial Manufacturing Facility', 184, 'Construction of an industrial facility for heavy machinery production.', '2025-07-01', '2026-07-01', 'Planned', '2025-07-01 09:00:00', '2024-11-26 10:00:00'),
('Industrial Park with Multiple Factories', 150, 'Development of an industrial park with multiple factories.', '2025-08-01', '2026-08-01', 'Planned', '2025-08-01 10:00:00', '2024-11-26 10:00:00'),
('Luxury Apartments with 300 Units', 154, 'Luxury apartment complex with 300 units and exclusive amenities.', '2025-09-01', '2026-09-01', 'In Progress', '2025-09-01 09:30:00', '2024-11-26 10:00:00'),
('High-End Luxury Apartments', 168, 'A high-end apartment project offering panoramic city views.', '2025-10-01', '2026-10-01', 'Planned', '2025-10-01 08:00:00', '2024-11-26 10:00:00'),
('Exclusive Luxury Villas', 147, 'Exclusive luxury villas with private pools and gardens.', '2025-11-01', '2026-11-01', 'Completed', '2025-11-01 09:00:00', '2025-11-01 17:00:00'),
('Mixed Use Development with Residential and Commercial Areas', 165, 'A mixed-use development with residential, commercial, and retail spaces.', '2025-12-01', '2026-12-01', 'Planned', '2025-12-01 10:00:00', '2024-11-26 10:00:00'),
('Large-Scale Mixed Use Development', 173, 'A large-scale mixed-use development featuring apartments and office buildings.', '2026-01-01', '2027-01-01', 'In Progress', '2026-01-01 09:00:00', '2024-11-26 10:00:00'),
('Modern Office Building', 176, 'Construction of a modern office building with 15 floors.', '2026-02-01', '2027-02-01', 'Completed', '2026-02-01 08:00:00', '2026-02-01 17:00:00'),
('Corporate Office Complex', 183, 'Development of a corporate office complex with parking and amenities.', '2026-03-01', '2027-03-01', 'Planned', '2026-03-01 09:00:00', '2024-11-26 10:00:00'),
('Office Tower with Premium Facilities', 148, 'A high-rise office tower with state-of-the-art facilities.', '2026-04-01', '2027-04-01', 'In Progress', '2026-04-01 10:00:00', '2024-11-26 10:00:00'),
('Luxury Residential Complex', 144, 'A luxury residential complex with swimming pool and fitness center.', '2026-05-01', '2027-05-01', 'Completed', '2026-05-01 09:00:00', '2026-05-01 18:00:00'),
('Residential Complex with 500 Units', 149, 'A large residential complex with 500 units and recreational areas.', '2026-06-01', '2027-06-01', 'In Progress', '2026-06-01 08:00:00', '2024-11-26 10:00:00'),
('Residential Development Project', 177, 'Development of a new residential neighborhood with parks and schools.', '2026-07-01', '2027-07-01', 'Planned', '2026-07-01 09:00:00', '2024-11-26 10:00:00'),
('Middle-Class Residential Flats', 152, 'Construction of residential flats for middle-income families.', '2026-08-01', '2027-08-01', 'Completed', '2026-08-01 09:30:00', '2026-08-01 18:00:00'),
('Modern Residential Flats', 181, 'Development of residential flats with modern amenities.', '2026-09-01', '2027-09-01', 'In Progress', '2026-09-01 08:00:00', '2024-11-26 10:00:00'),
('High-Rise Residential Tower', 170, 'A high-rise residential tower with luxury apartments.', '2026-10-01', '2027-10-01', 'Planned', '2026-10-01 09:00:00', '2024-11-26 10:00:00'),
('Residential Township with Schools', 156, 'Development of a residential township with integrated infrastructure, including schools.', '2026-11-01', '2027-11-01', 'In Progress', '2026-11-01 09:00:00', '2024-11-26 10:00:00'),
('Modern Retail Plaza', 167, 'Construction of a retail plaza with shops and food court.', '2027-01-01', '2028-01-01', 'Planned', '2027-01-01 10:00:00', '2024-11-26 10:00:00'),
('Premium Retail Space', 185, 'Development of retail space for businesses in a commercial hub.', '2027-02-01', '2028-02-01', 'In Progress', '2027-02-01 08:00:00', '2024-11-26 10:00:00'),
('Flagship Retail Store', 151, 'Construction of a flagship retail store with modern facilities.', '2027-03-01', '2028-03-01', 'Planned', '2027-03-01 09:00:00', '2024-11-26 10:00:00'),
('Modern Shopping Complex', 159, 'Development of a large shopping complex with retail outlets and entertainment areas.', '2027-04-01', '2028-04-01', 'In Progress', '2027-04-01 08:30:00', '2024-11-26 10:00:00'),
('High-End Shopping Mall', 146, 'Construction of a shopping mall with retail, dining, and entertainment options.', '2027-05-01', '2028-05-01', 'Planned', '2027-05-01 09:00:00', '2024-11-26 10:00:00'),
('Large Shopping Mall', 174, 'A large-scale shopping mall with international brands and amenities.', '2027-06-01', '2028-06-01', 'In Progress', '2027-06-01 10:00:00', '2024-11-26 10:00:00'),
('New Township Project', 171, 'Development of a new township project with residential, commercial, and recreational spaces.', '2027-07-01', '2028-07-01', 'Planned', '2027-07-01 09:00:00', '2024-11-26 10:00:00');
INSERT INTO Tasks (Project_Id, Assigned_To, Category_Id, Task_Title, Description, Start_Date, End_Date, Priority, Status) 
VALUES
(1, 1001, 812, 'Install Ventilation System', 'Install the HVAC ventilation system for air circulation', '2024-01-10', '2024-02-10', 'High', 'Not Started'),
(2, 1002, 804, 'Electrical Wiring Setup', 'Install wiring for electrical connections in residential building', '2024-01-15', '2024-02-05', 'Medium', 'In Progress'),
(3, 1003, 810, 'Excavation for Foundation', 'Excavate the foundation for the new office complex', '2024-02-01', '2024-02-20', 'High', 'Not Started'),
(4, 1004, 815, 'Concrete Slab Pouring', 'Pour concrete for the base slab of the commercial project', '2024-02-10', '2024-03-05', 'Medium', 'Completed'),
(5, 1005, 807, 'Drywall Framing', 'Frame drywall for the new office complex', '2024-03-01', '2024-03-20', 'Medium', 'In Progress'),
(6, 1006, 811, 'Interior Painting', 'Paint interior walls of the office building', '2024-03-15', '2024-03-30', 'Low', 'Not Started'),
(7, 1007, 809, 'Outdoor Landscaping', 'Complete landscaping for the new residential project', '2024-04-01', '2024-04-10', 'Medium', 'In Progress'),
(8, 1008, 803, 'Install Plumbing Systems', 'Install new plumbing systems for commercial complex', '2024-04-10', '2024-04-25', 'High', 'Not Started'),
(9, 1009, 812, 'HVAC Unit Testing', 'Test the HVAC units for operational efficiency', '2024-05-01', '2024-05-10', 'Low', 'In Progress'),
(10, 1010, 813, 'Insulation Work', 'Install insulation in the newly constructed building', '2024-05-15', '2024-05-30', 'Medium', 'Completed'),
(11, 1011, 804, 'Switch Connection Setup', 'Install and connect electrical switches in the office building', '2024-06-01', '2024-06-10', 'High', 'In Progress'),
(12, 1012, 815, 'Foundation Digging', 'Excavate and dig the foundation for the commercial tower', '2024-06-10', '2024-06-30', 'High', 'Completed'),
(13, 1013, 806, 'Flooring Installation', 'Install flooring for the new residential building', '2024-07-01', '2024-07-15', 'Low', 'In Progress'),
(14, 1014, 808, 'Exterior Painting', 'Paint exterior walls of the office building', '2024-07-15', '2024-07-30', 'Medium', 'Not Started'),
(15, 1015, 810, 'Framing for Roof', 'Frame the roof structure for the new apartment complex', '2024-08-01', '2024-08-15', 'High', 'In Progress'),
(16, 1016, 805, 'Electrical Panel Installation', 'Install electrical panel in the new factory', '2024-08-20', '2024-09-05', 'Medium', 'Completed'),
(17, 1017, 807, 'Drywall Hanging', 'Hang drywall in the new hospital', '2024-09-01', '2024-09-20', 'Low', 'In Progress'),
(18, 1018, 809, 'Site Landscaping', 'Prepare landscaping elements around the corporate campus', '2024-09-25', '2024-10-05', 'Medium', 'Not Started'),
(19, 1019, 804, 'Electrical Wiring Inspection', 'Inspect electrical wiring for compliance with safety codes', '2024-10-01', '2024-10-10', 'High', 'Completed'),
(20, 1020, 812, 'AC Duct Installation', 'Install air conditioning ducts throughout the commercial building', '2024-10-15', '2024-10-30', 'Low', 'Not Started'),
(21, 1021, 806, 'Flooring Work', 'Lay down flooring for the new school', '2024-11-01', '2024-11-15', 'Medium', 'In Progress'),
(22, 1022, 803, 'Plumbing Inspection', 'Inspect plumbing for leaks and system faults', '2024-11-10', '2024-11-20', 'High', 'Not Started'),
(23, 1023, 815, 'Concrete Foundation Pouring', 'Pour concrete for the foundation of the new residential complex', '2024-12-01', '2024-12-15', 'Medium', 'Completed'),
(24, 1024, 811, 'HVAC Ductwork Setup', 'Setup HVAC ductwork in commercial building', '2024-12-10', '2024-12-20', 'Low', 'In Progress'),
(25, 1025, 808, 'Masonry Work', 'Perform masonry work on the exterior walls of the office', '2025-01-05', '2025-01-20', 'High', 'Completed'),
(26, 1026, 809, 'Landscaping Design', 'Design landscaping for the new park near residential project', '2025-02-01', '2025-02-10', 'Medium', 'Not Started'),
(27, 1027, 810, 'Foundation Work', 'Excavate and lay foundation for the new shopping mall', '2025-02-20', '2025-03-10', 'Low', 'In Progress'),
(28, 1028, 803, 'Install Plumbing Piping', 'Install new piping for plumbing system in commercial building', '2025-03-01', '2025-03-15', 'High', 'Not Started'),
(29, 1029, 804, 'Circuit Breaker Setup', 'Setup circuit breakers for the electrical system', '2025-04-01', '2025-04-15', 'Medium', 'Completed'),
(30, 1030, 806, 'Tile Flooring', 'Install tile flooring in the restaurant complex', '2025-04-20', '2025-05-05', 'Low', 'In Progress'),
(31, 1031, 815, 'Concrete Road Paving', 'Pave the concrete roads for the new industrial park', '2025-05-01', '2025-05-20', 'High', 'Not Started'),
(32, 1032, 810, 'Reinforced Concrete', 'Set up reinforced concrete for structural support', '2025-06-01', '2025-06-10', 'Medium', 'Completed'),
(33, 1033, 812, 'Air Conditioning Install', 'Install air conditioning units in the corporate building', '2025-06-15', '2025-06-25', 'High', 'In Progress'),
(34, 1034, 808, 'Landscape Maintenance', 'Maintain landscaping in the office park area', '2025-07-01', '2025-07-15', 'Medium', 'Completed'),
(35, 1035, 803, 'Plumbing System Setup', 'Setup plumbing system for the new residential apartments', '2025-08-01', '2025-08-20', 'Low', 'Not Started'),
(36, 1036, 811, 'Heating System Installation', 'Install heating systems in the new office complex', '2025-08-25', '2025-09-10', 'High', 'In Progress'),
(37, 1037, 804, 'Socket Installation', 'Install power sockets in the new office building', '2025-09-01', '2025-09-15', 'Low', 'Completed'),
(38, 1038, 815, 'Concrete Framing', 'Complete framing of concrete for the new high-rise', '2025-10-01', '2025-10-15', 'High', 'Not Started'),
(39, 1039, 806, 'Hardwood Flooring', 'Install hardwood flooring for the hotel lobby', '2025-10-10', '2025-10-20', 'Medium', 'In Progress'),
(40, 1040, 812, 'Install Ductwork', 'Install ductwork in the new office space', '2025-11-01', '2025-11-15', 'High', 'Not Started'),
(41, 1041, 809, 'Outdoor Site Preparation', 'Prepare the site for landscaping and outdoor features', '2025-11-10', '2025-11-20', 'Medium', 'Completed'),
(42, 1042, 810, 'Foundation Pouring', 'Pour concrete foundation for new residential tower', '2025-12-01', '2025-12-10', 'Low', 'In Progress'),
(43, 1043, 803, 'Pipe Installation', 'Install pipes for water system in the school complex', '2026-01-01', '2026-01-15', 'High', 'Completed'),
(44, 1044, 811, 'AC System Setup', 'Setup air conditioning systems in the office complex', '2026-01-20', '2026-02-10', 'Low', 'In Progress'),
(45, 1045, 807, 'Insulation Installation', 'Install insulation in the new hospital building', '2026-02-01', '2026-02-15', 'Medium', 'Not Started'),
(46, 1046, 808, 'Garden Design', 'Design the garden area for the residential complex', '2026-02-20', '2026-03-05', 'Low', 'Completed'),
(47, 1047, 810, 'Site Preparation', 'Prepare site for building construction in industrial zone', '2026-03-01', '2026-03-15', 'High', 'In Progress'),
(48, 1048, 803, 'Leak Inspection', 'Inspect plumbing for water leaks in the school building', '2026-03-20', '2026-03-30', 'Medium', 'Completed'),
(49, 1049, 809, 'Landscaping Setup', 'Complete landscaping and gardening around the residential area', '2026-04-01', '2026-04-10', 'Low', 'Not Started'),
(50, 1050, 815, 'Concrete Mixing', 'Mix and prepare concrete for the new warehouse', '2026-04-15', '2026-04-25', 'Medium', 'In Progress'),
(51, 1051, 806, 'Tile Work', 'Install tile flooring in the new retail store', '2026-05-01', '2026-05-15', 'Low', 'Completed'),
(52, 1052, 803, 'Water Testing', 'Conduct water quality testing for the new residential complex', '2026-05-20', '2026-05-30', 'High', 'Not Started');
INSERT INTO milestones (Project_ID, Name, Description, Due_Date, Status, Created_at, Updated_at) VALUES
(17, 'Initial Excavation', 'Excavation of site for the warehouse project.', '2025-05-01', 'Planned', '2024-11-26 13:20:00', '2024-11-26 13:20:00'),
(34, 'Rebar Installation', 'Rebar installation for the school building project.', '2025-06-01', 'Planned', '2024-11-26 13:25:00', '2024-11-26 13:25:00'),
(52, 'Structural Framing Completion', 'Completion of the structural framing for the hotel project.', '2025-07-01', 'Planned', '2024-11-26 13:30:00', '2024-11-26 13:30:00'),
(12, 'Water Supply Line', 'Installation of water supply lines for the housing project.', '2025-08-01', 'Planned', '2024-11-26 13:35:00', '2024-11-26 13:35:00'),
(47, 'Facade Installation', 'Installation of the facade for the office complex.', '2025-09-01', 'Planned', '2024-11-26 13:40:00', '2024-11-26 13:40:00'),
(28, 'Guttering & Downspouts', 'Installation of guttering and downspouts for the warehouse.', '2025-10-01', 'Planned', '2024-11-26 13:45:00', '2024-11-26 13:45:00'),
(5, 'Internal Painting', 'Internal painting for the industrial complex.', '2025-11-01', 'Planned', '2024-11-26 13:50:00', '2024-11-26 13:50:00'),
(14, 'Window Fitments', 'Window fitments and sealing for the school building.', '2025-12-01', 'Planned', '2024-11-26 13:55:00', '2024-11-26 13:55:00'),
(37, 'Final Electrical Testing', 'Final testing of electrical systems for the retail store.', '2026-01-01', 'Planned', '2024-11-26 14:00:00', '2024-11-26 14:00:00'),
(33, 'Paving & Roadwork', 'Paving and roadwork for the commercial plaza.', '2026-02-01', 'Planned', '2024-11-26 14:05:00', '2024-11-26 14:05:00'),
(45, 'Facade Painting', 'Exterior facade painting for the office building.', '2026-03-01', 'Planned', '2024-11-26 14:10:00', '2024-11-26 14:10:00'),
(18, 'Foundation Shoring', 'Shoring and stabilization of the foundation.', '2026-04-01', 'Planned', '2024-11-26 14:15:00', '2024-11-26 14:15:00'),
(26, 'Security System Installation', 'Installation of security systems for the business center.', '2026-05-01', 'Planned', '2024-11-26 14:20:00', '2024-11-26 14:20:00'),
(30, 'Bathroom Fitment', 'Installation of bathroom fittings for the hospital project.', '2026-06-01', 'Planned', '2024-11-26 14:25:00', '2024-11-26 14:25:00'),
(49, 'Final Walkthrough', 'Conduct final walkthrough for the mixed-use building.', '2026-07-01', 'Planned', '2024-11-26 14:30:00', '2024-11-26 14:30:00'),
(21, 'First Floor Electrical', 'Electrical work for the first floor of the commercial building.', '2026-08-01', 'Planned', '2024-11-26 14:35:00', '2024-11-26 14:35:00'),
(46, 'Landscape Installation', 'Landscape installation for the luxury villas project.', '2026-09-01', 'Planned', '2024-11-26 14:40:00', '2024-11-26 14:40:00'),
(41, 'Final Site Survey', 'Final site survey for the community center project.', '2026-10-01', 'Planned', '2024-11-26 14:45:00', '2024-11-26 14:45:00'),
(3, 'External Waterproofing', 'Waterproofing of external walls for the office complex.', '2026-11-01', 'Planned', '2024-11-26 14:50:00', '2024-11-26 14:50:00'),
(9, 'Balcony Construction', 'Construction of balconies for the residential complex.', '2026-12-01', 'Planned', '2024-11-26 14:55:00', '2024-11-26 14:55:00'),
(10, 'Utility Systems Installation', 'Installation of utility systems for the healthcare facility.', '2027-01-01', 'Planned', '2024-11-26 15:00:00', '2024-11-26 15:00:00'),
(31, 'Testing & Commissioning', 'Testing and commissioning of electrical systems for the commercial plaza.', '2027-02-01', 'Planned', '2024-11-26 15:05:00', '2024-11-26 15:05:00'),
(24, 'Final Approval', 'Final approval for all works completed in the township project.', '2027-03-01', 'Planned', '2024-11-26 15:10:00', '2024-11-26 15:10:00'),
(22, 'Safety Inspection', 'Inspection of safety measures for the industrial project.', '2027-04-01', 'Planned', '2024-11-26 15:15:00', '2024-11-26 15:15:00'),
(23, 'Wall Cladding', 'Installation of wall cladding for the educational center.', '2027-05-01', 'Planned', '2024-11-26 15:20:00', '2024-11-26 15:20:00'),
(15, 'Interior Design', 'Final interior design and decoration work for the commercial tower.', '2027-06-01', 'Planned', '2024-11-26 15:25:00', '2024-11-26 15:25:00'),
(4, 'Foundation Inspection', 'Inspection of foundation work for the business center.', '2027-07-01', 'Planned', '2024-11-26 15:30:00', '2024-11-26 15:30:00'),
(16, 'Demolition & Clearance', 'Demolition and clearance of site for new construction.', '2027-08-01', 'Planned', '2024-11-26 15:35:00', '2024-11-26 15:35:00'),
(19, 'Plastering Work', 'Plastering of the walls for the educational center.', '2027-09-01', 'Planned', '2024-11-26 15:40:00', '2024-11-26 15:40:00'),
(32, 'Project Handover', 'Final handover of the office complex project to the client.', '2027-10-01', 'Planned', '2024-11-26 15:45:00', '2024-11-26 15:45:00'),
(8, 'Initial Excavation', 'Excavation of site for the warehouse project.', '2025-05-01', 'Planned', '2024-11-26 15:50:00', '2024-11-26 15:50:00'),
(13, 'Rebar Installation', 'Rebar installation for the school building project.', '2025-06-01', 'Planned', '2024-11-26 15:55:00', '2024-11-26 15:55:00'),
(42, 'Structural Framing Completion', 'Completion of the structural framing for the hotel project.', '2025-07-01', 'Planned', '2024-11-26 16:00:00', '2024-11-26 16:00:00'),
(6, 'Water Supply Line', 'Installation of water supply lines for the housing project.', '2025-08-01', 'Planned', '2024-11-26 16:05:00', '2024-11-26 16:05:00'),
(20, 'Facade Installation', 'Installation of the facade for the office complex.', '2025-09-01', 'Planned', '2024-11-26 16:10:00', '2024-11-26 16:10:00'),
(35, 'Guttering & Downspouts', 'Installation of guttering and downspouts for the warehouse.', '2025-10-01', 'Planned', '2024-11-26 16:15:00', '2024-11-26 16:15:00'),
(25, 'Internal Painting', 'Internal painting for the industrial complex.', '2025-11-01', 'Planned', '2024-11-26 16:20:00', '2024-11-26 16:20:00'),
(38, 'Window Fitments', 'Window fitments and sealing for the school building.', '2025-12-01', 'Planned', '2024-11-26 16:25:00', '2024-11-26 16:25:00'),
(44, 'Final Electrical Testing', 'Final testing of electrical systems for the retail store.', '2026-01-01', 'Planned', '2024-11-26 16:30:00', '2024-11-26 16:30:00'),
(50, 'Paving & Roadwork', 'Paving and roadwork for the commercial plaza.', '2026-02-01', 'Planned', '2024-11-26 16:35:00', '2024-11-26 16:35:00'),
(11, 'Facade Painting', 'Exterior facade painting for the office building.', '2026-03-01', 'Planned', '2024-11-26 16:40:00', '2024-11-26 16:40:00'),
(29, 'Foundation Shoring', 'Shoring and stabilization of the foundation.', '2026-04-01', 'Planned', '2024-11-26 16:45:00', '2024-11-26 16:45:00'),
(48, 'Security System Installation', 'Installation of security systems for the business center.', '2026-05-01', 'Planned', '2024-11-26 16:50:00', '2024-11-26 16:50:00'),
(51, 'Bathroom Fitment', 'Installation of bathroom fittings for the hospital project.', '2026-06-01', 'Planned', '2024-11-26 16:55:00', '2024-11-26 16:55:00'),
(40, 'Final Walkthrough', 'Conduct final walkthrough for the mixed-use building.', '2026-07-01', 'Planned', '2024-11-26 17:00:00', '2024-11-26 17:00:00'),
(7, 'First Floor Electrical', 'Electrical work for the first floor of the commercial building.', '2026-08-01', 'Planned', '2024-11-26 17:05:00', '2024-11-26 17:05:00'),
(36, 'Landscape Installation', 'Landscape installation for the luxury villas project.', '2026-09-01', 'Planned', '2024-11-26 17:10:00', '2024-11-26 17:10:00'),
(39, 'Final Site Survey', 'Final site survey for the community center project.', '2026-10-01', 'Planned', '2024-11-26 17:15:00', '2024-11-26 17:15:00'),
(27, 'External Waterproofing', 'Waterproofing of external walls for the office complex.', '2026-11-01', 'Planned', '2024-11-26 17:20:00', '2024-11-26 17:20:00');

delimiter $$
create procedure GetTasksByAssignedUser(IN user_id INT)
begin
    select 
        u.User_Id, 
        u.User_Name, 
        t.Task_Id, 
        t.Task_Title, 
        t.Description, 
        p.Project_Name, 
        t.Status, 
        t.Priority,
        t.Start_Date, 
        t.End_Date
    from Tasks t
    join Project p on t.Project_Id = p.Project_Id
    join Users u on t.Assigned_To = u.User_Id
    where t.Assigned_To = user_id;
end$$
delimiter ;

delimiter $$
create procedure GetMilestonesByProject(IN project_id INT)
begin
    select 
        m.Milestone_Id, 
        m.Name AS Milestone_Name, 
        m.Description, 
        m.Due_Date, 
        m.Status
    from Milestones m
    where m.Project_Id = project_id;
end$$
delimiter ;

delimiter $$
create procedure GetTasksByCategory(in category_id int)
begin
    select 
        t.Task_Id,
        t.Task_Title,
        t.Description,
        u.User_Name AS Assigned_To,
        t.Status
    from Tasks t
    join Users u on t.Assigned_To = u.User_Id
    where t.Category_Id = category_id;
end$$
delimiter ;

delimiter $$
create procedure GetProjectsByClient(IN client_id INT)
begin
    select 
        p.client_id,
        p.Project_Id,
        p.Project_Name,
        p.Description,
        p.Start_Date,
        p.End_Date,
        p.Status
    from Project p
    where p.Client_Id =client_id;
end$$
delimiter ;

delimiter $$
create procedure GetTasksByProject(IN project_id INT)
begin
    select 
        t.Task_Id,
        t.Task_Title,
        t.Description,
        u.User_Name AS Assigned_To,
        t.Start_Date,
        t.End_Date,
        t.Status
    from Tasks t
    join Users u on t.Assigned_To = u.User_Id
    where t.Project_Id = project_id;
end$$
delimiter ;

delimiter $$
create procedure GetMilestoneStatusSummary(in project_id int)
begin
    select 
        m.Status,
        COUNT(m.Milestone_Id) AS Milestone_Count
    from Milestones m
    where m.Project_Id = project_id
    group by m.Status;
end$$ 
delimiter ;

delimiter $$
create procedure GetTasksByUser(IN user_id INT)
begin
    select 
        t.Assigned_To AS User_Id,
        t.Task_Id, 
        t.Task_Title, 
        t.Description, 
        t.Start_Date, 
        t.End_Date, 
        t.Status,
        p.Project_Name
    from Tasks t
    join Project p ON t.Project_Id = p.Project_Id
    where t.Assigned_To = user_id;
end$$
delimiter ;

delimiter $$
create procedure GetTaskCountByStatus(
    in project_id int,
    out not_started_count int,
    out in_progress_count int,
    out completed_count int
)
begin
    select count(*) into not_started_count
    from Tasks
    where Project_Id = project_id AND Status = 'Not Started';

    select count(*) into in_progress_count
    from Tasks
    where Project_Id = project_id AND Status = 'In Progress';

    select count(*) into completed_count
    from Tasks
    where Project_Id = project_id AND Status = 'Completed';
end$$
delimiter ;

delimiter $$
create procedure GetTasksByCategory(in category_id int)
begin
    select 
        t.Task_Id, 
        t.Task_Title, 
        t.Assigned_To AS User_Id, 
        t.Status 
    from Tasks t
    where t.Category_Id = category_id;
end$$
delimiter ;

delimiter $$
create procedure GetHighPriorityTasksStatus()
begin
    select 
        t.Task_Id,
        t.Task_Title,
        t.Assigned_To AS User_Id,
        t.Status,
        t.Priority
    from Tasks t
    where t.Priority = 'High'
    order by t.Task_Id;
end$$
delimiter ;


call GetTasksByAssignedUser(1008); 
call GetMilestonesByProject(15); 
call GetTasksByCategory(812);
call GetProjectsByClient(149); 
call GetTasksByProject(5);
call GetMilestoneStatusSummary(45);
call GetTasksByUser(1005);

set @not_started = 0;
set @in_progress = 0;
set @completed = 0;
call GetTaskCountByStatus(42, @not_started, @in_progress, @completed);
select @not_started AS Not_Started, @in_progress AS In_Progress, @completed AS Completed;
call GetHighPriorityTasksStatus();
