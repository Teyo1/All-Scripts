# Define the mapping function
def number_to_letter(number):
    # Convert number to corresponding letter (1 -> A, 2 -> B, ..., 26 -> Z)
    return chr(number + 64)

# List of numbers
numbers = [x, x, x, x, x, x, x, x, x, x, x, x, x, x, x]

# Convert numbers to letters
decoded_message = ''.join(number_to_letter(num) for num in numbers)

print(f"Decoded message: {decoded_message}")
