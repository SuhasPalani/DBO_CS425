from faker import Faker
import random

fake = Faker()

# Create a list to store the generated data
customer_data = []

# Generate 20 customer records
for _ in range(8):
    lot_id = _ + 1008  # Primary key, incrementing by 1 for each record
    lot_name = fake.name()
    location = fake.street_address()
    total_spots = random.randint(0,30)
    available_spots = abs(30-total_spots)
    emp_id= random.randint(1,8)
    # Generating a random password (for demonstration purposes)
    password = fake.password(length=random.randint(8, 12), special_chars=True, digits=True, upper_case=True, lower_case=True)
    
    customer_record = (lot_id,lot_name,location,total_spots,available_spots,emp_id)
    customer_data.append(customer_record)

# Print the generated data
for record in customer_data:
    print(record)
    print(",")
