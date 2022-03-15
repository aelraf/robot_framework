from selenium.webdriver.common.by import By


class NewSeleniumLibrary:
    EMAIL = None

    @property
    def get_current_web_driver(self):
        selenium_library = BuiltIn().get_library_instance()
        return selenium_library.driver

    @property
    def get_current_driver(self):
        pass
