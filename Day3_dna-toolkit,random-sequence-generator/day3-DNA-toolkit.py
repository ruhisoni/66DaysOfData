import collections

dna = input("Enter DNA sequence of interest: ")
dna=dna.upper()

#ensuring the sequence only contains DNA nucleotides
def ValidateSeq(dna):
    bases = ["A", "C", "T", "G"]
    valid = True
    for nuc in dna:
        if nuc not in bases:
            valid = False; break
    return valid

print(ValidateSeq(dna))

#method 1 of counting nucleotides in the sequence
def CountNuc1(dna):
    basecount = {"A":0, "C":0, "T":0, "G":0}
    for base in dna:
        basecount[base] += 1
    return basecount

print(CountNuc1(dna))

#method 2 of counting nucleotides in the sequence
def CountNuc2(dna):
    return dict(collections.Counter(dna))

print(CountNuc2(dna))

#def GC(smalldna):
    #number_g=smalldna.count("c")
    #number_c=smalldna.count("g")
    #number_n=smalldna.count("n")
    #gc=(number_g+number_c)*100/(len(dna)-number_n)
    #return gc

#print("The GC content is", GC(smalldna), "%")
