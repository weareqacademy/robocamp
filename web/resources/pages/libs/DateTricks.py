from datetime import date

class DateTricks():

    def get_start_date(self):
        today = date.today()

        # mm/dd/yyyy
        fdate = today.strftime('%m%d%Y')

        print(fdate)

        a_chars = []

        for number in fdate:
            a_chars.append(number)

        return a_chars