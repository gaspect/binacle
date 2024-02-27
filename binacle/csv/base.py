import csv as builtin_csv


def csv(file, delimiter=",", encoding="iso-8859-1"):  # We use lating encodin by default becouse we are latin so...
    with open(file, encoding=encoding) as csvfile:
        data = builtin_csv.reader(csvfile, delimiter=delimiter)
        next(data)  # Jump firs file
        return list(data)
