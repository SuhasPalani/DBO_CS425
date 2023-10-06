from faker import Faker
import random
import math

fake = Faker()

# Create a list to store the generated data
customer_data = []

for _ in range(20):
    lot_id = _ + 1  # Primary key, incrementing by 1 for each record
    lot_name = fake.name()
    location = fake.city()
    total_spots = random.randint(0,100)
    available_spots = abs(total_spots-random.randint(0,100))
    emp_id=
    address = fake.address()
    user_name = fake.user_name()
    # Generating a random password (for demonstration purposes)
    password = fake.password(length=random.randint(8, 12), special_chars=True, digits=True, upper_case=True, lower_case=True)
    
    customer_record = (customer_id, first_name, last_name, email, phone_number, address, user_name, password)
    customer_data.append(customer_record)

# Print the generated data
for record in customer_data:
    print(record)