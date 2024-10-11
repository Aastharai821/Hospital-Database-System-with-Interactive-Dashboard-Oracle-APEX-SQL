# Screenshots
## Composite ERD 
![Composite EERD](https://github.com/user-attachments/assets/a755b973-ec2a-47a2-b3e6-93ed93978411)
*Description:* This is the composite Extended Entity Relationship Diagram (ERD) showcasing the overall structure of the hospital database. It includes entities like Doctor, Care Centre, Residential Wing, Room, Waiting List, and Patient, along with their relationships.

## Master-Detail Page: Care Centre Overview
![side-by-side master-detail page](https://github.com/user-attachments/assets/553775e0-58d9-4a9b-ba49-1d3a8f6198db)
*Description:* A Master-Detail page that displays the Care Centre table as the master, with Doctor and Patient tables as the detail tables. It allows hospital administrators to navigate and view detailed information on doctors and patients associated with each care centre.

## Master-Detail Page: Doctor Details in Global Health Care Centre
![Master Detail page showing Doctor details working in Global Health care centre](https://github.com/user-attachments/assets/5df17e8c-48b1-4de1-9ce9-a3a4530f4aae)
*Description:* This page displays the details of doctors working in the Global Health Care Centre. It provides information about the doctors linked to the selected care centre.

## Master-Detail Page: Patient Details in Global Health Care Centre
![Master Detail page showing Patient details admitted in Global Health care centre](https://github.com/user-attachments/assets/f7535bbd-27b4-4f8a-b020-3956d3161c71)
*Description:* This page shows patient details for the Global Health Care Centre, listing patients admitted to the care centre.

## Update Operation: Doctor Record
![updated on Doctor table](https://github.com/user-attachments/assets/dd02ce94-cd42-42e1-8fcb-a72a2e0fdf91)
*Description:* The first name of the doctor "Samantha" is updated to "Simon" in the Doctor table. This screenshot shows the process of updating the doctor’s first name.

![update2](https://github.com/user-attachments/assets/3c17aaae-6796-43e4-b7ab-3eb0d9ef7696)
*Description:*  selected Doctor first name is update to Simon

![update3](https://github.com/user-attachments/assets/087f479c-9d83-4a33-990d-f1583d095202)
*Description:* "Samantha" updated to "Simon"

## Delete Operation: Patient Record
![Deletion1](https://github.com/user-attachments/assets/419ba3a6-36d8-4a24-ad4c-0de89c741b80)
*Description:* A patient record (Patient no. 9) is about to be deleted. The delete operation is triggered, and the corresponding value is also removed from the Object Browser.

![Deletion2](https://github.com/user-attachments/assets/39b8635d-748a-436f-b9ef-b9e110e7fbdb)
*Description:* Patient_no:9 going for delete operation on clicking the "Delete" button. Here, Delete button is created in the back-end side of this form which deletes the selected data. 

![Deletion3](https://github.com/user-attachments/assets/82d0145a-62ea-4c2b-aecf-df543ff60ef6)
*Description:*  Screenshot after Delete operation (When the values are deleted from this application, the value are also automatically deleted from the Object Browser)

## Create Operation: Adding New Patient Record
![create1](https://github.com/user-attachments/assets/f984d301-195d-481c-a3e7-1d04508f0103)
*Description:* An interactive form for creating a new patient record. The `patient_no` is automatically generated via a sequence, and form fields are used for data entry. Inline CSS is applied for styling.

![create2](https://github.com/user-attachments/assets/bd91a1d9-1524-431c-b859-dc3668126b11)
*Description:* This is the form of `Patient`. As seen in the screenshot above, the primary key of the Patient
table i.e.,`patient_no` is not visible in the form. This is to maintain the integrity. Such primary
keys are generated through sequence in the back-end and it will be auto-generated here when
a new patient credentials are created.
- 'Select list' has been opted for "Centre_id" in the form. Also, to make it visually appealing,
style to the background-color has been added in this item by adding inline CSS to the Custom
attributes in the back-end.
- The asterisk * signs in the form means they are supposed to be filled up and not left null.
- Radio buttons are added for Gender column.
- Validations are added for contact numbers.

![create3](https://github.com/user-attachments/assets/b48e30fd-b714-4b34-b5d5-4e634f2d23af)
*Description:* Screenshot of an Interactive report of patient table after a new value is added

## Doctor Availability Report (Bar Chart)
**Front End**
![doctor availabilty](https://github.com/user-attachments/assets/ae138999-420d-4d43-bc32-ddd34768ebb7)
*Description:* This bar chart displays the availability of doctors by specialty, helping hospital administrators manage doctor resources and quickly determine availability in different specialties.

**Back End**
![doctor availability back end](https://github.com/user-attachments/assets/802da098-e04a-4cb3-8ac5-8c32b4c50a30)
*Description:* The back-end configuration for generating the "On Call Doctors by Specialty" report. This screenshot shows the SQL query and chart settings used to generate the bar chart, where the number of available doctors for each specialty is calculated and displayed.

![doctor availabilty 3](https://github.com/user-attachments/assets/b0e9dfdb-123b-431b-b323-cee27d998bea)
*Description:* This SQL code counts the number of available doctors for each specialty. It selects the
specialty column and uses the COUNT(*) function to calculate the count of doctors. `WHERE` clause filters for doctors with an availability status of 'Available' is used. The results are then grouped by specialty.

![doctor availabilty 4](https://github.com/user-attachments/assets/59c26508-8094-40d8-885c-dca08b6004fc)
*Description:* Screenshot of the Column Mapping for the page that displays the pie chart report. For the column mapping of this chart, specialty column from the Doctor table is selected and the column 'available doctors' is selected for Value. This means that the count result gotten from the SQL query used above is used as value to determine the size of the divided part whereas for labelling speciality attribute is used. 

## Room Availability Report
**Front End**
![room 1](https://github.com/user-attachments/assets/b295ff6a-ead2-4562-8c54-b9cdaa7bd435)
*Description:* This report shows the available rooms within each residential block, along with room type and capacity. Administrators can drill down for more detailed insights on room availability.

**Back End**
![room 2](https://github.com/user-attachments/assets/c36f73f3-9206-4892-99b0-83a20bbebda6)
*Description:* The SQL query and configuration for generating the "Room Availability" report. The query retrieves information about available rooms and their respective residential blocks, filtered by occupancy status.

![room 3](https://github.com/user-attachments/assets/3590fa35-9f1b-4805-b2c2-1c637848da79)
*Description:* Closer look of the SQL Query (Back End of Room Availability Report)

## Care Centre Ranking by Patient Volume
**Front End**
![cc ranking 1](https://github.com/user-attachments/assets/42be2a67-1e7b-4270-a473-dc9a0b6a2cb9)
*Description:* This horizontal bar chart ranks care centres by patient volume. It helps the management team identify which care centres are experiencing higher patient loads, useful for resource allocation and patient referrals.

**Back End**
![cc ranking 2](https://github.com/user-attachments/assets/d051e119-c4e1-402f-bd1b-b72f70599770)
*Description:* The SQL query and back-end setup for generating the care centre ranking report. The query retrieves the total number of patients per care centre and orders them by patient volume in descending order.

## Patients by Gender per Care Centre
**Front End**
![gender 1](https://github.com/user-attachments/assets/5a737c56-401d-4152-bf15-2fab396c948e)
*Description:* A bar chart displaying the gender distribution of patients at each care centre, showing the number of male and female patients. This helps in analyzing the patient demographics across different hospital units.

**Back End**
![gender 2](https://github.com/user-attachments/assets/ae492bf9-5d1a-4a2d-9572-8faf8f0a970f)
*Description:* TThe SQL query used to generate the "Patients by Gender per Care Centre" report. The query joins the Patient and Care Centre tables and counts the number of male and female patients for each care centre.

## Patients with High Bed Priority
**Front End**
![bed pr 1](https://github.com/user-attachments/assets/72a3b13f-41f3-4cc9-8973-f52a666fdb83)
*Description:* A classic report listing patients with high bed priority, helping hospital staff prioritize care for patients based on the severity of their condition. This report is crucial for managing patient queues and prioritizing treatment.

**Back End**
![bed pr 2](https://github.com/user-attachments/assets/a6ae8b83-d842-430f-bdae-6e2a378ce822)
*Description:* he SQL query and back-end configuration for the "Patients with High Bed Priority" report. The query concatenates patient names and retrieves bed priority and other details from the Patient and Waiting List tables.

## Dashboard Overview
![dashboard](https://github.com/user-attachments/assets/e34c7d16-6392-4330-afc4-4b8afb7e4f89)
*Description:* This is the main dashboard of the application, giving a high-level overview of hospital operations, including patient and doctor distribution and room availability. The dashboard uses drill-down functionality for more detailed reports.

## Second Master-Detail Page: Room and Waiting List
![second master](https://github.com/user-attachments/assets/d8c0685a-7f58-4066-8e3e-19a8213dec64)
*Description:* The second Master-Detail page shows the Room table as the master and the Waiting List as the detail. It allows administrators to monitor patients on the waiting list for each room, along with bed priorities.

