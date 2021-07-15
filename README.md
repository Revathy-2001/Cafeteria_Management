Heroku link(project link) : https://cafeteria-management-201.herokuapp.com/

Admin Details:

Email: admincms@gmail.com
password: Admin@cms

Clerk Details:

Email: clerk1cms@gmail.com
password: Clerk1@cms

Cafeteria Management System

Cafeteria Management System has three roles custumer,admin and billing clerks.

Clerks:
a) Clerks can see all orders placed by customers
b) Clerks can create an order and his status will be assigned as walk-in-customer.
c) They can also mark orders as “delivered”.

Owners:
a) Owner can manage the menu
b) Owner can see reports
c) Owner can manage users

Customer:
a) Customer should be able to Sign-up
b) Customer can see the menu and add items to cart
c) Customer should see the cart while ordering
d) Customer can finalize the order with a “checkout” button
e) Customer can see the status of orders
f) The shopping cart should be durable and available across sessions

Security:

CSRF attacks that is cross site request forgery attacks are prevented by my application because I used form_with
rails helper tag which generates a authenticity token so whenever a request hits controller action it knows request
is coming from our application.

Home-page
![home_page](https://user-images.githubusercontent.com/77260440/124909439-10bb4280-e008-11eb-99cc-ad174214fd03.png)

Sign-up page
![sign_in](https://user-images.githubusercontent.com/77260440/124909457-14e76000-e008-11eb-9345-05ad2eea56d5.png)

Sign-in page
![sign_up](https://user-images.githubusercontent.com/77260440/124909476-1add4100-e008-11eb-96ab-c7136393d358.png)

ADMIN'S ACCESS:

Dashboard Page:
![Screenshot (490)](https://user-images.githubusercontent.com/77260440/125746379-be44cdcc-a182-464c-878f-cd1418fcf35a.png)

MENU CATEGORY: [VIEW,ADD,UPDATE,DELETE]

![categories_admin](https://user-images.githubusercontent.com/77260440/124909408-08630780-e008-11eb-8880-5ead94e07e8a.png)

![category-options-admin](https://user-images.githubusercontent.com/77260440/124909415-0a2ccb00-e008-11eb-89b0-09cd1432a306.png)

![add_category](https://user-images.githubusercontent.com/77260440/124909323-eec1c000-e007-11eb-870e-735da4c56e56.png)

![update-category](https://user-images.githubusercontent.com/77260440/124909481-1c0e6e00-e008-11eb-9e0a-4ab7b744f4e8.png)

![delete_category](https://user-images.githubusercontent.com/77260440/124909437-0f8a1580-e008-11eb-8704-af4847aabb8a.png)

MENU ITEM: [VIEW,ADD,UPDATE,DELETE]

![menu_items_admin](https://user-images.githubusercontent.com/77260440/124909445-12850600-e008-11eb-9cc3-6ce00c5b304c.png)

![menu_item_options_admin](https://user-images.githubusercontent.com/77260440/124909442-11ec6f80-e008-11eb-9dea-4c992a0d7045.png)

![update-menu-item](https://user-images.githubusercontent.com/77260440/124909483-1d3f9b00-e008-11eb-8c2f-bf64516c64b0.png)

OTHER ADMIN ACCESS: [UPDATE PROFILE,ADD CLERK OR OWNER,ORDERS]

Single order of a customer
![single_order_of_customer](https://user-images.githubusercontent.com/77260440/125747058-e1f7d40a-a90e-4b1f-b72e-fb83de4ab4da.png)

All orders of a customers
![Screenshot (498)](https://user-images.githubusercontent.com/77260440/125747520-b3c5285b-6250-45b9-9a5b-6ea19fbb85a5.png)

Reports:
Customers reports
![Screenshot (492)](https://user-images.githubusercontent.com/77260440/125749312-ace0efab-fa6b-4042-9a8c-4e256ca83ff4.png)

Single customer reports
![Screenshot (495)](https://user-images.githubusercontent.com/77260440/125749367-03febb5f-386d-4f1b-bef6-c41ef2e80611.png)

Manage Users:
Create clerks or other owners
![add_clerk](https://user-images.githubusercontent.com/77260440/124909375-000acc80-e008-11eb-8145-67085d52ad5f.png)

Update clerks or other owners
![Screenshot (500)](https://user-images.githubusercontent.com/77260440/125747991-a7ae3c7f-1d95-4778-b487-800046ee64a9.png)

Delete clerks or other clerks
![Screenshot (501)](https://user-images.githubusercontent.com/77260440/125747984-e7099c64-19f2-42db-81a2-30758538d56a.png)

Update Profile or owner
![admin-update-profile](https://user-images.githubusercontent.com/77260440/124909383-01d49000-e008-11eb-9524-11565a4dcbd8.png)

CUSTOMER's ACCESS:

home page for customers
![categories](https://user-images.githubusercontent.com/77260440/124909395-0436ea00-e008-11eb-85ff-1d00c2701eb5.png)

ordering page
![menu_items-users](https://user-images.githubusercontent.com/77260440/124909449-131d9c80-e008-11eb-9dd7-1a025648a837.png)

cart items
![cart-items](https://user-images.githubusercontent.com/77260440/124909390-0305bd00-e008-11eb-8b3c-bf9d71b469b1.png)

clear cart
![clearcart](https://user-images.githubusercontent.com/77260440/124909421-0bf68e80-e008-11eb-8a0c-99960f027c56.png)

address page
![add-address](https://user-images.githubusercontent.com/77260440/124909380-013bf980-e008-11eb-9d48-ddcb8f58c449.png)

update address
![update-address](https://user-images.githubusercontent.com/77260440/124909477-1b75d780-e008-11eb-8a2e-4f8aefffd88c.png)

checkout page
![checkout-page](https://user-images.githubusercontent.com/77260440/124909417-0ac56180-e008-11eb-9ee6-13bc00f71475.png)

customers order page
![customer-orders](https://user-images.githubusercontent.com/77260440/124909430-0dc05200-e008-11eb-9065-f219870858fa.png)

all orders
![orders](https://user-images.githubusercontent.com/77260440/124909454-144ec980-e008-11eb-9f58-e4f112d4148e.png)

User profile
![user-profile](https://user-images.githubusercontent.com/77260440/124909485-1dd83180-e008-11eb-97f8-6987aaf9f306.png)

CLERK'S ACCESS:
Clerk-home page
![clerk-home-page](https://user-images.githubusercontent.com/77260440/124909429-0d27bb80-e008-11eb-8e52-7619680c1d21.png)
