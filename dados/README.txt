

Client Cancellations0.csv
Client Cancellations are bookings that have been canceled. The set of all bookings is the union of Client Cancellations and Future Bookings.

  Cancel Date:The date the customer canceled the appointment.
  Code:The unique client code.
  Service:The service code for the booking. (e.g., SHCW - women's hair cut)
  Staff:The staff member to provide the service.
  Booking Date:The date the service is scheduled to be provided.
  Canceled By:The staff member who canceled the service.
  Days:The number of days between the Booking Date and the Cancel Date.

Future Bookings (All Clients)0.csv
Future bookings is the set of all uncanceled bookings. The set of all bookings is the union of Client Cancellations and Future Bookings.

  Code:The unique client code.
  Staff:The staff member to provide the service.
  Service:The service code for the booking. (e.g., SHCW - women's hair cut)
  Date:The date the service is scheduled to be provided.
  Time:The time the service is scheduled to be provided.

No-Show Report0.csv
The is a listing of no-show bookings that were not canceled prior to the booking date. This set does not include out-of-policy cancelations so for the purpose of the analysis I recreated the no-shows in the wrangled dataframe.

  Date:The date the service was scheduled to be provided.
  Code:The unique client code.
  Service:The service code for the booking. (e.g., SHCW - women's hair cut)
  Staff:The staff member who was to provide the service.

Receipt Transactions0.csv
This is a list of all of the transactions with receipts. I use this to determine 1) if revenue was generated for each booking and 2) if a product was purchased. Revenue generation is used as part of the no-show logic.

  Receipt:The receipt number.
  Date:The date of the transaction.
  Description:The service or product name.
  Client:The unique client code.
  Staff:The staff member who provided the service or sold the product.
  Quantity:The number of services or product sold.
  Amount:The total dollar amount.
  GST:Federal tax amount.
  PST:Provincial tax amount.

Service Listing0.csv
This is a listing of all services. This information is required to join bookings with receipts.

  IsActive:Is this an active service?
  Code:The service code. (e.g., SHCW - women's hair cut)
  Desc:The service name.
  Cate:The service category (e.g., Balayage is in the COLOR category.)
  Price:The regular price of the service. (Note: price varies across staff so this is not precise.)
  Cost:This is the amount the staff pays to the salon for professional product costs.