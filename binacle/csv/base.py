import csv as builtin_csv


def csv(file, delimiter=","):
    with open(file, encoding="iso-8859-1") as csvfile:
        data = builtin_csv.reader(csvfile, delimiter=delimiter)
        next(data)  # Jump firs file
        return list(data)
