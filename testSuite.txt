test is defined by mesh files + data.inp file + config file (which defines number of nodes)
tests run in two modes:
    1 - benchmark (i.e. create all benchmark data) -> creates 'bench' folders by copying test dirs with cp -al
    2 - test (i.e. run all tests and compare) -> creates 'testInstance' folders by copying test dirs with cp -al
