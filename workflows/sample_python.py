import digdag


class SampleTask:
    def hello(self):
        print("Hello from py> operator!")
        digdag.env.store({"result": "success"})
