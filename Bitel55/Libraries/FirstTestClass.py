from robot.libraries.BuiltIn import BuiltIn


class FirstTestClass:

    def __init__(self):
        self.value = 'first'
        BuiltIn().log_to_console("Initializing: " + self.value)

    def change_value(self, new_value):
        BuiltIn().log_to_console(self.value)
        self.value = new_value
        BuiltIn().log_to_console(self.value)
