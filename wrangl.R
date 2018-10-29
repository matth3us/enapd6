library(tidyverse)
library(lubridate)
clien_canc <- read.csv('./dados/Client Cancellations0.csv') %>% 
                mutate(
                  Date = mdy(Booking.Date),
                  Client = Code,
                  Booking.Date = NULL, 
                  Status = as.factor("cancelled"), 
                  Sold = Service
                ) %>% 
                select(Date, Client, Sold, Status)


future_books <- read.csv("./dados/Future Bookings (All Clients)0.csv" ) %>% 
                mutate(
                  Date = mdy(Date),
                  Client = Code,
                  Sold = Service,
                  Status = as.factor("future")
                ) %>% 
                select(Date, Client, Sold, Status)


no_show <- read.csv("./dados/No-Show Report0.csv") %>% 
              mutate(
                Date = mdy(Date),
                Client = Code,
                Sold = Service,
                Status = as.factor('no show')
              ) %>% 
              select(Date, Client, Sold, Status)

service_list <- read.csv("./dados/Service Listing0.csv") %>%  mutate(Service.code = Code) %>% select(Desc, Service.code) 
product_list <- read.csv("./dados/Product Listing (Retail)0.csv") %>%  mutate(Product.code = Code) %>%  select(Description, Product.code) 
receipts <- read.csv("./dados/Receipt Transactions0.csv") %>% 
              mutate(
                Date = mdy(Date),
                Sold = Description,
                Net.amount = Amount - GST - PST
              ) %>% 
              select(Date, Client, Sold, Quantity, Amount, GST, PST, Net.amount) %>% 
              left_join(service_list, by=c('Sold' = 'Desc')) %>% 
              left_join(product_list, by=c('Sold' = 'Description')) %>% 
              mutate(
                Service.code = as.character(Service.code), 
                Product.code = as.character(Product.code)
                ) %>% 
              replace_na(list(Service.code = '', Product.code = '')) %>% 
              unite(new.Sold, Service.code, Product.code, sep='') %>% 
              select(-Sold) %>% 
              mutate(
                Sold = new.Sold,
                Status = 'past'
              ) %>% 
              select(Date, Client, Sold, Status, Amount, GST, PST, Net.amount)

bookings <- clien_canc %>% 
              bind_rows(future_books) %>% 
              bind_rows(no_show) %>% 
              bind_rows(receipts)

rm(clien_canc, future_books, no_show, product_list, receipts, service_list)





