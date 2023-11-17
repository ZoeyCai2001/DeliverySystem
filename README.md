# Deliverysystem
Developed a delivery tracking system using SQL Server, including table design, function implementation, and data integrity triggers, fulfilling user needs of costumers, businesses, and deliverymen.
### System Overview
#### (1) Requirements Analysis
There are numerous diverse groups on campus that bring convenience to our lives. Among them, the 'Duxia High-Speed Rail G136', namely the Library Milk Tea Bulk Order Group, is particularly popular. However, the challenge for milk tea enthusiasts lies in how to quickly, efficiently, and directly access information about milk tea, vendors, and delivery personnel to streamline the ordering and delivery process. Similarly, delivery personnel and vendors are keen to obtain order information directly and make timely service adjustments. To address these issues, we have designed a specialized database system for milk tea delivery, aiming to serve milk tea enthusiasts, delivery personnel, and vendors.

In the past, when ordering milk tea in QQ groups, we encountered the following problems:
1. Buyers cannot access ratings and sales figures for each type of milk tea.
2. All parties cannot obtain all order information.
3. Buyers cannot tip or rate delivery personnel.
4. Buyers cannot rate milk tea.
5. Delivery personnel cannot access tipping information.
6. Vendors cannot add new products.
7. Cannot ensure the rationality of delivery personnel's work.
8. Cannot guarantee consistency in order numbers, delivery personnel, and buyers.

To address these issues, we categorized the requirements into:
1. Milk tea information queries.
2. Order information queries.
3. Updating milk tea information.
4. Updating delivery personnel information.

#### (2) System Functions
Our Milk Tea Delivery Query System database simulates relevant data for milk tea, vendors, buyers, and delivery personnel, including information about milk tea (name, specifications, temperature, sweetness, etc.), vendor information (store name, vendor address), buyer information (buyer name, buyer address), delivery personnel information, orders, and relevant information about pickup and delivery. The system mainly includes the following functions:

- Restriction functions for adding and modifying data.
- Vendor-related functions.
  - Merchants obtain information on incomplete orders.
  - Merchants query all order information.
- Buyer-related functions.
  - Buyers query the sales and ratings of a specific type of milk tea.
  - Buyers query order information.
  - Buyers rate and tip delivery personnel and milk tea.
- Delivery personnel-related functions.
  - Delivery personnel obtain relevant information.
  - Delivery personnel query tipping situations.
