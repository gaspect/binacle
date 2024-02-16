import csv as builtin_csv


def csv(file):
    with open(file, encoding="iso-8859-1") as csvfile:
        data = builtin_csv.reader(csvfile)
        next(data)  # Jump firs file
        return list(data)
