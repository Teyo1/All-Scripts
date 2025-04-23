Base-3 to Decimal Converter (Python)

This simple Python script takes a number represented in base-3 (ternary) format 
and converts it into its decimal (base-10) equivalent.

---

Usage:
1. Replace the variable `number_base3` with your base-3 number as a string.
2. Run the script.
3. It will print the decimal equivalent of the base-3 number.

Example:
If you set:
    number_base3 = "2010"
Then the output will be:
    57

---

Code Reference:
def base3_to_decimal(base3_str):
    return int(base3_str, 3)

number_base3 = "2010"
decimal_number = base3_to_decimal(number_base3)
print(decimal_number)  # Output: 57

---

This is useful for educational purposes or quick conversions from base-3 to base-10.
