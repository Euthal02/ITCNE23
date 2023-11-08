#!/usr/bin/python3

class Notifier:
    def notify(self, subject, message):
        print('Subject ist %s' % subject)
        print('Message ist %s' % message)


class SmsNotifier(Notifier):

    def __init__(self, contact):
        self.contact = contact

    def send(self, subject, message):
        # send the actual notification
        self.notify(subject, message)


class EmailNotifier(Notifier):

    def __init__(self, contact):
        self.contact = contact

    def send(self, subject, message):
        # send the actual notification
        self.notify(subject, message)


class MultiNotifier(Notifier):

    def __init__(self, notifiers):
        self.notifiers = notifiers

    def send(self, subject, message):
        for notifier in self.notifiers:
            # send the actual notification
            notifier.send(subject, message)


class InstanzChecker:

    def __init__(self, instanzid, notifier, schwellwerte):
        self.dennis = instanzid
        self.notifier = notifier
        self.limits = schwellwerte
        self.values = dict()

    def get_real_values(self):
        # would query aws here, for poc, static values
        for indicator in self.limits.keys():
            self.values[indicator] = 69

    def check(self):
        # get real values from aws
        self.get_real_values()

        for indicator in self.limits.keys():
            if self.limits[indicator][0] < self.values[indicator] < self.limits[indicator][1]:
                return False
            else:
                return True

    def notify(self):
        self.notifier.send()

    def check_and_notify(self):
        # isolate checker and notifier
        do_notify = self.check()
        if do_notify:
            self.notify()


if __name__ == '__main__':
    smsNotifier_armin = SmsNotifier('0794194111')
    emailNotifier_roger = EmailNotifier('roger.mueller@edu.tbz.ch')

    instanzes = [
        InstanzChecker(
            instanzid='i-1235134123',
            notifier=smsNotifier_armin,
            schwellwerte={'cpu': [0, 60], 'memory': [0, 90]}),
        InstanzChecker(
            instanzid='i-1235134542',
            notifier=emailNotifier_roger,
            schwellwerte={'cpu': [0, 50], 'memory': [0, 95]}
        ),
        InstanzChecker(
            instanzid='i-3435134123',
            notifier=MultiNotifier(
                [smsNotifier_armin, emailNotifier_roger]),
            schwellwerte={'cpu': [0, 100], 'memory': [10, 60]})
    ]

    for instanz in instanzes:
        print(instanz.values)
        instanz.check_and_notify()
        print(instanz.values)
        break
