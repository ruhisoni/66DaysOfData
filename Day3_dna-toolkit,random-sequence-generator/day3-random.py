import random

bases = ["A", "C", "T", "G"]
RandomSeq=''.join(random.choice(bases) for base in range(25))

print(RandomSeq)
