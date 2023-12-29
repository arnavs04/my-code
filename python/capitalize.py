string = input("Enter phrase: ")
string.lower()
list = string.split(" ")
for word in list:
    print(word.capitalize(), end = " ")

# phrase = input("Enter phrase: ")
# print(" ".join(word.capitalize() for word in phrase.split()))
