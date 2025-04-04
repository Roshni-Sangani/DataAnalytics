#  Sample string:
#  'w3resource' Expected output: 
# • {'3': 1,’s’: 1, 'r': 2, 'u': 1, 'w': 1, 'c': 1, 'e': 2, 'o': 1} 

str = 'w3resource'

print({char: str.count(char) for char in str})
