Number to Letter Decoder (Python)

This Python script maps a list of numbers (1–26) to their corresponding uppercase
letters (A–Z) in the English alphabet. It’s great for decoding numeric messages.

---

Usage:
1. Replace the values in the `numbers` list with your own list of numbers between 1 and 26.
2. Run the script.
3. The script will print the decoded alphabetic message.

Example:
If you set:
    numbers = [8, 5, 12, 12, 15]
Then the output will be:
    Decoded message: HELLO

---

Code Reference:
def number_to_letter(number):
    return chr(number + 64)

numbers = [8, 5, 12, 12, 15]
decoded_message = ''.join(number_to_letter(num) for num in numbers)
print(f"Decoded message: {decoded_message}")

---

Useful for:
- CTFs (Capture The Flag challenges)
- Simple encryption/decryption
- Educational purposes
